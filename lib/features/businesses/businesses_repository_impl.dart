import 'package:dio/dio.dart';
import 'package:ibivibe/core/cache/cache_database_service.dart';
import 'package:ibivibe/core/logger/handlers/repository_log_handler.dart';
import 'package:ibivibe/core/logger/log_tags.dart';
import 'package:ibivibe/core/network/dio_exception_to_app_exception_mapper.dart';
import 'package:ibivibe/shared/models/business.dart';
import 'package:ibivibe/features/businesses/business_repository.dart';
import 'package:ibivibe/features/businesses/models/business_model.dart';
import 'package:ibivibe/features/businesses/models/business_public_profile_model.dart';
import 'package:logger/logger.dart';

class BusinessesRepositoryImpl
    with RepositoryLogHandler
    implements BusinessesRepository {
  @override
  final Logger logger;
  final Dio dio;
  final CacheDatabaseService cacheService;

  static const _storeName = 'businesses_cache';
  static const _allBusinessesKey = 'all_businesses';
  static const _maxAge = Duration(days: 7);

  BusinessesRepositoryImpl({
    required this.logger,
    required this.dio,
    required this.cacheService,
  });

  @override
  LogFeature get feature => LogFeature.businesses;

  @override
  Future<List<Business>> getAllBusinesses({bool forceRefresh = false}) async {
    if (!forceRefresh) {
      final cached = await cacheService.getList<Business>(
        storeName: _storeName,
        key: _allBusinessesKey,
        fromJson: BusinessModel.fromJson,
        maxAge: _maxAge,
      );
      if (cached.isNotEmpty) return cached;
    }

    final response = await dio.get('/businesses');
    final result = BusinessModel.fromJsonList(response.data);
    await cacheService.saveList<Business>(
      storeName: _storeName,
      key: _allBusinessesKey,
      items: result,
      toMap: BusinessModel.toMap,
    );
    return result;
  }

  @override
  Future<Business?> getBusinessById(String id) async {
    final individual = await cacheService.getObject<Business>(
      storeName: _storeName,
      key: 'business_$id',
      fromJson: (json) => BusinessModel.fromJson(json),
      maxAge: _maxAge,
    );
    if (individual != null) return individual;

    final cached = await cacheService.getList<Business>(
      storeName: _storeName,
      key: _allBusinessesKey,
      fromJson: BusinessModel.fromJson,
      maxAge: _maxAge,
    );
    final fromList = cached.cast<Business?>().firstWhere(
      (b) => b?.id == id,
      orElse: () => null,
    );
    if (fromList != null) return fromList;

    final response = await dio.get('/businesses/$id');
    final result = BusinessModel.fromJson(response.data);
    await cacheService.saveObject<Business>(
      storeName: _storeName,
      key: 'business_$id',
      item: result,
      toMap: BusinessModel.toMap,
    );
    return result;
  }

  @override
  Future<Business?> getBusinessByAccountId(String accountId) async {
    // Após o onboarding, a lista em cache pode ter sido carregada antes da
    // criação da empresa. Esta consulta precisa refletir o estado do backend.
    final businesses = await getAllBusinesses(forceRefresh: true);
    return businesses.cast<Business?>().firstWhere(
      (business) => business?.accountId == accountId,
      orElse: () => null,
    );
  }

  @override
  Future<BusinessPublicProfileModel> getPublicProfile(String id) async {
    try {
      final response = await dio.get('/businesses/$id/public-profile');
      return BusinessPublicProfileModel.fromJson(
        Map<String, dynamic>.from(response.data as Map),
      );
    } on DioException catch (e) {
      throw DioExceptionToAppExceptionMapper.map(e);
    }
  }

  @override
  Future<void> updateBusinessProfile({
    required String businessId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await dio.patch('/businesses/$businessId/profile', data: data);
    } on DioException catch (e) {
      throw DioExceptionToAppExceptionMapper.map(e);
    }
  }

  @override
  Future<BusinessContactModel> getBusinessContact(String businessId) async {
    try {
      final response = await dio.get('/businesses/$businessId/contact');
      return BusinessContactModel.fromJson(
        Map<String, dynamic>.from(response.data as Map),
      );
    } on DioException catch (e) {
      throw DioExceptionToAppExceptionMapper.map(e);
    }
  }

  @override
  Future<void> updateBusinessContact({
    required String businessId,
    required BusinessContactModel contact,
  }) async {
    try {
      await dio.patch(
        '/businesses/$businessId/contact',
        data: contact.toJson(),
      );
    } on DioException catch (e) {
      throw DioExceptionToAppExceptionMapper.map(e);
    }
  }

  @override
  Future<void> updateBusinessTags({
    required String businessId,
    required List<String> tagIds,
  }) async {
    try {
      await dio.put('/businesses/$businessId/tags', data: {'tag_ids': tagIds});
    } on DioException catch (e) {
      throw DioExceptionToAppExceptionMapper.map(e);
    }
  }

  @override
  Future<void> createBusiness({
    required String accountId,
    required String name,
    required String cnpj,
    required String headquartersCityId,
    required List<String> branchCityIds,
  }) async {
    try {
      await dio.post(
        '/businesses/onboarding',
        data: {
          'name': name,
          'cnpj': cnpj,
          'headquarters_city_id': headquartersCityId,
          'branch_city_ids': branchCityIds,
        },
      );
    } on DioException catch (e) {
      throw DioExceptionToAppExceptionMapper.map(e);
    }
  }
}

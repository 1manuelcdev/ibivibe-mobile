import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ibiapabaapp/core/errors/failures/failures.dart';
import 'package:ibiapabaapp/core/network/dio_exception_to_app_exception_mapper.dart';
import 'package:ibiapabaapp/features/profiles/data/datasources/profiles_remote_datasource.dart';
import 'package:ibiapabaapp/features/profiles/domain/entities/profile.dart';
import 'package:ibiapabaapp/features/profiles/domain/entities/profile_interests.dart';
import 'package:ibiapabaapp/features/profiles/domain/entities/profile_interests_response.dart';
import 'package:ibiapabaapp/features/profiles/infra/models/profile_interests_response_model.dart';
import 'package:ibiapabaapp/features/profiles/infra/models/profile_model.dart';

class ProfilesRemoteDatasourceImpl implements ProfilesRemoteDatasource {
  final Dio dio;
  ProfilesRemoteDatasourceImpl({required this.dio});

  @override
  Future<Either<AppFailure, List<Profile>>> getAccountProfiles() async {
    try {
      final response = await dio.get('/profiles');

      final data = response.data;
      if (data == null) {
        return const Right([]);
      }

      final mapped = ProfileModel.fromJsonList(data);
      return Right(mapped);
    } on DioException catch (e) {
      throw DioExceptionToAppExceptionMapper.map(e);
    }
  }

  @override
  Future<Either<AppFailure, ProfileInterests>> getProfileInterests(
    String profileId,
  ) async {
    try {
      final response = await dio.get('/profiles/$profileId/interests');

      final data = response.data;
      if (data == null) {
        return const Right(ProfileInterests.empty());
      }

      return Right(ProfileInterests.fromJson(data));
    } on DioException catch (e) {
      throw DioExceptionToAppExceptionMapper.map(e);
    }
  }

  @override
  Future<Either<AppFailure, ProfileInterestsResponse>> updateProfileInterests({
    required String profileId,
    required ProfileInterests interests,
  }) async {
    try {
      final response = await dio.post(
        '/profiles/$profileId/interests',
        data: ProfileInterests.toMap(interests),
      );
      final data = response.data;
      return Right(ProfileInterestsResponseModel.fromJson(data));
    } on DioException catch (e) {
      throw DioExceptionToAppExceptionMapper.map(e);
    }
  }
}

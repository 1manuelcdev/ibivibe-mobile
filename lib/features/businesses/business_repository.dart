import 'package:ibivibe/shared/models/business.dart';
import 'package:ibivibe/features/businesses/models/business_public_profile_model.dart';

abstract class BusinessesRepository {
  Future<List<Business>> getAllBusinesses({bool forceRefresh = false});
  Future<Business?> getBusinessById(String id);
  Future<Business?> getBusinessByAccountId(String accountId);
  Future<BusinessPublicProfileModel> getPublicProfile(String id);
  Future<void> updateBusinessProfile({
    required String businessId,
    required Map<String, dynamic> data,
  });
  Future<BusinessContactModel> getBusinessContact(String businessId);
  Future<void> updateBusinessContact({
    required String businessId,
    required BusinessContactModel contact,
  });
  Future<void> updateBusinessTags({
    required String businessId,
    required List<String> tagIds,
  });
  Future<void> createBusiness({
    required String accountId,
    required String name,
    required String cnpj,
    required String headquartersCityId,
    required List<String> branchCityIds,
  });
}

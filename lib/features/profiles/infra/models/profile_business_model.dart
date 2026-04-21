import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibiapabaapp/features/businesses/domain/entities/business.dart';
import 'package:ibiapabaapp/features/profiles/domain/entities/profile_business.dart';

part 'profile_business_model.freezed.dart';
part 'profile_business_model.g.dart';

@freezed
abstract class ProfileBusinessModel
    with _$ProfileBusinessModel
    implements ProfileBusiness {
  const ProfileBusinessModel._();

  const factory ProfileBusinessModel({
    @Default('') String id,
    String? cnpj,
    @JsonKey(unknownEnumValue: ReachLevel.local, name: 'max_reach_level')
    required ReachLevel maxReachLevel,
    @Default([]) List<String> categories,
  }) = _ProfileBusinessModel;

  factory ProfileBusinessModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileBusinessModelFromJson(json);

  static List<ProfileBusiness> fromJsonList(dynamic jsonList) {
    if (jsonList == null) return [];
    return (jsonList as List<dynamic>)
        .map(
          (json) => ProfileBusinessModel.fromJson(json as Map<String, dynamic>),
        )
        .toList();
  }

  static Map<String, dynamic> toMap(ProfileBusiness business) {
    if (business is ProfileBusinessModel) return business.toJson();
    return ProfileBusinessModel(
      id: business.id,
      cnpj: business.cnpj,
      maxReachLevel: business.maxReachLevel,
      categories: business.categories,
    ).toJson();
  }
}

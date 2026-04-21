import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibiapabaapp/features/profiles/domain/entities/profile.dart';
import 'package:ibiapabaapp/features/profiles/domain/entities/profile_interests.dart';
import 'package:ibiapabaapp/features/profiles/infra/models/profile_business_model.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

ProfileInterests? _profileInterestsFromJson(Map<String, dynamic>? json) {
  if (json == null) return null;
  return ProfileInterests.fromJson(json);
}

Map<String, dynamic>? _profileInterestsToJson(ProfileInterests? interests) {
  if (interests == null) return null;
  return ProfileInterests.toMap(interests);
}

@freezed
abstract class ProfileModel with _$ProfileModel implements Profile {
  const ProfileModel._();

  const factory ProfileModel({
    @Default('') String id,
    @Default('') String slug,
    @JsonKey(name: 'display_name') required String displayName,
    @Default('') String bio,
    @JsonKey(name: 'avatar_url') @Default('') String avatarUrl,
    required ProfileType type,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(
      fromJson: _profileInterestsFromJson,
      toJson: _profileInterestsToJson,
    )
    ProfileInterests? interests,
    ProfileBusinessModel? business,
    @JsonKey(name: 'role', defaultValue: null) BusinessRole? businessRole,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  static List<Profile> fromJsonList(dynamic jsonList) {
    if (jsonList == null) return [];
    return (jsonList as List<dynamic>)
        .map((json) => ProfileModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  static Map<String, dynamic> toMap(Profile profile) => {
    'id': profile.id,
    'slug': profile.slug,
    'display_name': profile.displayName,
    'bio': profile.bio,
    'avatar_url': profile.avatarUrl,
    'type': profile.type.name,
    'interests': profile.interests != null
        ? ProfileInterests.toMap(profile.interests!)
        : null,
    'business': profile.business != null
        ? ProfileBusinessModel.toMap(profile.business!)
        : null,
    'role': profile.businessRole?.name,
    'created_at': profile.createdAt.toIso8601String(),
    'updated_at': profile.updatedAt.toIso8601String(),
  };
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) =>
    _ProfileModel(
      id: json['id'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      displayName: json['display_name'] as String,
      bio: json['bio'] as String? ?? '',
      avatarUrl: json['avatar_url'] as String? ?? '',
      type: $enumDecode(_$ProfileTypeEnumMap, json['type']),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      interests: _profileInterestsFromJson(
        json['interests'] as Map<String, dynamic>?,
      ),
      business: json['business'] == null
          ? null
          : ProfileBusinessModel.fromJson(
              json['business'] as Map<String, dynamic>,
            ),
      businessRole: $enumDecodeNullable(_$BusinessRoleEnumMap, json['role']),
    );

Map<String, dynamic> _$ProfileModelToJson(_ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'display_name': instance.displayName,
      'bio': instance.bio,
      'avatar_url': instance.avatarUrl,
      'type': _$ProfileTypeEnumMap[instance.type]!,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'interests': _profileInterestsToJson(instance.interests),
      'business': instance.business,
      'role': _$BusinessRoleEnumMap[instance.businessRole],
    };

const _$ProfileTypeEnumMap = {
  ProfileType.personal: 'personal',
  ProfileType.business: 'business',
};

const _$BusinessRoleEnumMap = {
  BusinessRole.owner: 'owner',
  BusinessRole.admin: 'admin',
  BusinessRole.editor: 'editor',
  BusinessRole.viewer: 'viewer',
};

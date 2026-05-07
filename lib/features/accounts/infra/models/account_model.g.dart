// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountModel _$AccountModelFromJson(Map<String, dynamic> json) =>
    _AccountModel(
      id: json['id'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String?,
      name: json['name'] as String,
      active: json['active'] as bool,
      isVerified: json['is_verified'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      slug: json['slug'] as String,
      displayName: json['display_name'] as String,
      bio: json['bio'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      type: $enumDecode(_$AccountTypeEnumMap, json['type']),
      interests: json['interests'] == null
          ? null
          : AccountInterestsModel.fromJson(
              json['interests'] as Map<String, dynamic>,
            ),
      business: json['business'] == null
          ? null
          : AccountBusinessModel.fromJson(
              json['business'] as Map<String, dynamic>,
            ),
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
    );

Map<String, dynamic> _$AccountModelToJson(_AccountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'name': instance.name,
      'active': instance.active,
      'is_verified': instance.isVerified,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'slug': instance.slug,
      'display_name': instance.displayName,
      'bio': instance.bio,
      'avatar_url': instance.avatarUrl,
      'type': _$AccountTypeEnumMap[instance.type]!,
      'interests': instance.interests,
      'business': instance.business,
      'gender': _$GenderEnumMap[instance.gender],
    };

const _$AccountTypeEnumMap = {
  AccountType.personal: 'personal',
  AccountType.business: 'business',
};

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.non_binary: 'non_binary',
  Gender.prefer_not_to_say: 'prefer_not_to_say',
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FavoriteModel _$FavoriteModelFromJson(Map<String, dynamic> json) =>
    _FavoriteModel(
      id: json['id'] as String?,
      accountId: json['account_id'] as String,
      cityId: json['city_id'] as String?,
      businessId: json['business_id'] as String?,
      eventId: json['event_id'] as String?,
    );

Map<String, dynamic> _$FavoriteModelToJson(_FavoriteModel instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'account_id': instance.accountId,
      'city_id': instance.cityId,
      'business_id': instance.businessId,
      'event_id': instance.eventId,
    };

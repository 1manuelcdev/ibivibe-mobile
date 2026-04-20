// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthResultModel _$AuthResultModelFromJson(Map<String, dynamic> json) =>
    _AuthResultModel(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      account: AccountModel.fromJson(json['account'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthResultModelToJson(_AuthResultModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'account': instance.account,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_interests_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileInterestsModel _$ProfileInterestsModelFromJson(
  Map<String, dynamic> json,
) => _ProfileInterestsModel(
  businesses:
      (json['businesses'] as List<dynamic>?)
          ?.map((e) => InterestModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  events:
      (json['events'] as List<dynamic>?)
          ?.map((e) => InterestModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$ProfileInterestsModelToJson(
  _ProfileInterestsModel instance,
) => <String, dynamic>{
  'businesses': instance.businesses,
  'events': instance.events,
};

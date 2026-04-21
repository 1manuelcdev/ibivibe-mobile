// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_business_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileBusinessModel _$ProfileBusinessModelFromJson(
  Map<String, dynamic> json,
) => _ProfileBusinessModel(
  id: json['id'] as String? ?? '',
  cnpj: json['cnpj'] as String?,
  maxReachLevel: $enumDecode(
    _$ReachLevelEnumMap,
    json['max_reach_level'],
    unknownValue: ReachLevel.local,
  ),
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$ProfileBusinessModelToJson(
  _ProfileBusinessModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'cnpj': instance.cnpj,
  'max_reach_level': _$ReachLevelEnumMap[instance.maxReachLevel]!,
  'categories': instance.categories,
};

const _$ReachLevelEnumMap = {
  ReachLevel.local: 'local',
  ReachLevel.regional: 'regional',
};

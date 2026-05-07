import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibiapabaapp/features/accounts/domain/entities/account_interests.dart';

part 'interest_model.freezed.dart';
part 'interest_model.g.dart';

@freezed
abstract class InterestModel with _$InterestModel implements Interest {
  const factory InterestModel({required String id, required String name}) =
      _InterestModel;

  factory InterestModel.fromJson(Map<String, dynamic> json) =>
      _$InterestModelFromJson(json);

  static Map<String, dynamic> toMap(Interest interest) => {
    'id': interest.id,
    'name': interest.name,
  };
}

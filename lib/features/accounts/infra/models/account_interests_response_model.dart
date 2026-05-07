import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibiapabaapp/features/accounts/domain/entities/account_interests_response.dart';

part 'account_interests_response_model.freezed.dart';
part 'account_interests_response_model.g.dart';

@freezed
abstract class AccountInterestsResponseModel
    with _$AccountInterestsResponseModel
    implements AccountInterestsResponse {
  const AccountInterestsResponseModel._();

  const factory AccountInterestsResponseModel({required int count}) =
      _AccountInterestsResponseModel;

  factory AccountInterestsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AccountInterestsResponseModelFromJson(json);

  static Map<String, dynamic> toMap(
    AccountInterestsResponse accountInterestsResponse,
  ) => {'count': accountInterestsResponse.count};
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibiapabaapp/features/accounts/domain/entities/account_interests.dart';
import 'package:ibiapabaapp/features/accounts/infra/models/interest_model.dart';

part 'account_interests_model.freezed.dart';
part 'account_interests_model.g.dart';

@freezed
abstract class AccountInterestsModel
    with _$AccountInterestsModel
    implements AccountInterests {
  const AccountInterestsModel._();

  const factory AccountInterestsModel({
    @JsonKey(name: 'businesses') @Default([]) List<InterestModel> businesses,
    @JsonKey(name: 'events') @Default([]) List<InterestModel> events,
  }) = _AccountInterestsModel;

  factory AccountInterestsModel.fromJson(Map<String, dynamic> json) =>
      _$AccountInterestsModelFromJson(json);

  static Map<String, dynamic> toMap(AccountInterests interests) {
    return {
      'businesses': interests.businesses
          .map(InterestModel.toMap)
          .toList(growable: false),
      'events': interests.events
          .map(InterestModel.toMap)
          .toList(growable: false),
    };
  }

  static AccountInterests toEntity(AccountInterestsModel model) {
    return AccountInterests(businesses: model.businesses, events: model.events);
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibiapabaapp/features/profiles/domain/entities/profile_interests.dart';
import 'package:ibiapabaapp/features/profiles/infra/models/interest_model.dart';

part 'profile_interests_model.freezed.dart';
part 'profile_interests_model.g.dart';

@freezed
abstract class ProfileInterestsModel with _$ProfileInterestsModel {
  const ProfileInterestsModel._();

  const factory ProfileInterestsModel({
    @JsonKey(name: 'businesses') @Default([]) List<InterestModel> businesses,
    @JsonKey(name: 'events') @Default([]) List<InterestModel> events,
  }) = _ProfileInterestsModel;

  factory ProfileInterestsModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileInterestsModelFromJson(json);

  static List<ProfileInterestsModel> fromJsonList(dynamic jsonList) {
    if (jsonList == null) return [];
    return (jsonList as List<dynamic>)
        .map(
          (json) =>
              ProfileInterestsModel.fromJson(json as Map<String, dynamic>),
        )
        .toList();
  }

  static Map<String, dynamic> toMap(ProfileInterests interests) {
    return {
      'businesses': interests.businesses
          .map(InterestModel.toMap)
          .toList(growable: false),
      'events': interests.events
          .map(InterestModel.toMap)
          .toList(growable: false),
    };
  }
}

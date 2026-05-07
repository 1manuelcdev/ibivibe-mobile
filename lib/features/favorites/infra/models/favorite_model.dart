import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibiapabaapp/features/favorites/domain/entities/favorite.dart';

part 'favorite_model.freezed.dart';
part 'favorite_model.g.dart';

@freezed
abstract class FavoriteModel with _$FavoriteModel implements Favorite {
  const FavoriteModel._();

  const factory FavoriteModel({
    @JsonKey(name: 'id', includeIfNull: false) String? id,
    @JsonKey(name: 'account_id') required String accountId,
    @JsonKey(name: 'city_id', defaultValue: null) String? cityId,
    @JsonKey(name: 'business_id', defaultValue: null) String? businessId,
    @JsonKey(name: 'event_id', defaultValue: null) String? eventId,
  }) = _FavoriteModel;

  factory FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteModelFromJson(json);

  static List<Favorite> fromJsonList(dynamic jsonList) {
    if (jsonList == null) return [];
    return (jsonList as List<dynamic>)
        .map((json) => FavoriteModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  static Map<String, dynamic> toMap(Favorite favorite) {
    return {
      'id': favorite.id,
      'account_id': favorite.accountId,
      'city_id': favorite.cityId,
      'business_id': favorite.businessId,
      'event_id': favorite.eventId,
    };
  }

  static Map<String, dynamic> mapPush(Favorite favorite) {
    return {
      'account_id': favorite.accountId,
      'city_id': favorite.cityId,
      'business_id': favorite.businessId,
      'event_id': favorite.eventId,
    };
  }
}

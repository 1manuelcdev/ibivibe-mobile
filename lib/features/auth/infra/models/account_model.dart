import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/account.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

@freezed
abstract class AccountModel with _$AccountModel implements Account {
  const factory AccountModel({
    required String id,
    required String name,
    required String email,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    required bool active,
  }) = _AccountModel;

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/auth_result.dart';
import 'account_model.dart';

part 'auth_result_model.freezed.dart';
part 'auth_result_model.g.dart';

@freezed
abstract class AuthResultModel with _$AuthResultModel implements AuthResult {
  const factory AuthResultModel({
    required String accessToken,
    required String refreshToken,
    required AccountModel account,
  }) = _AuthResultModel;

  factory AuthResultModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResultModelFromJson(json);
}

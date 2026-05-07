import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/account_business.dart';

part 'account_business_model.freezed.dart';
part 'account_business_model.g.dart';

@freezed
abstract class AccountBusinessModel
    with _$AccountBusinessModel
    implements AccountBusiness {
  const factory AccountBusinessModel({
    String? name,
    String? document,
    String? description,
    String? website,
    String? address,
    String? phone,
    String? category,
  }) = _AccountBusinessModel;

  factory AccountBusinessModel.fromJson(Map<String, dynamic> json) =>
      _$AccountBusinessModelFromJson(json);

  static Map<String, dynamic> toMap(AccountBusiness business) {
    if (business is AccountBusinessModel) return business.toJson();
    return AccountBusinessModel(
      name: business.name,
      document: business.document,
      description: business.description,
      website: business.website,
      address: business.address,
      phone: business.phone,
      category: business.category,
    ).toJson();
  }
}

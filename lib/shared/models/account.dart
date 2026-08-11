import 'package:ibivibe/shared/models/account_type.dart';
import 'package:ibivibe/features/accounts/models/account_business.dart';
import 'package:ibivibe/features/accounts/models/account_interests.dart';
import 'package:ibivibe/shared/models/gender.dart';

class Account {
  // Authentication fields
  final String id;
  final String email;
  final String? phoneNumber;
  final String name;
  final bool active;
  final bool isVerified;
  final DateTime createdAt;
  final DateTime updatedAt;

  final String slug;
  final String displayName;
  final String? bio;
  final String? avatarUrl;
  final AccountType type;
  final AccountInterests? interests;
  final AccountBusiness? business;
  final Gender? gender;

  Account({
    required this.id,
    required this.email,
    this.phoneNumber,
    required this.name,
    required this.active,
    required this.isVerified,
    required this.createdAt,
    required this.updatedAt,
    required this.slug,
    required this.displayName,
    this.bio,
    this.avatarUrl,
    required this.type,
    this.interests,
    this.business,
    this.gender,
  });
}

extension AccountCopyWith on Account {
  Account copyWith({
    String? id,
    String? email,
    String? phoneNumber,
    String? name,
    bool? active,
    bool? isVerified,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? slug,
    String? displayName,
    String? bio,
    String? avatarUrl,
    AccountType? type,
    AccountInterests? interests,
    AccountBusiness? business,
    Gender? gender,
  }) {
    return Account(
      id: id ?? this.id,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      name: name ?? this.name,
      active: active ?? this.active,
      isVerified: isVerified ?? this.isVerified,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      slug: slug ?? this.slug,
      displayName: displayName ?? this.displayName,
      bio: bio ?? this.bio,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      type: type ?? this.type,
      interests: interests ?? this.interests,
      business: business ?? this.business,
      gender: gender ?? this.gender,
    );
  }
}

import 'dart:convert';

import 'package:ibivibe/features/accounts/models/account_business_model.dart';
import 'package:ibivibe/features/accounts/models/account_interests_model.dart';
import 'package:ibivibe/features/accounts/models/account_model.dart';
import 'package:ibivibe/features/accounts/models/interest_model.dart';
import 'package:ibivibe/shared/models/account_type.dart';
import 'package:test/test.dart';

void main() {
  test('serializes AccountModel cache data as JSON-compatible values', () {
    final account = AccountModel(
      id: 'account-1',
      email: 'admin@teste.com',
      name: 'Administrador',
      active: true,
      isVerified: true,
      createdAt: DateTime.utc(2026, 8, 10),
      updatedAt: DateTime.utc(2026, 8, 10),
      slug: 'admin-user',
      displayName: 'Administrador',
      type: AccountType.personal,
      interests: const AccountInterestsModel(
        businesses: [InterestModel(id: 'business-1', name: 'Comida')],
        events: [InterestModel(id: 'event-1', name: 'Música')],
      ),
      business: const AccountBusinessModel(name: 'Negócio'),
    );

    final serialized = AccountModel.toMap(account);

    expect(serialized['interests'], isA<Map<String, dynamic>>());
    expect(serialized['business'], isA<Map<String, dynamic>>());
    expect(() => jsonEncode(serialized), returnsNormally);
  });
}

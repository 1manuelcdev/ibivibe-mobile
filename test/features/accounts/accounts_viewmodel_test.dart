import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ibivibe/core/logger/logger.dart';
import 'package:ibivibe/features/accounts/providers/accounts_providers.dart';
import 'package:ibivibe/shared/models/account.dart';
import 'package:ibivibe/shared/models/account_type.dart';
import 'package:ibivibe/shared/providers/accounts_viewmodel.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/mocks.dart';

void main() {
  late MockAccountsRepository mockRepository;
  late MockLogger mockLogger;

  Account createAccount(String id) {
    return Account(
      id: id,
      email: '$id@test.com',
      name: 'Test $id',
      active: true,
      isVerified: true,
      createdAt: DateTime(2025),
      updatedAt: DateTime(2025),
      slug: 'test-$id',
      displayName: 'Test $id',
      type: AccountType.personal,
    );
  }

  setUp(() {
    mockRepository = MockAccountsRepository();
    mockLogger = MockLogger();
  });

  test('removes an account from cache without deleting it remotely', () async {
    final activeAccount = createAccount('active');
    final cachedAccount = createAccount('cached');
    when(
      () => mockRepository.removeCachedAccount('cached'),
    ).thenAnswer((_) async {});

    final container = ProviderContainer(
      overrides: [
        accountsRepositoryProvider.overrideWithValue(mockRepository),
        loggerProvider.overrideWithValue(mockLogger),
      ],
    );
    addTearDown(container.dispose);

    final notifier = container.read(accountsViewModelProvider.notifier);
    notifier.state = AccountsData(
      activeAccount: activeAccount,
      activeAccountId: activeAccount.id,
      cachedAccounts: [activeAccount, cachedAccount],
      isLoading: false,
    );

    await notifier.removeAccountFromCache(cachedAccount.id);

    verify(() => mockRepository.removeCachedAccount(cachedAccount.id)).called(1);
    verifyNever(() => mockRepository.removeAccount(cachedAccount.id));
    expect(
      container.read(accountsViewModelProvider).cachedAccounts,
      [activeAccount],
    );
  });
}

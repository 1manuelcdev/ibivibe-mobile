import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:ibivibe/shared/models/account.dart';
import 'package:ibivibe/shared/providers/accounts_viewmodel.dart';

class ManageAccountsScreen extends ConsumerWidget {
  const ManageAccountsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountsState = ref.watch(accountsViewModelProvider);
    final accounts = accountsState.cachedAccounts;
    final activeAccountId = accountsState.activeAccountId;
    final isLoading = accountsState.isLoading;

    return SafeArea(
      child: FScaffold(
        header: _getHeader(context),
        child: Column(
          crossAxisAlignment: .start,
          spacing: 16,
          children: [
            _AccountAuthActions(
              onLogin: () => context.push('/auth/login?mode=add-account'),
              onRegister: () => context.push('/auth/register?mode=add-account'),
            ),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : accounts.isEmpty
                  ? const _EmptyAccountsState()
                  : ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: accounts.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final account = accounts[index];
                        final isActive = account.id == activeAccountId;

                        return _AccountManagementCard(
                          account: account,
                          isActive: isActive,
                          onSelect: () async {
                            if (isActive) return;

                            final switched = await ref
                                .read(accountsViewModelProvider.notifier)
                                .switchAccount(account.id);
                            if (context.mounted && switched) {
                              context.pop();
                            }
                          },
                          onDelete: isActive
                              ? null
                              : () => _showDeleteConfirmation(
                                  context,
                                  ref,
                                  account,
                                ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getHeader(BuildContext context) {
    return FHeader.nested(
      prefixes: [
        FButton.icon(
          style: FButtonStyle.ghost(),
          onPress: () => context.pop(),
          child: const Icon(Icons.arrow_back, size: 24),
        ),
      ],
      titleAlignment: .centerStart,
      title: Text('Minhas contas', style: context.theme.typography.xl),
    );
  }

  void _showDeleteConfirmation(
    BuildContext context,
    WidgetRef ref,
    Account account,
  ) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Remover conta',
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 240),
      pageBuilder: (dialogContext, _, _) {
        var isRemoving = false;

        return StatefulBuilder(
          builder: (context, setState) => Dialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Remover conta?',
                    style: context.theme.typography.xl.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Deseja remover ${account.displayName} deste dispositivo? '
                    'Esta ação não pode ser desfeita.',
                    style: context.theme.typography.base.copyWith(
                      color: context.theme.colors.mutedForeground,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: FButton(
                            style: FButtonStyle.outline(),
                            onPress: isRemoving
                                ? null
                                : () => Navigator.of(dialogContext).pop(),
                            child: const Text('Cancelar'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: FButton(
                            style: FButtonStyle.destructive(),
                            onPress: isRemoving
                                ? null
                                : () async {
                                    setState(() => isRemoving = true);
                                    await ref
                                        .read(
                                          accountsViewModelProvider.notifier,
                                        )
                                        .removeAccountFromCache(account.id);
                                    if (dialogContext.mounted) {
                                      Navigator.of(dialogContext).pop();
                                    }
                                  },
                            child: isRemoving
                                ? const SizedBox(
                                    height: 18,
                                    width: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text('Remover'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
          reverseCurve: Curves.easeIn,
        );

        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: .9, end: 1).animate(curvedAnimation),
            child: child,
          ),
        );
      },
    );
  }
}

class _AccountManagementCard extends StatelessWidget {
  final Account account;
  final bool isActive;
  final VoidCallback onSelect;
  final VoidCallback? onDelete;

  const _AccountManagementCard({
    required this.account,
    required this.isActive,
    required this.onSelect,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Card(
      elevation: 0,
      color: isActive
          ? theme.colors.primary.withAlpha(18)
          : theme.colors.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: isActive
              ? theme.colors.primary.withAlpha(120)
              : theme.colors.border.withAlpha(160),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        leading: CircleAvatar(
          backgroundImage: account.avatarUrl != null
              ? NetworkImage(account.avatarUrl!)
              : null,
          child: account.avatarUrl == null
              ? Text(account.displayName[0].toUpperCase())
              : null,
        ),
        title: Text(
          account.displayName,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(account.email),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isActive) FBadge(child: const Text('Ativa')),
            if (onDelete != null)
              IconButton(
                tooltip: 'Remover conta',
                icon: const Icon(Icons.delete_outline),
                onPressed: onDelete,
              ),
          ],
        ),
        onTap: onSelect,
      ),
    );
  }
}

class _EmptyAccountsState extends StatelessWidget {
  const _EmptyAccountsState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.account_circle_outlined,
            size: 64,
            color: context.theme.colors.mutedForeground,
          ),
          const SizedBox(height: 16),
          const Text('Nenhuma conta encontrada'),
        ],
      ),
    );
  }
}

class _AccountAuthActions extends StatelessWidget {
  final VoidCallback onLogin;
  final VoidCallback onRegister;

  const _AccountAuthActions({required this.onLogin, required this.onRegister});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FButton(
            style: FButtonStyle.outline(),
            onPress: onLogin,
            prefix: const Icon(Icons.login_outlined),
            child: const Text('Entrar'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: FButton(
            onPress: onRegister,
            prefix: const Icon(Icons.person_add_alt_1_outlined),
            child: const Text('Criar conta'),
          ),
        ),
      ],
    );
  }
}

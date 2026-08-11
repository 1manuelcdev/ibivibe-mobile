import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:ibivibe/app/theme/custom_styles/inverted_badge.dart';
import 'package:ibivibe/shared/models/account.dart';
import 'package:ibivibe/shared/models/account_type.dart';
import 'package:ibivibe/shared/providers/accounts_viewmodel.dart';
import 'package:ibivibe/features/accounts/widgets/account_photo.dart';
import 'package:ibivibe/shared/ui/fragments/toast/show_app_toast.dart';
import 'package:ibivibe/shared/ui/layout/sheet_drag_indicator.dart';

void showAccountSwitcherSheet(BuildContext context, WidgetRef ref) {
  final parentContext = context;
  showModalBottomSheet(
    context: context,
    useRootNavigator: true,
    backgroundColor: Colors.transparent,
    enableDrag: true,
    isDismissible: true,
    isScrollControlled: true,
    builder: (_) => _AccountSwitcherSheetContent(parentContext: parentContext),
  );
}

// ─── Sheet ────────────────────────────────────────────────────────────────────
class _AccountSwitcherSheetContent extends ConsumerWidget {
  final BuildContext parentContext;

  const _AccountSwitcherSheetContent({required this.parentContext});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountsState = ref.watch(accountsViewModelProvider);
    final activeAccount = accountsState.activeAccount;
    final cachedAccounts = accountsState.cachedAccounts;

    final personalAccounts = cachedAccounts.where(
      (a) => a.type == AccountType.personal,
    );

    final businessAccounts = cachedAccounts.where(
      (a) => a.type == AccountType.business,
    );

    return SafeArea(
      child: Container(
        constraints: BoxConstraints(
          minHeight: 0,
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        decoration: BoxDecoration(
          color: context.theme.colors.secondary,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          border: Border(
            top: BorderSide(color: context.theme.colors.border.withAlpha(180)),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(28),
              blurRadius: 18,
              offset: const Offset(0, -6),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SheetDragIndicator(),
              const SizedBox(height: 16),
              Text(
                'Alternar conta',
                style: context.theme.typography.sm.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),

              if (accountsState.isLoading && cachedAccounts.isEmpty)
                const Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: CircularProgressIndicator(),
                ),

              // ─── Contas pessoais ────────────────────────────────────────────
              if (personalAccounts.isNotEmpty) ...[
                _buildSectionHeader(context, 'Contas pessoais'),
                ...personalAccounts.map(
                  (account) => _AccountTile(
                    account: account,
                    name: account.displayName,
                    subtitle: '@${account.slug}',
                    isSelected: activeAccount?.id == account.id,
                    onTap: () async {
                      if (activeAccount?.id == account.id) return;

                      final switched = await ref
                          .read(accountsViewModelProvider.notifier)
                          .switchAccount(account.id);

                      if (!context.mounted) return;
                      if (switched) {
                        Navigator.of(context).pop();
                      } else {
                        showAppToast(
                          context: context,
                          title: 'Não foi possível alterar a conta',
                        );
                      }
                    },
                  ),
                ),
              ],

              // ─── Contas empresariais ───────────────────────────────────────
              if (businessAccounts.isNotEmpty) ...[
                _buildSectionHeader(context, 'Contas empresariais'),
                ...businessAccounts.map(
                  (account) => _AccountTile(
                    account: account,
                    name: account.displayName,
                    subtitle: account.business?.document != null
                        ? 'CNPJ: ${_formatCnpj(account.business!.document!)}'
                        : 'Conta empresarial',
                    isSelected: activeAccount?.id == account.id,
                    onTap: () async {
                      if (activeAccount?.id == account.id) return;

                      final switched = await ref
                          .read(accountsViewModelProvider.notifier)
                          .switchAccount(account.id);

                      if (!context.mounted) return;
                      if (switched) {
                        Navigator.of(context).pop();
                      } else {
                        showAppToast(
                          context: context,
                          title: 'Não foi possível alterar a conta',
                        );
                      }
                    },
                  ),
                ),
              ],

              const SizedBox(height: 16),
              const FDivider(),

              // ─── Adicionar nova conta ──────────────────────────────────────
              FTile(
                style: (style) => style.copyWith(
                  decoration: FWidgetStateMap.all(
                    BoxDecoration(color: context.theme.colors.background),
                  ),
                  contentStyle: (style) => style.copyWith(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 16,
                    ),
                  ),
                ),
                onPress: () {
                  Navigator.of(context).pop();
                  parentContext.push('/auth/login?mode=add-account');
                },
                prefix: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: context.theme.colors.secondary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    FIcons.plus,
                    color: context.theme.colors.secondaryForeground,
                  ),
                ),
                title: Text(
                  'Entrar com outra conta',
                  style: context.theme.typography.sm.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              FTile(
                style: (style) => style.copyWith(
                  decoration: FWidgetStateMap.all(
                    BoxDecoration(color: context.theme.colors.background),
                  ),
                  contentStyle: (style) => style.copyWith(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 16,
                    ),
                  ),
                ),
                onPress: () {
                  Navigator.of(context).pop();
                  parentContext.push('/auth/register?mode=add-account');
                },
                prefix: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: context.theme.colors.secondary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    FIcons.userPlus,
                    color: context.theme.colors.secondaryForeground,
                  ),
                ),
                title: Text(
                  'Criar nova conta',
                  style: context.theme.typography.sm.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              // ─── Gerenciar contas ──────────────────────────────────────────
              FTile(
                style: (style) => style.copyWith(
                  decoration: FWidgetStateMap.all(
                    BoxDecoration(color: context.theme.colors.background),
                  ),
                  contentStyle: (style) => style.copyWith(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 16,
                    ),
                  ),
                ),
                onPress: () {
                  Navigator.of(context).pop();
                  parentContext.push('/app/accounts/manage');
                },
                prefix: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: context.theme.colors.muted,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    FIcons.settings,
                    color: context.theme.colors.foreground,
                  ),
                ),
                title: Text(
                  'Gerenciar contas',
                  style: context.theme.typography.sm.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 16, 12, 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: context.theme.typography.xs.copyWith(
            color: context.theme.colors.mutedForeground,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  String _formatCnpj(String cnpj) {
    if (cnpj.length != 14) return cnpj;
    return '${cnpj.substring(0, 2)}.${cnpj.substring(2, 5)}.${cnpj.substring(5, 8)}/${cnpj.substring(8, 12)}-${cnpj.substring(12, 14)}';
  }
}

// ─── Tile ────────────────────────────────────────────────────────────────────
class _AccountTile extends StatelessWidget {
  final Account account;
  final String name;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const _AccountTile({
    required this.account,
    required this.name,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FTile(
      style: (style) => style.copyWith(
        decoration: FWidgetStateMap.all(
          BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isSelected
                ? context.theme.colors.primary.withAlpha(16)
                : context.theme.colors.background,
          ),
        ),
        contentStyle: (style) => style.copyWith(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        ),
      ),
      onPress: onTap,
      prefix: AccountPhoto(
        key: ValueKey(account.id),
        account: account,
        size: 40,
        isSelected: isSelected,
      ),
      title: Text(
        name,
        style: context.theme.typography.sm.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: account.type == AccountType.personal
          ? Text(
              subtitle,
              style: context.theme.typography.xs.copyWith(
                color: context.theme.colors.mutedForeground,
              ),
            )
          : FBadge(
              style: getInvertedBadgeStyle(
                context.theme.colors,
                context.theme.typography,
              ).call,
              child: Text(
                'Empresa',
                style: context.theme.typography.xs.copyWith(
                  color: context.theme.colors.background,
                ),
              ),
            ),
      suffix: isSelected
          ? Icon(FIcons.check, color: context.theme.colors.primary, size: 24)
          : null,
    );
  }
}

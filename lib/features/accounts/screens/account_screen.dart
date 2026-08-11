import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:ibivibe/core/beta/presentation/screens/under_development_screen.dart';
import 'package:ibivibe/shared/models/account.dart';
import 'package:ibivibe/shared/models/account_type.dart';
import 'package:ibivibe/shared/providers/accounts_viewmodel.dart';
import 'package:ibivibe/features/accounts/widgets/account_card.dart';
import 'package:ibivibe/shared/ui/dialogs/logout_dialog.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(accountsViewModelProvider).activeAccount;

    if (account == null) {
      return const SafeArea(child: Center(child: Text('Nenhuma conta ativa')));
    }

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AccountCard(account: account),
            const SizedBox(height: 32),
            if (account.type == AccountType.personal)
              _PersonalProfileMenu(
                account: account,
                onLogout: () => showLogoutDialog(context, ref),
              )
            else
              _BusinessProfileMenu(
                account: account,
                onLogout: () => showLogoutDialog(context, ref),
              ),
          ],
        ),
      ),
    );
  }
}

class _PersonalProfileMenu extends StatelessWidget {
  final Account account;
  final VoidCallback onLogout;
  const _PersonalProfileMenu({required this.account, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _ProfileSection(
          title: 'Você',
          trailing: 'Ajuda',
          onTrailingTap: () => _help(context, 'Você'),
          children: [
            _ProfileRow(
              icon: FIcons.userRound,
              label: 'Meu perfil',
              onTap: () => _help(context, 'Meu perfil'),
            ),
          ],
        ),
        const _ProfileDivider(),
        _settingsSection(context),
        const _ProfileDivider(),
        _informationSection(context),
        const _ProfileDivider(),
        _ProfileRow(
          icon: FIcons.logOut,
          label: 'Sair',
          destructive: true,
          onTap: onLogout,
        ),
      ],
    );
  }
}

class _BusinessProfileMenu extends StatelessWidget {
  final Account account;
  final VoidCallback onLogout;
  const _BusinessProfileMenu({required this.account, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _ProfileSection(
          title: 'Gerenciamento',
          trailing: 'Ajuda',
          onTrailingTap: () => _help(context, 'Gerenciamento'),
          children: [
            _ProfileRow(
              icon: FIcons.store,
              label: 'Meu negócio',
              onTap: () => context.push('/app/businesses/manage'),
            ),
            _ProfileRow(
              icon: FIcons.calendarDays,
              label: 'Meus eventos',
              onTap: () => _help(context, 'Meus eventos'),
            ),
          ],
        ),
        const _ProfileDivider(),
        _settingsSection(context),
        const _ProfileDivider(),
        _informationSection(context),
        const _ProfileDivider(),
        _ProfileRow(
          icon: FIcons.logOut,
          label: 'Sair',
          destructive: true,
          onTap: onLogout,
        ),
      ],
    );
  }
}

Widget _settingsSection(BuildContext context) {
  return _ProfileSection(
    title: 'Configurações',
    children: [
      _ProfileRow(
        icon: FIcons.shield,
        label: 'Segurança',
        onTap: () => _help(context, 'Segurança'),
      ),
      _ProfileRow(
        icon: FIcons.bell,
        label: 'Notificações',
        onTap: () => _help(context, 'Notificações'),
      ),
      _ProfileRow(
        icon: FIcons.settings,
        label: 'Configurações do aplicativo',
        onTap: () => context.push('/app/settings'),
      ),
    ],
  );
}

Widget _informationSection(BuildContext context) {
  return _ProfileSection(
    title: 'Informações',
    children: [
      _ProfileRow(
        icon: FIcons.circleQuestionMark,
        label: 'Suporte e Ajuda',
        onTap: () => _help(context, 'Suporte e Ajuda'),
      ),
      _ProfileRow(
        icon: FIcons.messageSquareWarning,
        label: 'Reportar Problema',
        onTap: () => _help(context, 'Reportar Problema'),
      ),
      _ProfileRow(
        icon: FIcons.info,
        label: 'Sobre',
        onTap: () => _help(context, 'Sobre'),
      ),
    ],
  );
}

class _ProfileSection extends StatelessWidget {
  final String title;
  final String? trailing;
  final VoidCallback? onTrailingTap;
  final List<Widget> children;

  const _ProfileSection({
    required this.title,
    required this.children,
    this.trailing,
    this.onTrailingTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: context.theme.typography.base.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (trailing != null)
              FButton.raw(
                onPress: onTrailingTap,
                style: FButtonStyle.ghost(),
                child: Text(
                  trailing!,
                  style: context.theme.typography.sm.copyWith(
                    color: context.theme.colors.mutedForeground,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        ...children,
      ],
    );
  }
}

class _ProfileRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool destructive;

  const _ProfileRow({
    required this.icon,
    required this.label,
    required this.onTap,
    this.destructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = destructive
        ? context.theme.colors.destructive
        : context.theme.colors.foreground;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Icon(icon, size: 24, color: color),
            const SizedBox(width: 10),
            Text(
              label,
              style: context.theme.typography.base.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileDivider extends StatelessWidget {
  const _ProfileDivider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Divider(
        height: 2,
        thickness: 2,
        color: context.theme.colors.secondary,
      ),
    );
  }
}

void _help(BuildContext context, String feature) {
  redirectToUnderDevelopment(context, feature);
}

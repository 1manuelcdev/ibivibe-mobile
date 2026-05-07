import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:ibiapabaapp/features/accounts/domain/entities/account.dart';
import 'package:ibiapabaapp/features/accounts/presentation/widgets/contents/sections/business_sections.dart';
import 'package:ibiapabaapp/shared/ui/layout/section_header.dart';

class BusinessAccountContent extends StatelessWidget {
  final Account account;
  const BusinessAccountContent({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 16,
      children: [
        SectionHeader(
          title: 'Dados da Empresa',
          seeAllText: 'Editar',
          onSeeAllTap: () => _showUnderDevelopment(context, 'Dados da Empresa'),
        ),
        BusinessDataSection(account: account),

        const FDivider(),
        SectionHeader(
          title: 'Gerenciamento',
          seeAllText: 'Ajuda',
          onSeeAllTap: () => _showUnderDevelopment(context, 'Gerenciamento'),
        ),
        const BusinessManagementSection(),

        const FDivider(),
        SectionHeader(
          title: 'Configurações rápidas',
          seeAllText: 'Ajuda',
          onSeeAllTap: () => _showUnderDevelopment(context, 'Configurações'),
        ),
        const QuickSettingsSection(),

        const FDivider(),
        SectionHeader(
          title: 'Informações do Aplicativo',
          seeAllText: 'Ajuda',
          onSeeAllTap: () => _showUnderDevelopment(context, 'Informações'),
        ),
        const AppInfoSection(),
      ],
    );
  }

  void _showUnderDevelopment(BuildContext context, String feature) {
    // TODO: Implementar navegação para tela de "em desenvolvimento"
  }
}

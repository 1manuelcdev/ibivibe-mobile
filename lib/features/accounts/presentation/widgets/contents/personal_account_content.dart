import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:ibiapabaapp/features/accounts/domain/entities/account.dart';
import 'package:ibiapabaapp/features/accounts/presentation/widgets/contents/sections/business_sections.dart';
import 'package:ibiapabaapp/features/accounts/presentation/widgets/contents/sections/personal_sections.dart';
import 'package:ibiapabaapp/shared/ui/layout/section_header.dart';

class PersonalAccountContent extends StatelessWidget {
  final Account account;
  const PersonalAccountContent({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 16,
      children: [
        SectionHeader(
          title: 'Sua Atividade',
          seeAllText: 'Ajuda',
          onSeeAllTap: () => _showUnderDevelopment(context, 'Sua Atividade'),
        ),
        const InsightsSection(),

        const FDivider(),
        SectionHeader(
          title: 'Interações',
          seeAllText: 'Ajuda',
          onSeeAllTap: () => _showUnderDevelopment(context, 'Interações'),
        ),
        const InteractionsSection(),

        const FDivider(),
        SectionHeader(
          title: 'Interesses',
          seeAllText: 'Editar',
          onSeeAllTap: () => context.push('/app/account/interests'),
        ),
        const InterestsSection(),

        const FDivider(),
        SectionHeader(
          title: 'Expedição Ibiapaba',
          seeAllText: 'Ajuda',
          onSeeAllTap: () => _showUnderDevelopment(context, 'Expedição'),
        ),
        const ExpeditionSection(),

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

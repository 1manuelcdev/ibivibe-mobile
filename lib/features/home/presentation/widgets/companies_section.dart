import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:ibiapabaapp/features/companies/domain/entities/company.dart';
import 'package:ibiapabaapp/features/companies/presentation/controllers/companies_controller.dart';
import 'package:ibiapabaapp/features/companies/presentation/widgets/company_card.dart';
import 'package:ibiapabaapp/shared/ui/fragments/carousel/horizontal_infinite_carousel.dart';
import 'package:ibiapabaapp/shared/ui/layout/section_header.dart';

final List<Company> _mockCompanies = List.generate(
  5,
  (index) => Company(
    id: 'mock-$index',
    cnpj: '',
    maxReachLevel: .local,
    slug: 'mock',
    name: 'Carregando empresa',
    coverImgUrl: '',
    categories: ['Categoria', 'Subcategoria'],
  ),
);

class CompaniesSection extends ConsumerStatefulWidget {
  const CompaniesSection({super.key});

  @override
  ConsumerState<CompaniesSection> createState() => _CompaniesSectionState();
}

class _CompaniesSectionState extends ConsumerState<CompaniesSection> {
  @override
  Widget build(BuildContext context) {
    final companiesAsync = ref.watch(companiesProvider);

    return Column(
      mainAxisAlignment: .start,
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: SectionHeader(
            title: 'Explore as empresas da Ibiapaba',
            onSeeAllTap: () => context.push('/app/companies'),
          ),
        ),
        companiesAsync.when(
          skipLoadingOnRefresh: false,
          loading: () => HorizontalInfiniteCarousel(
            isLoading: true,
            items: _mockCompanies,
            listHeight: 200,
            itemWidth: 160,
            separator: const SizedBox(width: 12),
            itemBuilder: (_, company) => CompanyCard(company: company),
          ),

          error: (error, stack) => Center(
            child: Expanded(
              child: Column(
                mainAxisAlignment: .center,
                spacing: 16,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: context.theme.colors.mutedForeground,
                    size: 64,
                  ),
                  Text(
                    'Erro ao carregar empresas',
                    style: context.theme.typography.base,
                  ),
                ],
              ),
            ),
          ),

          data: (companies) => HorizontalInfiniteCarousel(
            isLoading: false,
            items: companies,
            listHeight: 248,
            itemWidth: 160,
            separator: const SizedBox(width: 12),
            itemBuilder: (_, company) => CompanyCard(company: company),
          ),
        ),
      ],
    );
  }
}

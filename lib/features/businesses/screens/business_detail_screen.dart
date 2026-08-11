import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:ibivibe/features/businesses/models/business_detail_data.dart';
import 'package:ibivibe/features/businesses/models/business_public_profile_model.dart';
import 'package:ibivibe/features/businesses/viewmodels/business_detail_viewmodel.dart';
import 'package:ibivibe/shared/ui/fragments/favorite_button.dart';
import 'package:ibivibe/shared/ui/fragments/carousel/content_carousel.dart';
import 'package:ibivibe/shared/ui/fragments/effects/default_shimmer_effect.dart';
import 'package:ibivibe/shared/ui/fragments/effects/expandable_text.dart';
import 'package:ibivibe/shared/ui/fragments/media/sources.dart';
import 'package:ibivibe/shared/ui/layout/section_header.dart';
import 'package:ibivibe/shared/ui/layout/wrappers/detail_page_wrapper.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BusinessDetailScreen extends ConsumerWidget {
  final String id;
  const BusinessDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(businessDetailViewModelProvider(id));

    return detailAsync.when(
      loading: () =>
          const _BusinessDetailContent(isLoading: true, detail: null),
      error: (e, _) => _ErrorView(
        onRetry: () => ref.invalidate(businessDetailViewModelProvider(id)),
      ),
      data: (detail) =>
          _BusinessDetailContent(isLoading: false, detail: detail),
    );
  }
}

class _BusinessDetailContent extends StatelessWidget {
  final bool isLoading;
  final BusinessDetailData? detail;

  const _BusinessDetailContent({required this.isLoading, required this.detail});

  // Mapeamento simplificado para MediaSource
  List<MediaSource> get _carouselItems {
    if (isLoading || detail == null || detail!.profile.media.isEmpty) {
      // Retornamos uma lista vazia ou itens mock para o Skeletonizer
      return List.generate(3, (_) => NetworkMedia(url: '', isVideo: false));
    }

    return detail!.profile.media.map((m) {
      return NetworkMedia(
        url: m.url,
        title: detail?.profile.commercialName,
        isVideo: false,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final profile = detail?.profile;

    return Skeletonizer(
      effect: customShimmerEffect(context),
      enabled: isLoading,
      child: DetailPageWrapper(
        // Passamos a lista de MediaSource para o carrossel
        carousel: ContentCarousel(items: _carouselItems, isLoading: isLoading),
        headerChildren: FHeader.nested(
          prefixes: [
            FButton.icon(
              style: FButtonStyle.secondary(),
              onPress: () => context.pop(),
              child: const Icon(Icons.arrow_back, size: 24),
            ),
          ],
          suffixes: [FavoriteButton(businessId: profile?.id)],
        ),
        bodyChildren: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profile?.commercialName.isNotEmpty == true
                    ? profile!.commercialName
                    : 'Carregando empresa',
                style: context.theme.typography.xl2.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                runSpacing: 6,
                spacing: 6,
                children: (profile?.tags ?? ['Categoria', 'Subcategoria'])
                    .map(
                      (cat) => FBadge(
                        style: FBadgeStyle.secondary(),
                        child: Text(
                          cat,
                          style: context.theme.typography.sm.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 16),
              ExpandableText(
                text: isLoading
                    ? 'Este é um texto de exemplo para o skeleton ocupar espaço...'
                    : (profile?.bio ??
                          profile?.description ??
                          'Sem descrição disponível.'),
              ),
              if (!isLoading && profile != null) ...[
                const SizedBox(height: 12),
                _BusinessFacts(profile: profile),
              ],
              const FDivider(),
              if (!isLoading && profile != null && profile.events.isNotEmpty)
                _EventsSection(events: profile.events),
            ],
          ),
        ],
      ),
    );
  }
}

class _BusinessFacts extends StatelessWidget {
  final BusinessPublicProfileModel profile;
  const _BusinessFacts({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 18,
      children: [
        if (profile.description?.trim().isNotEmpty == true)
          Text(profile.description!, style: context.theme.typography.base),
        if (profile.reviews.totalReviews > 0)
          _fact(
            context,
            Icons.star_outline,
            '${profile.reviews.averageRating.toStringAsFixed(1)} (${profile.reviews.totalReviews} avaliações)',
          ),
        if (profile.contact != null)
          _fact(
            context,
            Icons.phone_outlined,
            [
                  profile.contact!.phone,
                  profile.contact!.whatsapp,
                  profile.contact!.publicEmail,
                ]
                .whereType<String>()
                .where((value) => value.isNotEmpty)
                .join(' · '),
          ),
        if (profile.locations.isNotEmpty) ...[
          _label(context, 'Onde encontrar'),
          for (final location in profile.locations)
            _fact(
              context,
              location.isHeadquarter
                  ? Icons.home_work_outlined
                  : Icons.location_on_outlined,
              '${location.cityName}${location.isHeadquarter ? ' (matriz)' : ' (filial)'}${location.address == null ? '' : ' · ${location.address}'}',
            ),
        ],
        if (profile.hours.isNotEmpty) ...[
          _label(context, 'Funcionamento'),
          for (final hour in profile.hours)
            _fact(
              context,
              Icons.schedule,
              '${_weekday(hour.weekday)}: ${hour.isClosed ? 'Fechado' : '${hour.opensAt ?? '--:--'}–${hour.closesAt ?? '--:--'}'}',
            ),
        ],
        if (profile.services.isNotEmpty) ...[
          _label(context, 'Serviços'),
          for (final service in profile.services)
            _fact(
              context,
              Icons.room_service_outlined,
              '${service.name}${service.priceLabel == null ? '' : ' · ${service.priceLabel}'}',
            ),
        ],
      ],
    );
  }

  Widget _label(BuildContext context, String text) => Text(
    text,
    style: context.theme.typography.base.copyWith(fontWeight: FontWeight.w600),
  );

  Widget _fact(BuildContext context, IconData icon, String text) {
    if (text.isEmpty) return const SizedBox.shrink();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: context.theme.colors.mutedForeground),
        const SizedBox(width: 10),
        Expanded(child: Text(text)),
      ],
    );
  }
}

class _EventsSection extends StatelessWidget {
  final List<BusinessEventModel> events;
  const _EventsSection({required this.events});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        SectionHeader(title: 'Acontecendo agora', onSeeAllTap: () {}),
        for (final event in events)
          FCard(
            title: Text(event.name),
            subtitle: Text(
              event.startDate == null
                  ? 'Data não informada'
                  : _formatDate(event.startDate!),
            ),
            child: event.description == null ? null : Text(event.description!),
          ),
      ],
    );
  }
}

String _weekday(int weekday) =>
    const {
      0: 'Domingo',
      1: 'Segunda-feira',
      2: 'Terça-feira',
      3: 'Quarta-feira',
      4: 'Quinta-feira',
      5: 'Sexta-feira',
      6: 'Sábado',
    }[weekday] ??
    'Dia $weekday';

String _formatDate(DateTime date) =>
    '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';

class _ErrorView extends StatelessWidget {
  final VoidCallback onRetry;
  const _ErrorView({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16,
        children: [
          Icon(
            Icons.error_outline,
            color: context.theme.colors.mutedForeground,
            size: 64,
          ),
          Text(
            'Erro ao carregar empresa',
            style: context.theme.typography.base,
          ),
          FButton(onPress: onRetry, child: const Text('Tentar novamente')),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:ibivibe/features/businesses/models/business_public_profile_model.dart';
import 'package:ibivibe/features/businesses/providers/businesses_providers.dart';
import 'package:ibivibe/features/tags/providers/tags_providers.dart';
import 'package:ibivibe/shared/models/tag_group.dart';
import 'package:ibivibe/features/onboarding/widgets/interests_accordion.dart';
import 'package:ibivibe/shared/providers/accounts_viewmodel.dart';
import 'package:ibivibe/shared/ui/fragments/toast/show_app_toast.dart';
import 'package:ibivibe/shared/ui/fragments/effects/expandable_text.dart';

class BusinessDataEditScreen extends ConsumerStatefulWidget {
  const BusinessDataEditScreen({super.key});

  @override
  ConsumerState<BusinessDataEditScreen> createState() =>
      _BusinessDataEditScreenState();
}

class _BusinessDataEditScreenState
    extends ConsumerState<BusinessDataEditScreen> {
  final _formKey = GlobalKey<FormState>();
  final _commercialName = TextEditingController();
  final _bio = TextEditingController();
  final _description = TextEditingController();
  final _phone = TextEditingController();
  final _whatsapp = TextEditingController();
  final _email = TextEditingController();
  final _website = TextEditingController();
  final _instagram = TextEditingController();
  final _facebook = TextEditingController();

  BusinessPublicProfileModel? _profile;
  String? _businessId;
  bool _isLoading = true;
  bool _isSaving = false;
  String? _error;
  final Map<String, bool> _facilities = {};
  List<TagGroup> _tagGroups = const [];
  Set<String> _selectedTagIds = {};

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    for (final controller in [
      _commercialName,
      _bio,
      _description,
      _phone,
      _whatsapp,
      _email,
      _website,
      _instagram,
      _facebook,
    ]) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _load() async {
    try {
      final account = ref.read(accountsViewModelProvider).activeAccount;
      if (account == null) throw Exception('Nenhuma conta ativa.');

      final repository = ref.read(businessesRepositoryProvider);
      final business = await repository.getBusinessByAccountId(account.id);
      if (business == null || business.id.isEmpty) {
        throw Exception('Empresa não encontrada para esta conta.');
      }

      final profile = await repository.getPublicProfile(business.id);
      if (!mounted) return;
      _businessId = business.id;
      _profile = profile;
      _commercialName.text = profile.commercialName;
      _bio.text = profile.bio ?? '';
      _description.text = profile.description ?? '';
      _phone.text = profile.contact?.phone ?? '';
      _whatsapp.text = profile.contact?.whatsapp ?? '';
      _email.text = profile.contact?.publicEmail ?? '';
      _website.text = profile.contact?.website ?? '';
      _instagram.text = profile.contact?.instagram ?? '';
      _facebook.text = profile.contact?.facebook ?? '';
      _facilities
        ..clear()
        ..addAll(profile.facilities);
      try {
        _tagGroups = await ref.read(tagGroupsProvider.future);
        final tagsByName = {
          for (final tag in _tagGroups.expand((group) => group.tags))
            tag.name: tag.id,
        };
        _selectedTagIds = profile.tags
            .map((name) => tagsByName[name])
            .whereType<String>()
            .toSet();
      } catch (_) {
        _tagGroups = const [];
        _selectedTagIds = {};
      }
      setState(() => _isLoading = false);
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _error = error.toString().replaceFirst('Exception: ', '');
      });
    }
  }

  Future<void> _save() async {
    if (!(_formKey.currentState?.validate() ?? false) ||
        _businessId == null ||
        _isSaving) {
      return;
    }

    setState(() => _isSaving = true);
    final repository = ref.read(businessesRepositoryProvider);
    try {
      await repository.updateBusinessProfile(
        businessId: _businessId!,
        data: {
          'commercial_name': _commercialName.text.trim(),
          'bio': _bio.text.trim(),
          'description': _description.text.trim(),
          ..._facilities,
        },
      );
      await repository.updateBusinessContact(
        businessId: _businessId!,
        contact: BusinessContactModel(
          phone: _emptyToNull(_phone.text),
          whatsapp: _emptyToNull(_whatsapp.text),
          publicEmail: _emptyToNull(_email.text),
          website: _emptyToNull(_website.text),
          instagram: _emptyToNull(_instagram.text),
          facebook: _emptyToNull(_facebook.text),
        ),
      );
      await repository.updateBusinessTags(
        businessId: _businessId!,
        tagIds: _selectedTagIds.toList(),
      );
      if (!mounted) return;
      showAppToast(
        context: context,
        title: 'Dados atualizados',
        description: 'As informações da empresa foram salvas.',
        icon: const Icon(FIcons.check),
      );
      context.pop();
    } catch (error) {
      if (!mounted) return;
      setState(() => _isSaving = false);
      showAppToast(
        context: context,
        title: 'Não foi possível salvar',
        description: error.toString().replaceFirst('Exception: ', ''),
      );
    }
  }

  String? _emptyToNull(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FScaffold(
        header: FHeader.nested(
          prefixes: [
            FButton.icon(
              style: FButtonStyle.ghost(),
              onPress: context.pop,
              child: const Icon(Icons.arrow_back_rounded),
            ),
          ],
          title: Text('Dados da Empresa', style: context.theme.typography.base),
        ),
        footer: _isLoading || _error != null
            ? null
            : Padding(
                padding: const EdgeInsets.all(16),
                child: FButton(
                  onPress: _isSaving ? null : _save,
                  child: _isSaving
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Salvar alterações'),
                ),
              ),
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (_isLoading) return const Center(child: CircularProgressIndicator());
    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 16,
            children: [
              const Icon(Icons.error_outline, size: 48),
              Text(_error!, textAlign: TextAlign.center),
              FButton(
                style: FButtonStyle.outline(),
                onPress: () {
                  setState(() {
                    _isLoading = true;
                    _error = null;
                  });
                  _load();
                },
                child: const Text('Tentar novamente'),
              ),
            ],
          ),
        ),
      );
    }

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 24,
          children: [
            _publicHeader(context),
            _editableSection(
              context,
              title: 'Identidade',
              onEdit: _showIdentityEditor,
              children: [
                Text(
                  _commercialName.text,
                  style: context.theme.typography.lg.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (_bio.text.trim().isNotEmpty) Text(_bio.text),
                if (_description.text.trim().isNotEmpty)
                  ExpandableText(text: _description.text),
                if (_selectedTagNames.isNotEmpty)
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      for (final tag in _selectedTagNames)
                        FBadge(
                          style: FBadgeStyle.secondary(),
                          child: Text(tag),
                        ),
                    ],
                  ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedTagNames.isEmpty
                            ? 'Nenhuma categoria selecionada'
                            : 'Categorias e tags',
                        style: context.theme.typography.sm,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: _showTagsEditor,
                      icon: const Icon(Icons.sell_outlined, size: 18),
                      label: const Text('Editar tags'),
                    ),
                  ],
                ),
              ],
            ),
            _editableSection(
              context,
              title: 'Contato e redes sociais',
              onEdit: _showContactEditor,
              children: [_contactPreview(context)],
            ),
            _editableSection(
              context,
              title: 'Facilidades',
              onEdit: _showFacilitiesEditor,
              children: [_facilitiesPreview(context)],
            ),
            _readOnlySummary(context),
          ],
        ),
      ),
    );
  }

  Widget _publicHeader(BuildContext context) {
    final avatar = _profile!.avatarUrl;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12,
      children: [
        if (avatar != null && avatar.isNotEmpty)
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              avatar,
              height: 150,
              fit: BoxFit.cover,
              errorBuilder: (_, error, stackTrace) => const SizedBox.shrink(),
            ),
          ),
        Row(
          children: [
            Expanded(
              child: Text(
                _commercialName.text,
                style: context.theme.typography.xl2.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (_profile!.isVerified)
              const Icon(Icons.verified, color: Colors.blue),
          ],
        ),
        if (_profile!.reviews.totalReviews > 0)
          Text(
            '${_profile!.reviews.averageRating.toStringAsFixed(1)} · ${_profile!.reviews.totalReviews} avaliações',
            style: context.theme.typography.sm,
          ),
      ],
    );
  }

  Widget _editableSection(
    BuildContext context, {
    required String title,
    required VoidCallback onEdit,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 8,
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
            FButton.icon(
              style: FButtonStyle.ghost(),
              onPress: onEdit,
              child: const Icon(Icons.edit_outlined, size: 20),
            ),
          ],
        ),
        FCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _contactPreview(BuildContext context) {
    final values = <String>[
      if (_phone.text.trim().isNotEmpty) 'Telefone: ${_phone.text}',
      if (_whatsapp.text.trim().isNotEmpty) 'WhatsApp: ${_whatsapp.text}',
      if (_email.text.trim().isNotEmpty) _email.text,
      if (_website.text.trim().isNotEmpty) _website.text,
      if (_instagram.text.trim().isNotEmpty) _instagram.text,
      if (_facebook.text.trim().isNotEmpty) _facebook.text,
    ];
    return Text(
      values.isEmpty ? 'Nenhum contato informado' : values.join('\n'),
      style: context.theme.typography.base,
    );
  }

  Widget _facilitiesPreview(BuildContext context) {
    final labels = const {
      'accepts_payment': 'Aceita pagamentos',
      'offers_delivery': 'Oferece entrega',
      'in_person_service': 'Atendimento presencial',
      'accessibility': 'Acessibilidade',
      'parking': 'Estacionamento',
      'wifi': 'Wi-Fi',
    };
    final enabled = labels.entries
        .where((item) => _facilities[item.key] == true)
        .map((item) => item.value)
        .toList();
    return Text(
      enabled.isEmpty ? 'Nenhuma facilidade informada' : enabled.join(' · '),
      style: context.theme.typography.base,
    );
  }

  List<String> get _selectedTagNames => [
    for (final tag in _tagGroups.expand((group) => group.tags))
      if (_selectedTagIds.contains(tag.id)) tag.name,
  ];

  Future<void> _showTagsEditor() async {
    if (_tagGroups.isEmpty) {
      showAppToast(
        context: context,
        title: 'Categorias indisponíveis',
        description: 'Não foi possível carregar as categorias agora.',
      );
      return;
    }

    var selected = Set<String>.from(_selectedTagIds);
    final saved = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Categorias e tags'),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: InterestsAccordion(
                tagGroups: _tagGroups,
                initialSelected: selected,
                onChanged: (value) =>
                    setDialogState(() => selected = Set<String>.from(value)),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancelar'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(dialogContext, true),
              child: const Text('Aplicar'),
            ),
          ],
        ),
      ),
    );
    if (saved == true && mounted) {
      setState(() => _selectedTagIds = selected);
    }
  }

  Future<void> _showIdentityEditor() async {
    final name = TextEditingController(text: _commercialName.text);
    final bio = TextEditingController(text: _bio.text);
    final description = TextEditingController(text: _description.text);
    final saved = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Editar identidade'),
        content: SingleChildScrollView(
          child: Column(
            spacing: 12,
            children: [
              _field(name, 'Nome comercial', required: true),
              _field(bio, 'Descrição curta', maxLines: 2),
              _field(description, 'Descrição completa', maxLines: 5),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              if (name.text.trim().isEmpty) return;
              Navigator.pop(dialogContext, true);
            },
            child: const Text('Aplicar'),
          ),
        ],
      ),
    );
    if (saved == true && mounted) {
      setState(() {
        _commercialName.text = name.text.trim();
        _bio.text = bio.text.trim();
        _description.text = description.text.trim();
      });
    }
    name.dispose();
    bio.dispose();
    description.dispose();
  }

  Future<void> _showContactEditor() async {
    final phone = TextEditingController(text: _phone.text);
    final whatsapp = TextEditingController(text: _whatsapp.text);
    final email = TextEditingController(text: _email.text);
    final website = TextEditingController(text: _website.text);
    final instagram = TextEditingController(text: _instagram.text);
    final facebook = TextEditingController(text: _facebook.text);
    final saved = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Editar contatos'),
        content: SingleChildScrollView(
          child: Column(
            spacing: 12,
            children: [
              _field(phone, 'Telefone comercial'),
              _field(whatsapp, 'WhatsApp'),
              _field(email, 'E-mail público'),
              _field(website, 'Site'),
              _field(instagram, 'Instagram'),
              _field(facebook, 'Facebook'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Aplicar'),
          ),
        ],
      ),
    );
    if (saved == true && mounted) {
      setState(() {
        _phone.text = phone.text.trim();
        _whatsapp.text = whatsapp.text.trim();
        _email.text = email.text.trim();
        _website.text = website.text.trim();
        _instagram.text = instagram.text.trim();
        _facebook.text = facebook.text.trim();
      });
    }
    for (final controller in [
      phone,
      whatsapp,
      email,
      website,
      instagram,
      facebook,
    ]) {
      controller.dispose();
    }
  }

  Future<void> _showFacilitiesEditor() async {
    final values = Map<String, bool>.from(_facilities);
    final labels = const {
      'accepts_payment': 'Aceita pagamentos',
      'offers_delivery': 'Oferece entrega',
      'in_person_service': 'Atendimento presencial',
      'accessibility': 'Acessibilidade',
      'parking': 'Estacionamento',
      'wifi': 'Wi-Fi',
    };
    final saved = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Editar facilidades'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                for (final item in labels.entries)
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(item.value),
                    value: values[item.key] ?? false,
                    onChanged: (value) =>
                        setDialogState(() => values[item.key] = value ?? false),
                  ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancelar'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(dialogContext, true),
              child: const Text('Aplicar'),
            ),
          ],
        ),
      ),
    );
    if (saved == true && mounted) {
      setState(
        () => _facilities
          ..clear()
          ..addAll(values),
      );
    }
  }

  Widget _field(
    TextEditingController controller,
    String label, {
    bool required = false,
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return FTextFormField(
      control: FTextFieldControl.managed(controller: controller),
      label: Text(label),
      keyboardType: keyboardType,
      maxLines: maxLines,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: required
          ? (value) =>
                value == null || value.trim().isEmpty ? 'Informe $label' : null
          : null,
    );
  }

  Widget _section(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    return FCard(
      title: Text(title, style: context.theme.typography.base),
      child: Column(spacing: 16, children: children),
    );
  }

  Widget _readOnlySummary(BuildContext context) {
    final profile = _profile!;
    return _section(
      context,
      title: 'Informações cadastradas',
      children: [
        if (profile.avatarUrl != null && profile.avatarUrl!.isNotEmpty)
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              profile.avatarUrl!,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, error, stackTrace) => const SizedBox.shrink(),
            ),
          ),
        if (profile.tags.isNotEmpty)
          _summaryItem(context, Icons.sell_outlined, profile.tags.join(', ')),
        _summaryItem(
          context,
          Icons.star_outline,
          profile.reviews.totalReviews == 0
              ? 'Ainda não há avaliações'
              : '${profile.reviews.averageRating.toStringAsFixed(1)} · ${profile.reviews.totalReviews} avaliações',
        ),
        if (profile.locations.isNotEmpty) ...[
          _summaryLabel(context, 'Unidades'),
          for (final location in profile.locations)
            _locationItem(context, location),
        ],
        if (profile.hours.isNotEmpty) ...[
          _summaryLabel(context, 'Horários de funcionamento'),
          for (final hour in profile.hours) _hourItem(context, hour),
        ],
        if (profile.services.isNotEmpty) ...[
          _summaryLabel(context, 'Serviços'),
          for (final service in profile.services)
            _serviceItem(context, service),
        ],
        if (profile.media.isNotEmpty) ...[
          _summaryLabel(context, 'Galeria'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final media in profile.media)
                if (media.url.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      media.thumbnailUrl ?? media.url,
                      width: 88,
                      height: 72,
                      fit: BoxFit.cover,
                      errorBuilder: (_, error, stackTrace) =>
                          const SizedBox.shrink(),
                    ),
                  ),
            ],
          ),
        ],
        if (profile.events.isNotEmpty) ...[
          _summaryLabel(context, 'Eventos da empresa'),
          for (final event in profile.events)
            _summaryItem(
              context,
              Icons.event_outlined,
              '${event.name}${event.startDate == null ? '' : ' · ${_formatDate(event.startDate!)}'}',
            ),
        ],
      ],
    );
  }

  Widget _summaryLabel(BuildContext context, String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: context.theme.typography.sm.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _locationItem(BuildContext context, BusinessLocationModel location) {
    final details = [
      location.address,
      location.neighborhood,
      location.postalCode,
    ].whereType<String>().where((value) => value.trim().isNotEmpty).join(', ');
    return _summaryItem(
      context,
      location.isHeadquarter
          ? Icons.home_work_outlined
          : Icons.location_on_outlined,
      '${location.cityName}${location.isHeadquarter ? ' (matriz)' : ' (filial)'}${details.isEmpty ? '' : ' · $details'}',
    );
  }

  Widget _hourItem(BuildContext context, BusinessHourModel hour) {
    final label = _weekdayLabel(hour.weekday);
    final schedule = hour.isClosed
        ? 'Fechado'
        : '${hour.opensAt ?? '--:--'}–${hour.closesAt ?? '--:--'}${hour.breakStart == null || hour.breakEnd == null ? '' : ' · pausa ${hour.breakStart}–${hour.breakEnd}'}';
    return _summaryItem(context, Icons.schedule, '$label: $schedule');
  }

  Widget _serviceItem(BuildContext context, BusinessServiceModel service) {
    final price =
        service.priceLabel ??
        (service.priceFrom == null
            ? null
            : service.priceTo == null
            ? 'A partir de ${service.priceFrom}'
            : '${service.priceFrom}–${service.priceTo}');
    return _summaryItem(
      context,
      Icons.room_service_outlined,
      '${service.name}${price == null ? '' : ' · $price'}',
    );
  }

  String _weekdayLabel(int weekday) {
    const labels = {
      0: 'Domingo',
      1: 'Segunda-feira',
      2: 'Terça-feira',
      3: 'Quarta-feira',
      4: 'Quinta-feira',
      5: 'Sexta-feira',
      6: 'Sábado',
    };
    return labels[weekday] ?? 'Dia $weekday';
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  Widget _summaryItem(BuildContext context, IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: context.theme.colors.mutedForeground),
        const SizedBox(width: 10),
        Expanded(child: Text(text)),
      ],
    );
  }
}

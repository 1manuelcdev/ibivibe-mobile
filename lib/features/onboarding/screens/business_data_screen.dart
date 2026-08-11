import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:ibivibe/core/preferences/user_preferences_state_provider.dart';
import 'package:ibivibe/features/auth/providers/auth_providers.dart';
import 'package:ibivibe/shared/models/account.dart';
import 'package:ibivibe/shared/models/account_type.dart';
import 'package:ibivibe/shared/providers/accounts_viewmodel.dart';
import 'package:ibivibe/features/onboarding/viewmodels/business_data_viewmodel.dart';
import 'package:ibivibe/shared/models/city.dart';
import 'package:ibivibe/shared/ui/fragments/toast/show_app_toast.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BusinessDataScreen extends ConsumerStatefulWidget {
  const BusinessDataScreen({super.key, this.onComplete});
  final VoidCallback? onComplete;

  @override
  ConsumerState<BusinessDataScreen> createState() => _BusinessDataScreenState();
}

class _BusinessDataScreenState extends ConsumerState<BusinessDataScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _cnpj = '';
  String? _headquartersCityId;
  List<String> _branchCityIds = [];
  bool _isSubmitting = false;

  Future<void> _handleComplete() async {
    if (_isSubmitting) return;
    if (!(_formKey.currentState?.validate() ?? false)) return;
    if (_headquartersCityId == null) return;

    setState(() => _isSubmitting = true);

    final submitted = await ref
        .read(businessDataViewModelProvider.notifier)
        .submit(
          name: _name.trim(),
          cnpj: CNPJValidator.strip(_cnpj),
          headquartersCityId: _headquartersCityId!,
          branchCityIds: _branchCityIds,
        );

    if (!mounted) return;

    if (!submitted) {
      setState(() => _isSubmitting = false);
      showAppToast(
        context: context,
        title: 'Não foi possível criar a empresa',
        description: 'Tente novamente em alguns instantes.',
      );
      return;
    }

    // O backend promove a conta para business ao concluir o onboarding. O
    // objeto mantido em memória ainda pode estar como personal, então
    // sincronizamos a sessão antes de navegar para as telas da empresa.
    try {
      var account = await ref.read(authRepositoryProvider).getMe();
      if (account.displayName.trim().isEmpty) {
        account = account.copyWith(
          displayName: _name.trim(),
          type: AccountType.business,
        );
      }
      await ref.read(accountsViewModelProvider.notifier).onAuthSuccess(account);
    } catch (_) {
      // A empresa já foi criada. Se o refresh falhar, ainda atualizamos a
      // conta ativa e seu cache com os dados confirmados neste formulário.
      final currentAccount = ref.read(accountsViewModelProvider).activeAccount;
      if (currentAccount != null) {
        await ref
            .read(accountsViewModelProvider.notifier)
            .onAuthSuccess(
              currentAccount.copyWith(
                displayName: _name.trim(),
                type: AccountType.business,
              ),
            );
      }
    }

    if (!mounted) return;

    if (widget.onComplete != null) {
      widget.onComplete!();
      return;
    }

    ref.read(userPreferencesStateProvider.notifier).setNeedsOnboarding(false);
    context.go('/app/home');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FScaffold(
        header: FHeader.nested(
          prefixes: [
            FButton.icon(
              style: FButtonStyle.ghost(),
              onPress: () => context.pop(),
              child: const Icon(Icons.arrow_back),
            ),
          ],
        ),
        footer: Padding(
          padding: const EdgeInsets.all(16),
          child: FButton(
            onPress: _isSubmitting ? null : _handleComplete,
            child: _isSubmitting
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Concluir'),
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList.list(
                children: [
                  Text(
                    'Dados da Empresa',
                    style: context.theme.typography.xl2.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Preencha dados básicos sobre seu empreendimento',
                    style: context.theme.typography.base,
                  ),
                  const SizedBox(height: 32),
                  _CompanyForm(
                    formKey: _formKey,
                    onNameChanged: (value) => _name = value,
                    onCnpjChanged: (value) => _cnpj = value,
                    onHeadquartersChanged: (value) =>
                        _headquartersCityId = value,
                    onBranchCitiesChanged: (value) => _branchCityIds = value,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum CompanyLocationType { onlyHeadquarter, haveBranches }

class _CompanyForm extends ConsumerStatefulWidget {
  const _CompanyForm({
    required this.formKey,
    required this.onNameChanged,
    required this.onCnpjChanged,
    required this.onHeadquartersChanged,
    required this.onBranchCitiesChanged,
  });

  final GlobalKey<FormState> formKey;
  final ValueChanged<String> onNameChanged;
  final ValueChanged<String> onCnpjChanged;
  final ValueChanged<String?> onHeadquartersChanged;
  final ValueChanged<List<String>> onBranchCitiesChanged;

  @override
  ConsumerState<_CompanyForm> createState() => _CompanyFormState();
}

class _CompanyFormState extends ConsumerState<_CompanyForm> {
  final _locationType = ValueNotifier(CompanyLocationType.onlyHeadquarter);

  @override
  void dispose() {
    _locationType.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(businessDataViewModelProvider);

    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 16,
        children: [
          FTextFormField(
            control: FTextFieldControl.managed(
              onChange: (value) => widget.onNameChanged(value.text),
            ),
            label: const FLabel(
              axis: Axis.vertical,
              child: Text('Nome da empresa'),
            ),
            hint: 'Nome fantasia',
            autovalidateMode: AutovalidateMode.onUnfocus,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Informe o nome da empresa';
              }
              if (value.trim().length > 150) {
                return 'Máximo de 150 caracteres';
              }
              return null;
            },
          ),

          FSelectGroup<CompanyLocationType>(
            control: FMultiValueControl.managedRadio(
              controller: FMultiValueNotifier.radio(
                CompanyLocationType.onlyHeadquarter,
              ),
              onChange: (value) {
                _locationType.value = value.isNotEmpty
                    ? value.first
                    : CompanyLocationType.onlyHeadquarter;
                if (_locationType.value != CompanyLocationType.haveBranches) {
                  widget.onBranchCitiesChanged([]);
                }
              },
            ),
            label: const Text('A empresa possui filiais?'),
            children: [
              .radio(
                value: CompanyLocationType.onlyHeadquarter,
                label: Text('Não', style: context.theme.typography.base),
              ),
              .radio(
                value: CompanyLocationType.haveBranches,
                label: Text('Sim', style: context.theme.typography.base),
              ),
            ],
          ),

          FTextFormField(
            label: const FLabel(axis: Axis.vertical, child: Text('CNPJ')),
            hint: '00.000.000/0000-00',
            keyboardType: TextInputType.number,
            inputFormatters: [_CnpjInputFormatter()],
            control: FTextFieldControl.managed(
              onChange: (value) => widget.onCnpjChanged(value.text),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Informe o CNPJ';
              }
              if (!CNPJValidator.isValid(value)) {
                return 'CNPJ inválido';
              }
              return null;
            },
          ),

          state.when(
            data: (data) => _CompanyHeadquarterLocationField(
              cities: data.cities,
              onChanged: widget.onHeadquartersChanged,
            ),
            error: (_, stack) => Text('error $stack'),
            loading: () => const Skeletonizer(
              child: _CompanyHeadquarterLocationField(
                cities: [],
                onChanged: _ignoreCityChange,
              ),
            ),
          ),
          _CompanyBranchesLocationField(
            cities: state.asData?.value.cities ?? const [],
            locationType: _locationType,
            onChanged: widget.onBranchCitiesChanged,
          ),
        ],
      ),
    );
  }

  static void _ignoreCityChange(String? _) {}
}

class _CompanyHeadquarterLocationField extends StatefulWidget {
  final List<City> cities;
  final ValueChanged<String?> onChanged;

  const _CompanyHeadquarterLocationField({
    required this.cities,
    required this.onChanged,
  });

  @override
  State<_CompanyHeadquarterLocationField> createState() =>
      __CompanyHeadquarterLocationFieldState();
}

class __CompanyHeadquarterLocationFieldState
    extends State<_CompanyHeadquarterLocationField> {
  @override
  Widget build(BuildContext context) {
    return FSelect<String>.searchBuilder(
      hint: 'Escolha uma cidade',
      label: const FLabel(axis: Axis.vertical, child: Text('Cidade da matriz')),
      control: FSelectControl.managed(onChange: widget.onChanged),
      format: (id) => _cityName(id),
      clearable: true,
      validator: (value) => value == null ? 'Informe a cidade da matriz' : null,
      filter: (query) => query.isEmpty
          ? widget.cities.map((c) => c.id)
          : widget.cities
                .where(
                  (c) => c.name.toLowerCase().startsWith(query.toLowerCase()),
                )
                .map((c) => c.id),
      contentBuilder: (context, _, cities) => [
        for (final cityId in cities)
          .item(
            title: Text(_cityName(cityId), style: context.theme.typography.sm),
            value: cityId,
          ),
      ],
    );
  }

  String _cityName(String id) {
    for (final city in widget.cities) {
      if (city.id == id) return city.name;
    }
    return id;
  }
}

class _CompanyBranchesLocationField extends ConsumerStatefulWidget {
  final ValueNotifier locationType;
  final List<City> cities;
  final ValueChanged<List<String>> onChanged;

  const _CompanyBranchesLocationField({
    required this.locationType,
    required this.cities,
    required this.onChanged,
  });

  @override
  ConsumerState<_CompanyBranchesLocationField> createState() =>
      _CompanyBranchesLocationFieldState();
}

class _CompanyBranchesLocationFieldState
    extends ConsumerState<_CompanyBranchesLocationField> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.locationType,
      builder: (context, type, _) => type == CompanyLocationType.haveBranches
          ? FMultiSelect<String>.searchBuilder(
              hint: const Text('Selecione uma ou mais cidades'),
              label: const FLabel(
                axis: Axis.vertical,
                child: Text('Cidades com filiais'),
              ),
              control: FMultiValueControl.managed(
                onChange: (values) => widget.onChanged(values.toList()),
              ),
              format: (id) => Text(_cityName(id)),
              filter: (query) => query.isEmpty
                  ? widget.cities.map((c) => c.id)
                  : widget.cities
                        .where(
                          (c) => c.name.toLowerCase().startsWith(
                            query.toLowerCase(),
                          ),
                        )
                        .map((c) => c.id),
              contentBuilder: (context, _, cities) => [
                for (final cityId in cities)
                  .item(
                    title: Text(
                      _cityName(cityId),
                      style: context.theme.typography.sm,
                    ),
                    value: cityId,
                  ),
              ],
            )
          : const SizedBox.shrink(),
    );
  }

  String _cityName(String id) {
    for (final city in widget.cities) {
      if (city.id == id) return city.name;
    }
    return id;
  }
}

class _CnpjInputFormatter extends TextInputFormatter {
  static final _nonDigits = RegExp(r'\D');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final rawDigits = newValue.text.replaceAll(_nonDigits, '');
    final digits = rawDigits.substring(0, rawDigits.length.clamp(0, 14));

    final formatted = _format(digits);
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  String _format(String digits) {
    final buffer = StringBuffer();
    for (var i = 0; i < digits.length; i++) {
      if (i == 2 || i == 5) buffer.write('.');
      if (i == 8) buffer.write('/');
      if (i == 12) buffer.write('-');
      buffer.write(digits[i]);
    }
    return buffer.toString();
  }
}

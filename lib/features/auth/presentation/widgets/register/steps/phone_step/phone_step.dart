import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:ibiapabaapp/features/auth/domain/entities/check_availability.dart';
import 'package:ibiapabaapp/features/auth/presentation/controllers/register_controller.dart';
import 'package:ibiapabaapp/features/auth/presentation/widgets/register/steps/phone_step/country_code_config.dart';
import 'package:ibiapabaapp/features/auth/presentation/widgets/register/steps/phone_step/country_picker_sheet.dart';
import 'package:ibiapabaapp/features/auth/presentation/widgets/register/steps/phone_step/custom_code_dialog.dart';
import 'package:ibiapabaapp/features/auth/validation/auth_validator.dart';
import 'package:ibiapabaapp/shared/ui/layout/availability_suffix.dart';

class PhoneStep extends ConsumerStatefulWidget {
  final VoidCallback onNext;

  const PhoneStep({super.key, required this.onNext});

  @override
  ConsumerState<PhoneStep> createState() => _PhoneStepState();
}

class _PhoneStepState extends ConsumerState<PhoneStep> {
  String _countryCode = '+55';
  bool _isCustomCountry = false;

  Timer? _debounce;
  late final FTextFieldControl _phoneControl;
  String _phoneNumber = '';

  @override
  void initState() {
    super.initState();
    _phoneControl = FTextFieldControl.managed(
      onChange: (v) {
        _phoneNumber = v.text;
        _onPhoneChanged(_phoneNumber);
      },
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onPhoneChanged(String value) {
    _debounce?.cancel();

    final digits = value.replaceAll(RegExp(r'\D'), '');
    final fullNumber = '$_countryCode$digits';

    final notifier = ref.read(registerControllerProvider.notifier);
    notifier.setPhone(fullNumber);

    final validator = ref.read(authValidatorProvider);
    final error = validator.validateField(AuthFields.phoneNumber, value);
    if (error != null) {
      return;
    }

    _debounce = Timer(const Duration(milliseconds: 500), () {
      notifier.checkPhone(fullNumber);
    });
  }

  CountryPhoneConfig get _currentCountry =>
      _isCustomCountry ? CountryPhoneConfig.custom : CountryPhoneConfig.brazil;

  List<TextInputFormatter> get _inputFormatters {
    if (!_isCustomCountry && _countryCode == '+55') {
      return [FilteringTextInputFormatter.digitsOnly, TelefoneInputFormatter()];
    }
    return [
      FilteringTextInputFormatter.digitsOnly,
      LengthLimitingTextInputFormatter(_currentCountry.maxDigits),
    ];
  }

  void _showCountryPicker() async {
    final result = await showCountryPickerSheet(
      context: context,
      currentCode: _countryCode,
      isCustomCountry: _isCustomCountry,
    );
    if (result == null) return;
    if (result.isCustom) {
      _showCustomCodeDialog();
    } else {
      setState(() {
        _isCustomCountry = false;
        _countryCode = result.code;
      });
      ref.read(selectedCountryProvider.notifier).state = (result.code, 11);
      ref.read(registerControllerProvider.notifier).setPhone('');
    }
  }

  void _showCustomCodeDialog() async {
    final code = await showCustomCodeDialog(
      context: context,
      initialCode: _isCustomCountry ? _countryCode : '+',
    );
    if (code != null) {
      setState(() {
        _isCustomCountry = true;
        _countryCode = code;
      });
      ref.read(selectedCountryProvider.notifier).state = (code, 8);
      ref.read(registerControllerProvider.notifier).setPhone('');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authValidator = ref.read(authValidatorProvider);
    final availability = ref.watch(
      registerControllerProvider.select(
        (s) => s.availability[AvailabilityField.phoneNumber],
      ),
    );
    final isAvailable = availability?.available;
    final isChecking = availability?.isChecking ?? false;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Text(
            'Qual é o seu telefone?',
            style: context.theme.typography.xl2.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: _showCountryPicker,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: context.theme.colors.border),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _currentCountry.flag,
                        style: context.theme.typography.base,
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.arrow_drop_down,
                        color: context.theme.colors.foreground,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FTextFormField(
                  control: _phoneControl,
                  keyboardType: TextInputType.phone,
                  hint: _currentCountry.example,
                  inputFormatters: _inputFormatters,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (v) => authValidator.validateField(
                    AuthFields.phoneNumber,
                    v,
                  ),
                  suffixBuilder: (context, style, states) =>
                      AvailabilitySuffix(
                    isAvailable: isAvailable,
                    isChecking: isChecking,
                  ),
                ),
              ),
            ],
          ),

          const Spacer(),

          SizedBox(
            width: double.infinity,
            child: FButton(
              onPress: isAvailable == true ? widget.onNext : null,
              child: const Text(
                'Continuar',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

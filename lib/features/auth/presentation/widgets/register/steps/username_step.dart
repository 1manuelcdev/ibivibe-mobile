import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:ibiapabaapp/app/theme/theme.dart';
import 'package:ibiapabaapp/features/auth/domain/entities/check_availability.dart';
import 'package:ibiapabaapp/features/auth/presentation/controllers/register_controller.dart';
import 'package:ibiapabaapp/features/auth/validation/auth_validator.dart';
import 'package:ibiapabaapp/shared/ui/layout/availability_suffix.dart';

class UsernameStep extends ConsumerStatefulWidget {
  final VoidCallback onNext;

  const UsernameStep({super.key, required this.onNext});

  @override
  ConsumerState<UsernameStep> createState() => _UsernameStepState();
}

class _UsernameStepState extends ConsumerState<UsernameStep> {
  final _formKey = GlobalKey<FormState>();

  String _userName = '';
  Timer? _debounce;
  String? _errorText;
  String? _successText;

  final RegExp _usernameRegex = RegExp(
    r'^(?=.{4,30}$)(?![._])(?!.*[._]{2})[a-zA-Z0-9._]+(?<![._])$',
  );

  late final FTextFieldControl _userNameControl;

  @override
  void initState() {
    super.initState();
    _userName = ref.read(registerControllerProvider).formData.username;

    _userNameControl = FTextFieldControl.managed(
      onChange: (v) {
        _userName = v.text.trim();
        _onUsernameChanged(_userName);
      },
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onUsernameChanged(String value) {
    _debounce?.cancel();

    setState(() {
      _errorText = null;
      _successText = null;
    });

    final notifier = ref.read(registerControllerProvider.notifier);
    notifier.setUsername(value);

    final trimmed = value.trim();
    if (!_usernameRegex.hasMatch(trimmed)) {
      return;
    }

    _debounce = Timer(const Duration(milliseconds: 500), () {
      _checkUsernameAvailability(trimmed);
    });
  }

  Future<void> _checkUsernameAvailability(String username) async {
    setState(() {
      _errorText = null;
      _successText = null;
    });

    final notifier = ref.read(registerControllerProvider.notifier);
    final available = await notifier.checkUsername(username);

    if (!mounted) return;

    setState(() {
      final fieldError = notifier.getError(AvailabilityField.username);
      if (fieldError != null) {
        _errorText = fieldError;
      } else if (available == false) {
        _errorText = 'Nome de usuário já está em uso, por favor, use outro';
      } else if (available == true) {
        _successText = 'Nome de usuário disponível!';
      }
    });

    _formKey.currentState?.validate();
  }

  void _submit() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;

    final isAvailable = ref
        .read(registerControllerProvider)
        .availability[AvailabilityField.username]
        ?.available;
    if (isAvailable != true) return;

    ref.read(registerControllerProvider.notifier).setUsername(_userName);
    widget.onNext();
  }

  @override
  Widget build(BuildContext context) {
    final authValidator = ref.watch(authValidatorProvider);
    final availability = ref.watch(
      registerControllerProvider.select(
        (s) => s.availability[AvailabilityField.username],
      ),
    );

    final isAvailable = availability?.available;
    final isChecking = availability?.isChecking ?? false;

    final canContinue =
        isAvailable == true &&
        !isChecking &&
        _errorText == null &&
        _userName.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Text(
              'Como você quer ser encontrado no app?',
              style: context.theme.typography.xl2.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Use o nome de usuário que já usa em outras redes - ou crie um que te represente bem.',
              style: context.theme.typography.base.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),

            FTextFormField(
              prefixBuilder: (context, style, states) => Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 4, 0),
                child: Text(
                  '@',
                  style: TextStyle(
                    fontSize: 16,
                    color: context.theme.colors.secondaryForeground,
                  ),
                ),
              ),
              suffixBuilder: (context, style, states) => AvailabilitySuffix(
                isAvailable: isAvailable,
                isChecking: isChecking,
              ),
              control: _userNameControl,
              style: (style) =>
                  style.withBaseFontSize(typography: context.theme.typography),
              hint: 'Seu nome de usuário',
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (v) =>
                  authValidator.validateField(AuthFields.username, v),
              onSubmit: (_) => _submit(),
            ),

            if (_successText != null)
              Text(
                _successText!,
                style: context.theme.typography.sm.copyWith(
                  color: context.theme.colors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: FButton(
                onPress: canContinue ? _submit : null,
                child: const Text(
                  'Continuar',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

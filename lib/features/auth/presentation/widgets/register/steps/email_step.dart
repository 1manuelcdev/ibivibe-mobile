import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:ibiapabaapp/features/auth/domain/entities/check_availability.dart';
import 'package:ibiapabaapp/features/auth/presentation/controllers/register_controller.dart';
import 'package:ibiapabaapp/features/auth/validation/auth_validator.dart';
import 'package:ibiapabaapp/shared/ui/layout/availability_suffix.dart';

class EmailStep extends ConsumerStatefulWidget {
  final VoidCallback onNext;

  const EmailStep({super.key, required this.onNext});

  @override
  ConsumerState<EmailStep> createState() => _EmailStepState();
}

class _EmailStepState extends ConsumerState<EmailStep> {
  Timer? _debounce;
  late final FTextFieldControl _emailControl;

  @override
  void initState() {
    super.initState();
    _emailControl = FTextFieldControl.managed(
      onChange: (v) => _onEmailChanged(v.text),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onEmailChanged(String value) {
    _debounce?.cancel();
    final notifier = ref.read(registerControllerProvider.notifier);
    notifier.setEmail(value);

    final validator = ref.read(authValidatorProvider);
    final error = validator.validateField(AuthFields.email, value);
    if (error != null) return;

    _debounce = Timer(const Duration(milliseconds: 500), () {
      notifier.checkEmail(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final availability = ref.watch(
      registerControllerProvider.select(
        (s) => s.availability[AvailabilityField.email],
      ),
    );
    final isAvailable = availability?.available;
    final isChecking = availability?.isChecking ?? false;
    final authValidator = ref.read(authValidatorProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Text(
            'Qual é o seu e-mail?',
            style: context.theme.typography.xl2.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          FTextFormField(
            control: _emailControl,
            hint: 'exemplo@email.com',
            keyboardType: TextInputType.emailAddress,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (v) => authValidator.validateField(AuthFields.email, v),
            suffixBuilder: (context, style, states) => AvailabilitySuffix(
              isAvailable: isAvailable,
              isChecking: isChecking,
            ),
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

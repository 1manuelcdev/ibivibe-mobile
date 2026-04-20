import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:ibiapabaapp/app/theme/theme.dart';
import 'package:ibiapabaapp/features/auth/presentation/controllers/register_controller.dart';
import 'package:ibiapabaapp/features/auth/presentation/states/register_state.dart';
import 'package:ibiapabaapp/features/auth/validation/auth_validator.dart';

class PasswordStep extends ConsumerStatefulWidget {
  final VoidCallback onSubmit;

  const PasswordStep({
    super.key,
    required this.onSubmit,
  });

  @override
  ConsumerState<PasswordStep> createState() => _PasswordStepState();
}

class _PasswordStepState extends ConsumerState<PasswordStep> {
  final _formKey = GlobalKey<FormState>();

  late final FTextFieldControl _passwordControl;
  late final FTextFieldControl _confirmPasswordControl;

  @override
  void initState() {
    super.initState();
    _passwordControl = FTextFieldControl.managed(
      onChange: (v) => ref.read(registerControllerProvider.notifier).setPassword(v.text),
    );
    _confirmPasswordControl = FTextFieldControl.managed(
      onChange: (v) => ref.read(registerControllerProvider.notifier).setConfirmPassword(v.text),
    );
  }

  void _submit() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;
    widget.onSubmit();
  }

  @override
  Widget build(BuildContext context) {
    final authValidator = ref.watch(authValidatorProvider);
    final status = ref.watch(registerControllerProvider.select((s) => s.status));
    final isLoading = status == RegisterStatus.loading;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Text(
              'Para terminar, defina uma senha',
              style: context.theme.typography.xl2.copyWith(fontWeight: .w600),
            ),

            Text(
              'Crie uma senha forte, de preferência com letras, números e caracteres especiais',
              style: context.theme.typography.base.copyWith(
                fontWeight: .normal,
              ),
            ),

            FTextFormField.password(
              control: _passwordControl,
              style: (style) =>
                  style.withBaseFontSize(typography: context.theme.typography),
              label: const Text('Senha'),
              hint: 'Mínimo 8 caracteres',
              enabled: !isLoading,
              autovalidateMode: AutovalidateMode.onUnfocus,
              validator: (v) => authValidator.validateField(AuthFields.password, v),
            ),

            FTextFormField.password(
              control: _confirmPasswordControl,
              style: (style) =>
                  style.withBaseFontSize(typography: context.theme.typography),
              label: const Text('Confirmar senha'),
              hint: 'Digite novamente',
              enabled: !isLoading,
              autovalidateMode: AutovalidateMode.onUnfocus,
              validator: (v) => authValidator.validateField(AuthFields.confirmPassword, v),
              onSubmit: (_) => _submit(),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : FButton(onPress: _submit, child: const Text('Criar conta')),
            ),
          ],
        ),
      ),
    );
  }
}

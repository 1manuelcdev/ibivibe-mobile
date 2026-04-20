import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:ibiapabaapp/app/theme/theme.dart';
import 'package:ibiapabaapp/features/auth/presentation/controllers/register_controller.dart';
import 'package:ibiapabaapp/features/auth/validation/auth_validator.dart';

class NameStep extends ConsumerStatefulWidget {
  final VoidCallback onNext;

  const NameStep({super.key, required this.onNext});

  @override
  ConsumerState<NameStep> createState() => _NameStepState();
}

class _NameStepState extends ConsumerState<NameStep> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  late final FTextFieldControl _nameControl;

  @override
  void initState() {
    super.initState();
    _name = ref.read(registerControllerProvider).formData.name;
    _nameControl = FTextFieldControl.managed(onChange: (v) => _name = v.text);
  }

  void _submit() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;
    ref.read(registerControllerProvider.notifier).setName(_name);
    widget.onNext();
  }

  @override
  Widget build(BuildContext context) {
    final authValidator = ref.watch(authValidatorProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Text(
              'Como você se chama?',
              style: context.theme.typography.xl2.copyWith(fontWeight: .w600),
            ),

            FTextFormField(
              control: _nameControl,
              style: (style) =>
                  style.withBaseFontSize(typography: context.theme.typography),
              hint: 'Seu nome e sobrenome',
              autovalidateMode: AutovalidateMode.onUnfocus,
              validator: (v) => authValidator.validateField(.name, v),
              onSubmit: (_) => _submit(),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: FButton(
                onPress: _submit,
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

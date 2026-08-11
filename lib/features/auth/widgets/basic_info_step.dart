import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:ibivibe/features/auth/register_state.dart';
import 'package:ibivibe/features/auth/viewmodels/register_viewmodel.dart';
import 'package:ibivibe/shared/ui/forms/fields/name/name_field.dart';
import 'package:ibivibe/shared/ui/forms/fields/slug/slug_field.dart';
import 'package:ibivibe/shared/ui/layout/form_topbar.dart';

class BasicInfoStep extends ConsumerStatefulWidget {
  final VoidCallback onNext;
  const BasicInfoStep({super.key, required this.onNext});

  @override
  ConsumerState<BasicInfoStep> createState() => _BasicInfoStepState();
}

class _BasicInfoStepState extends ConsumerState<BasicInfoStep> {
  final formKey = GlobalKey<FormState>();
  bool _isFormValid = false;

  late final FTextFieldControl _nameControl;

  @override
  void initState() {
    super.initState();
    _nameControl = FTextFieldControl.managed(
      onChange: (v) =>
          ref.read(registerViewModelProvider.notifier).setName(v.text),
    );
  }

  void _validateForm() {
    setState(() {
      _isFormValid = formKey.currentState?.validate() ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.read(registerViewModelProvider.notifier);
    final status = ref.watch(
      registerViewModelProvider.select((state) => state.status),
    );
    final isSubmitting = status == RegisterStatus.loading;

    return Form(
      key: formKey,
      onChanged: _validateForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          const FormTopbar(
            title: 'Dados básicos',
            subtitle: 'Agora conte um pouco sobre você',
          ),

          NameField(nameControl: _nameControl),
          SlugField(slugChecker: controller),

          const Spacer(),
          FButton(
            onPress: _isFormValid && !isSubmitting ? widget.onNext : null,
            child: isSubmitting
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Criar conta'),
          ),
        ],
      ),
    );
  }
}

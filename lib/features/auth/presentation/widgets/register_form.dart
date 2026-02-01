import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

import 'package:ibiapabaapp/app/theme/theme.dart';
import 'package:ibiapabaapp/features/auth/presentation/register_controller.dart';
import 'package:ibiapabaapp/features/auth/presentation/register_state.dart';

class RegisterForm extends StatefulWidget {
  final RegisterController controller;
  const RegisterForm({super.key, required this.controller});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _password = '';

  late final FTextFieldControl _nameControl;
  late final FTextFieldControl _emailControl;
  late final FTextFieldControl _passwordControl;

  @override
  void initState() {
    super.initState();
    _nameControl = FTextFieldControl.managed(onChange: (v) => _name = v.text);
    _emailControl = FTextFieldControl.managed(onChange: (v) => _email = v.text);
    _passwordControl = FTextFieldControl.managed(
      onChange: (v) => _password = v.text,
    );
    widget.controller.addListener(_controllerListener);
  }

  void _controllerListener() {
    final state = widget.controller.state;

    if (state is RegisterSuccess) {
      context.go('/app/home');
    }

    if (state is RegisterError) {
      showFToast(
        context: context,
        icon: const Icon(FIcons.triangleAlert),
        title: const Text('Erro ao fazer registro'),
        description: Text(state.message),
        alignment: FToastAlignment.bottomCenter,
        duration: const Duration(seconds: 4),
      );
    }

    setState(() {});
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    widget.controller.register(name: _name, email: _email, password: _password);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = widget.controller.state is RegisterLoading;

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          FTextFormField(
            control: _nameControl,
            style: (style) => style
                .withForeground(FTheme.of(context).colors)
                .withLabelPadding(bottom: 8),
            label: Text("Nome completo"),
            hint: 'Nome completo',
            enabled: !isLoading,
            autovalidateMode: .onUnfocus,
            validator: (v) =>
                (v == null || v.isEmpty) ? 'Informe seu nome' : null,
          ),

          FTextFormField.email(
            control: _emailControl,
            style: (style) => style
                .withForeground(FTheme.of(context).colors)
                .withLabelPadding(bottom: 8),
            label: Text("Email"),
            hint: 'exemplo@email.com',
            enabled: !isLoading,
            autovalidateMode: .onUnfocus,
            validator: (v) {
              if (v == null || v.isEmpty) return 'Informe o email';
              if (!v.contains('@')) return 'Email inválido';
              return null;
            },
          ),

          FTextFormField.password(
            control: _passwordControl,
            style: (style) => style
                .withForeground(FTheme.of(context).colors)
                .withLabelPadding(bottom: 8),
            label: Text("Senha"),
            hint: 'Senha',
            enabled: !isLoading,
            autovalidateMode: .onUnfocus,
            validator: (v) {
              if (v == null || v.isEmpty) return 'Informe a senha';
              if (v.length < 6) return 'Mínimo 6 caracteres';
              return null;
            },
          ),

          const SizedBox(height: 8),

          SizedBox(
            width: double.infinity,
            child: FButton(
              onPress: isLoading ? null : _submit,
              child: Text(
                isLoading ? 'Registrando…' : 'Registrar',
                style: TextStyle(fontWeight: .bold),
              ),
            ),
          ),

          FButton(
            onPress: () => context.replace('/auth/login'),
            style: FButtonStyle.ghost(),
            child: const Text('Já tenho conta'),
          ),
        ],
      ),
    );
  }
}

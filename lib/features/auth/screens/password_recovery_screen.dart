import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:ibivibe/features/auth/password_recovery_state.dart';
import 'package:ibivibe/features/auth/providers/auth_providers.dart';
import 'package:ibivibe/features/auth/viewmodels/password_recovery_viewmodel.dart';
import 'package:ibivibe/shared/ui/layout/form_topbar.dart';

class PasswordRecoveryScreen extends ConsumerStatefulWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  ConsumerState<PasswordRecoveryScreen> createState() =>
      _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState
    extends ConsumerState<PasswordRecoveryScreen> {
  final _requestFormKey = GlobalKey<FormState>();
  final _resetFormKey = GlobalKey<FormState>();
  late final FTextFieldControl _emailControl;
  late final FTextFieldControl _tokenControl;
  late final FTextFieldControl _passwordControl;
  late final FTextFieldControl _confirmationControl;

  String _email = '';
  String _token = '';
  String _password = '';
  String _confirmation = '';

  @override
  void initState() {
    super.initState();
    _emailControl = FTextFieldControl.managed(onChange: (v) => _email = v.text);
    _tokenControl = FTextFieldControl.managed(onChange: (v) => _token = v.text);
    _passwordControl = FTextFieldControl.managed(
      onChange: (v) => _password = v.text,
    );
    _confirmationControl = FTextFieldControl.managed(
      onChange: (v) => _confirmation = v.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(passwordRecoveryViewModelProvider);
    final state = controller.state;
    final isLoading = state.status == PasswordRecoveryStatus.loading;
    final isResetStep =
        state.status == PasswordRecoveryStatus.requestSent ||
        state.status == PasswordRecoveryStatus.error && _token.isNotEmpty;

    ref.listen(passwordRecoveryViewModelProvider, (previous, next) {
      if (next.state.status == PasswordRecoveryStatus.success) {
        if (!mounted) return;
        showFDialog(
          context: context,
          builder: (context, style, animation) => FDialog(
            style: style.call,
            animation: animation,
            title: const Text('Senha redefinida'),
            body: const Text('Agora você já pode entrar com sua nova senha.'),
            actions: [
              FButton(
                onPress: () => context.go('/auth/login'),
                child: const Text('Ir para o login'),
              ),
            ],
          ),
        );
      }
    });

    return SafeArea(
      child: FScaffold(
        header: FHeader.nested(
          prefixes: [
            FButton.icon(
              style: FButtonStyle.ghost(),
              onPress: () => context.pop(),
              child: const Icon(Icons.arrow_back, size: 24),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: isResetStep
              ? _buildResetStep(context, controller, isLoading)
              : _buildRequestStep(context, controller, isLoading),
        ),
      ),
    );
  }

  Widget _buildRequestStep(
    BuildContext context,
    PasswordRecoveryViewModel controller,
    bool isLoading,
  ) {
    final error = controller.state.errorMessage;
    return Form(
      key: _requestFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          const FormTopbar(
            subtitle: 'Enviaremos um código para o seu e-mail',
            title: 'Recuperar senha',
          ),
          FTextFormField(
            control: _emailControl,
            label: const Text('E-mail'),
            hint: 'exemplo@email.com',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || !value.contains('@')) {
                return 'Informe um e-mail válido';
              }
              return null;
            },
          ),
          if (error != null) _ErrorMessage(error),
          FButton(
            onPress: isLoading ? null : _request,
            child: Text(isLoading ? 'Enviando…' : 'Enviar código'),
          ),
        ],
      ),
    );
  }

  Widget _buildResetStep(
    BuildContext context,
    PasswordRecoveryViewModel controller,
    bool isLoading,
  ) {
    final error = controller.state.errorMessage;
    return Form(
      key: _resetFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          const FormTopbar(
            subtitle: 'Digite o código recebido e escolha uma nova senha',
            title: 'Nova senha',
          ),
          FTextFormField(
            control: _tokenControl,
            label: const Text('Código de recuperação'),
            hint: 'Cole o código do e-mail',
            enabled: !isLoading,
            validator: (value) => _required(value, 'Informe o código'),
          ),
          FTextFormField.password(
            control: _passwordControl,
            label: const Text('Nova senha'),
            hint: 'Mínimo 8 caracteres',
            enabled: !isLoading,
            validator: (value) {
              if (value == null || value.length < 8) {
                return 'Use pelo menos 8 caracteres';
              }
              return null;
            },
          ),
          FTextFormField.password(
            control: _confirmationControl,
            label: const Text('Confirmar nova senha'),
            hint: 'Digite novamente',
            enabled: !isLoading,
            validator: (value) =>
                value != _password ? 'As senhas não coincidem' : null,
          ),
          if (error != null) _ErrorMessage(error),
          FButton(
            onPress: isLoading ? null : _reset,
            child: Text(isLoading ? 'Salvando…' : 'Redefinir senha'),
          ),
        ],
      ),
    );
  }

  void _request() {
    if (!(_requestFormKey.currentState?.validate() ?? false)) return;
    ref.read(passwordRecoveryViewModelProvider).requestReset(email: _email);
  }

  void _reset() {
    if (!(_resetFormKey.currentState?.validate() ?? false)) return;
    ref
        .read(passwordRecoveryViewModelProvider)
        .resetPassword(
          token: _token,
          password: _password,
          passwordConfirmation: _confirmation,
        );
  }

  String? _required(String? value, String message) {
    return value == null || value.trim().isEmpty ? message : null;
  }
}

class _ErrorMessage extends StatelessWidget {
  final String message;

  const _ErrorMessage(this.message);

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: context.theme.typography.sm.copyWith(
        color: context.theme.colors.destructive,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:ibiapabaapp/features/auth/presentation/providers/auth_providers.dart';
import 'package:ibiapabaapp/features/auth/presentation/widgets/login/login_sheet.dart';

class WelcomeActions extends ConsumerWidget {
  const WelcomeActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginController = ref.watch(loginControllerProvider);
    return Column(
      spacing: 20,
      children: [
        FButton(
          onPress: () => context.push('/auth/register'),
          child: const Text("Criar conta"),
        ),
        FButton(
          onPress: () =>
              showLoginSheet(context: context, controller: loginController),
          style: FButtonStyle.ghost(),
          child: const Text("Entrar"),
        ),
      ],
    );
  }
}

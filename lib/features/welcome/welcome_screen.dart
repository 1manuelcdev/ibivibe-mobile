import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:ibiapabaapp/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ibiapabaapp/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:ibiapabaapp/features/auth/domain/usecases/login_with_email.dart';
import 'package:ibiapabaapp/features/auth/presentation/controllers/login_controller.dart';
import 'package:ibiapabaapp/features/auth/presentation/widgets/login/login_sheet.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return FScaffold(
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: .center,
              spacing: 32,
              children: [
                Image.asset(
                  'assets/images/highlights_placeholder.png',
                  opacity: const AlwaysStoppedAnimation(0.5),
                ),
                _Heading(),
                _Actions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Heading extends StatelessWidget {
  const _Heading();
  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 12,
      children: [
        Text(
          'Onde é hoje?',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),

        Text(
          'Descubra o que há de melhor na Ibiapaba em poucos toques, aproveite promoções e saiba em primeira mão sobre eventos do seu interesse.',
          style: TextStyle(fontSize: 14),
          textAlign: .center,
        ),
      ],
    );
  }
}

class _Actions extends StatelessWidget {
  _Actions();
  final controller = LoginController(
    LoginWithEmail(AuthRepositoryImpl(AuthRemoteDatasourceImpl())),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        FButton(
          onPress: () => context.push('/auth/register'),
          child: Text("Criar conta"),
        ),
        FButton(
          onPress: () =>
              showLoginSheet(context: context, controller: controller),
          style: FButtonStyle.outline(),
          child: Text("Entrar"),
        ),
      ],
    );
  }
}

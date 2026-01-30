import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:forui/forui.dart';

class CompanyOnboardingScreen extends StatelessWidget {
  const CompanyOnboardingScreen({super.key});

  void _goToLogin(BuildContext context) {
    context.push('/auth/login');
  }

  void _goToRegister(BuildContext context) {
    context.push('/auth/register');
  }

  @override
  Widget build(BuildContext context) {
    final forui = FTheme.of(context);

    return FScaffold(
      header: FHeader.nested(
        prefixes: [
          FButton.icon(
            onPress: () => context.pop(),
            style: FButtonStyle.ghost(),
            child: Icon(FIcons.arrowLeft, size: 24),
          ),
        ],
      ),
      child: SafeArea(
        child: IntroductionScreen(
          globalBackgroundColor: Theme.of(context).scaffoldBackgroundColor,

          pages: [
            PageViewModel(
              title: 'Bem-vinda, Empresa',
              body: 'Essa é a primeira tela do onboarding.',
              image: _PagePlaceholder(label: '1'),
            ),
            PageViewModel(
              title: 'Descubra',
              body: 'Aqui você explica o valor do aplicativo.',
              image: _PagePlaceholder(label: '2'),
            ),
            PageViewModel(
              title: 'Pronto?',
              image: _PagePlaceholder(label: '3'),
              bodyWidget: Column(
                spacing: 8,
                children: [
                  FButton(
                    onPress: () => _goToLogin(context),
                    child: Text('Entrar', style: TextStyle(fontWeight: .bold)),
                  ),
                  FButton(
                    style: FButtonStyle.secondary(),
                    onPress: () => _goToRegister(context),
                    child: Text('Criar conta'),
                  ),
                ],
              ),
            ),
          ],

          showSkipButton: false,
          showBackButton: true,
          showNextButton: true,
          showDoneButton: false,

          next: const Text(
            'Avançar',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          back: const Text('Voltar', style: TextStyle(color: Colors.grey)),

          dotsDecorator: DotsDecorator(
            color: forui.colors.border,
            activeColor: forui.colors.primary,
            size: const Size(8, 8),
            activeSize: const Size(20, 8),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),

          controlsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        ),
      ),
    );
  }
}

class _PagePlaceholder extends StatelessWidget {
  final String label;

  const _PagePlaceholder({required this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 220,
        height: 220,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: FTheme.of(context).colors.background,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

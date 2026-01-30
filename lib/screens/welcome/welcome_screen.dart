import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return FScaffold(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Center(
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
  const _Actions();
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        FButton(
          onPress: () => context.push('/onboarding/user'),
          child: Text(
            "Sou turista/morador",
            style: TextStyle(fontWeight: .bold),
          ),
        ),
        FButton(
          onPress: () => context.push('/onboarding/company'),
          style: FButtonStyle.outline(),
          child: Text("Sou empresa"),
        ),
      ],
    );
  }
}

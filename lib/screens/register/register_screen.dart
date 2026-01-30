import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:ibiapabaapp/screens/register/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                spacing: 16,
                children: [_RegisterHeader(), FDivider(), RegisterForm()],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RegisterHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          'Cadastro',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 12),
        FButton(
          onPress: () {},
          style: FButtonStyle.outline(),
          prefix: Image.asset('assets/images/google-g-logo.webp', width: 24),
          child: Text("Entrar com Google", style: TextStyle(fontSize: 14)),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 8,
      children: [
        Row(
          mainAxisAlignment: .start,
          children: [
            FButton.icon(
              style: FButtonStyle.ghost(),
              onPress: () => context.pop(),
              child: Icon(
                Icons.close,

                size: 24,
                color: context.theme.colors.mutedForeground,
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        FButton(
          onPress: () {},
          style: FButtonStyle.outline(),
          prefix: Image.asset('assets/images/google-g-logo.webp', width: 18),
          child: Text("Continuar com Google", style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}

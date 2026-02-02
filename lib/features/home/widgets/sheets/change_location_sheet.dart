import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

void showChangeLocationSheet({required BuildContext context}) {
  showModalBottomSheet(
    context: context,
    barrierColor: Colors.black45,
    isDismissible: true,
    showDragHandle: true,
    builder: (context) => Container(
      height: MediaQuery.of(context).size.height * 0.72,
      decoration: BoxDecoration(
        color: context.theme.colors.background,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            const Text(
              'Alternar cidade atual',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

            FButton(
              onPress: () => context.go('/welcome'),
              style: FButtonStyle.destructive(),
              prefix: const Icon(Icons.logout),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    ),
  );
}

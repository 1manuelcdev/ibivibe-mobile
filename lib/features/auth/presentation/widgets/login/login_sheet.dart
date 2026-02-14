import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:ibiapabaapp/features/auth/presentation/controllers/login_controller.dart';
import 'package:ibiapabaapp/features/auth/presentation/widgets/login/login_form.dart';
import 'package:ibiapabaapp/features/auth/presentation/widgets/login/login_header.dart';

// TODO: ajeitar altura do sheet
void showLoginSheet({
  required LoginController controller,
  required BuildContext context,
}) {
  showModalBottomSheet(
    context: context,
    barrierColor: Colors.black45,
    enableDrag: false,
    isDismissible: false,

    builder: (context) => Container(
      decoration: BoxDecoration(
        color: context.theme.colors.background,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),

      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        physics: const PageScrollPhysics(),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,

          children: [
            const LoginHeader(),
            const FDivider(),
            LoginForm(controller: controller),
          ],
        ),
      ),
    ),
  );
}

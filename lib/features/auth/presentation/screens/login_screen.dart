import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:ibiapabaapp/core/services/api_service.dart';
import 'package:ibiapabaapp/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ibiapabaapp/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:ibiapabaapp/features/auth/domain/usecases/login_with_email.dart';
import 'package:ibiapabaapp/features/auth/presentation/login_controller.dart';
import 'package:ibiapabaapp/features/auth/presentation/widgets/login_form.dart';
import 'package:ibiapabaapp/features/auth/presentation/widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController(
      LoginWithEmail(AuthRepositoryImpl(AuthRemoteDatasource(ApiService()))),
    );

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
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const LoginHeader(),
                  const FDivider(),
                  LoginForm(controller: controller),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

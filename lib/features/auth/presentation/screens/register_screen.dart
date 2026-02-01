import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:ibiapabaapp/core/services/api_service.dart';
import 'package:ibiapabaapp/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ibiapabaapp/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:ibiapabaapp/features/auth/domain/usecases/register_with_email.dart';
import 'package:ibiapabaapp/features/auth/presentation/register_controller.dart';
import 'package:ibiapabaapp/features/auth/presentation/widgets/register_form.dart';
import 'package:ibiapabaapp/features/auth/presentation/widgets/register_header.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = RegisterController(
      RegisterWithEmail(AuthRepositoryImpl(AuthRemoteDatasource(ApiService()))),
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
              padding: EdgeInsets.all(24),
              child: Column(
                spacing: 16,
                children: [
                  const RegisterHeader(),
                  FDivider(),
                  RegisterForm(controller: controller),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

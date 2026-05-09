import 'package:flutter/material.dart';
import 'package:ibiapabaapp/shared/ui/fragments/toast/show_app_toast.dart';

void showTodoToast(BuildContext context, String page) {
  // TODO: implementar a funcionalidade real de cada redirect
  showAppToast(context: context, title: 'TODO: redirecionar para $page');
}

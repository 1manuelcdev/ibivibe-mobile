import 'package:ibivibe/core/preferences/user_preferences_state_provider.dart';
import 'package:ibivibe/shared/providers/accounts_viewmodel.dart';
import 'package:ibivibe/features/auth/viewmodels/auth_viewmodel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router_redirect_provider.g.dart';

enum RedirectTarget { loading, welcome, onboarding, home }

@riverpod
RedirectTarget routerRedirect(Ref ref) {
  final isAuthenticated = ref.watch(isAuthenticatedProvider);

  // Aguarda carregamento antes de decidir destino
  if (!isAuthenticated) {
    final isLoading = ref.watch(accountsViewModelProvider).isLoading;

    if (isLoading) return RedirectTarget.loading;

    return RedirectTarget.welcome;
  }

  // Usuário autenticado: verifica se precisa de onboarding
  final needsOnboarding = ref
      .watch(userPreferencesStateProvider)
      .needsOnboarding;
  // A conta recém-criada já é adicionada ao cache antes da navegação para o
  // onboarding. Portanto, a presença de contas não significa que o fluxo foi
  // concluído; o indicador persistido é a fonte de verdade.
  if (needsOnboarding) return RedirectTarget.onboarding;

  return RedirectTarget.home;
}

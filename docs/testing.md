# Testes

O projeto possui dois grupos de testes:

- Testes unitários puros, que devem ser executados com `dart test`.
- Testes que dependem de `flutter_test`, widgets ou MethodChannels, que devem ser executados isoladamente com `flutter test <arquivo>`.

Não execute `flutter test` sem um arquivo específico neste ambiente. O comando compila o registrante de todos os plugins do app — incluindo WebView, mapas, vídeo e OAuth — antes de iniciar os testes e pode consumir recursos suficientes para derrubar o VSCode.

Exemplo de teste unitário:

```bash
dart test test/core/cache/cache_database_service_test.dart
```

O `CacheDatabaseService` aceita um diretório temporário injetado para que seu teste não dependa de `path_provider` nem de canais nativos.

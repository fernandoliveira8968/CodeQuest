import 'package:flutter/material.dart';
import 'ecras/ecra_inicial.dart';

/// Variável global que guarda o modo de tema utilizado (escuro ou claro)
final ValueNotifier<ThemeMode> modoTema = ValueNotifier(ThemeMode.system);

void main() {
  runApp(const CodeQuestApp());
}

class CodeQuestApp extends StatelessWidget {
  const CodeQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: modoTema, 
      builder: (context, temaAtual, child) {
        return MaterialApp(
          title: 'CodeQuest',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),
          themeMode: temaAtual,
          home: const EcraInicial(),
        );
      }
    );
  }
}

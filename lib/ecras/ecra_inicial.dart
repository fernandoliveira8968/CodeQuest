import 'package:flutter/material.dart';
import 'ecra_login.dart';
import 'ecra_registo.dart';

class EcraInicial extends StatelessWidget {
  const EcraInicial({super.key});

  @override
  /// É criado um widget que
  Widget build(BuildContext context){
    /// retorna um Scaffold que nele contem
    return Scaffold(
      /// um body que se apresenta numa "área segura", ou seja, 
      /// não se sobrepõe ao local da camera ou barra superior do sistema
      body: SafeArea(
        /// um child centralizado na página
        child: Center(
          /// com um padding
          child: Padding(
            /// de 32 pixeis em todos os lados
            padding: const EdgeInsets.all(32),
            /// uma coluna com o seu conteúdo alinhado ao centro
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              /// Com um children que contém
              children: [
                const Icon(
                  /// Um ícone de tamanho 80 pixeis e cor azul
                  Icons.code,
                  size: 80,
                  color: Colors.blue,
                ),

                /// Esta caixa serve apenas para dar espaço entre elementos
                const SizedBox(height: 24),

                /// Um texto que dá nome à aplicação e serve como título
                const Text(
                  "CodeQuest",
                  /// Fonte de tamanho 36 pixeis, a negrito e azul
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),

                /// Esta caixa serve apenas para dar espaço entre elementos
                const SizedBox(height: 8),

                /// Um texto que faz uma pequena introdução à app
                const Text(
                  "Testes de Conhecimento de Programação",
                  /// alinhado ao centro, fonte 16 pixeis e cinzento
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),

                /// Esta caixa serve apenas para dar espaço entre elementos
                const SizedBox(height: 48),

                /// Esta caixa representa um botão de iniciar sessão
                SizedBox(
                  /// formatada para ocupar apenas o espaço necessário
                  width: double.infinity,
                  /// nela contem um child com um botão
                  child: ElevatedButton(
                    /// que quando pressionado
                    onPressed: () {
                      /// Apresenta um novo ecrã
                      Navigator.push(
                        context,
                        /// MaterialPageRoute é uma animação de transição entre páginas
                        MaterialPageRoute(
                          /// É criada a página que vai ser apresentada quando o botão for pressionado
                          builder: (context) => const EcraLogin()
                        ),
                      );
                    },
                    /// e apresenta o texto de informação no seu interior
                    child: const Text('Iniciar Sessão'),
                  ),
                ),
              
                /// Esta caixa serve apenas para dar espaço entre elementos
                const SizedBox(height: 16),

                /// Esta caixa representa o botão de registar
                SizedBox(
                  /// formatada para ocupar apenas o espaço necessário
                  width: double.infinity,
                  /// nela contem um child com um botão
                  child: OutlinedButton(
                    /// que quando pressionado faz ... (a acrescentar funcionalidade)
                    onPressed: () {
                      /// Apresenta um novo ecrã
                      Navigator.push(
                        context,
                        /// MaterialPageRoute é uma animação de transição entre páginas
                        MaterialPageRoute(
                          /// É criada a página que vai ser apresentada quando o botão for pressionado
                          builder: (context) => const EcraRegisto()
                          ),
                      );
                    },
                    /// e apresenta o texto de informação no seu interior
                    child: const Text('Registar'),
                  ),
                ),
              ],
            )
          )
        )
      )
    );
  }
}
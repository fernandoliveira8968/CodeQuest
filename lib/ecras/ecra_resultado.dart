import 'package:flutter/material.dart';
import '../modelos/utilizador.dart';
import 'ecra_menu.dart';

/// Classe que apresenta o resultado
class EcraResultado extends StatelessWidget {
  /// variável que guarda o nome do utilizador
  final Utilizador utilizador;
  /// variável que guarda a pontuação do utilizador
  final int pontuacao;
  /// variável que guarda o total de perguntas respondidas
  final int total;
  /// variável que guarda a categoria das perguntas relacionadas com o resultado
  final String categoria;

  final int acertos;

  const EcraResultado({
    super.key,
    required this.utilizador,
    required this.pontuacao,
    required this.total,
    required this.categoria,
    required this.acertos,
  });

  /// Neste widget é definido a "aparência" do que irá mostrar o ecrã
  @override
  Widget build(BuildContext context) {

    /// Devolve um Scaffold que contem
    return Scaffold(
      /// Uma AppBar
      appBar: AppBar(
        /// Com um título
        title: const Text("Resultado"),
        /// Remove o botão de voltar da AppBar
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Um ícone que varia consoante o resultado de uma condição
                Icon(
                  /// Se a pontuação for maior ou igual que o total de perguntas respondidas, divididas por 2, ou seja >= 50%
                  acertos >= total / 2
                  /// apresenta um icon em forma de visto
                  ? Icons.check 
                  /// Senão, apresenta um icon em cruz
                  : Icons.clear,
                  size: 80,
                  /// A cor so ícone varia consoante o resultado de uma condição
                  /// Se a pontuação for maior ou igual que o número total de respostas respondidas a dividir por 2, ou seja >= 50%
                  color: acertos >= total / 2 
                  /// O ícone aparece a amarelo
                  ? Colors.green 
                  /// Se não, aparece a cinzento
                  : Colors.red,
                ),

                const SizedBox(height: 24),

                /// Um texto que apresenta a pontuação face ao total de respostas respondidas
                Text(
                  "$pontuacao pontos",
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                /// Um texto que apresenta o número de respostas corretas face ao número de respostas respondidas
                Text(
                  "$acertos de $total respostas corretas!",
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),

                const SizedBox(height: 8),

                /// Um texto que apresenta a categoria das respostas respondidas
                Text(
                  "Categoria: $categoria",
                  style: const TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 48),

                SizedBox(
                  width: double.infinity,
                  /// Um botão para poder voltar ao menu assim que o utilizador o entender
                  child: ElevatedButton(
                    onPressed: () {
                      /// substitui o ecrã atual pelo ecrã de menu inicial
                      Navigator.pushReplacement(
                        context,
                        /// Através de uma animação
                        MaterialPageRoute(
                          builder: (context) => EcraMenu(utilizador: utilizador),
                        ),
                      );
                    },
                    child: const Text("Voltar ao Menu"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
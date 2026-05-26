import 'package:flutter/material.dart';
import '../modelos/utilizador.dart';
import 'ecra_jogo_niveis.dart';
import 'ecra_ranking_menu.dart';

class EcraMenu extends StatelessWidget {
  final Utilizador utilizador;

  /// Para que este ecrã seja criado, é obrigatório um utilizador
  const EcraMenu({super.key, required this.utilizador});

  @override
  Widget build(BuildContext context){
    /// Este Scaffold contem
    return Scaffold(
      /// Uma AppBar que se posiciona no topo do ecrã
      appBar: AppBar(
        /// Um titulo
        title: const Text("Menu Principal"),
        /// Automaticamente remove o botão de voltar, pois levaria ao ecrã de login novamente
        automaticallyImplyLeading: false,
      ),
      /// um body que se apresenta numa "área segura", ou seja, 
      /// não se sobrepõe ao local da camera ou barra superior do sistema
      body: SafeArea(
        /// Um child centralizado
        child: Center(
          /// E com um padding
          child: Padding(
            /// Em todos os lado de 32 pixeis
            padding: const EdgeInsets.all(32),
            /// Uma coluna
            child: Column(
              /// Alinhada ao centro
              mainAxisAlignment: MainAxisAlignment.center,
              /// Um children
              children: [
                /// Com um texto de boas vindas que inclui o nome do utilizador autenticado
                Text(
                  "Olá, ${utilizador.nome}!",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                /// Esta caixa serve apenas para dar espaço entre elementos
                const SizedBox(height: 32),

                /// Cria 3 botões nos quais as suas caracteristicas são definidas através do widget _botaoCategoria
                _botaoCategoria(context, 1),
                const SizedBox(height: 16),
                _botaoCategoria(context, 2),
                const SizedBox(height: 16),
                _botaoCategoria(context, 3),
                const SizedBox(height: 16),

                ///E um botão diferente dos outros, porque a sua função é de ver o ranking
                SizedBox(
                  /// Ocupa apenas o espaço necessário
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    /// Quando pressionado, envia para uma nova página
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EcraRankingMenu(),
                      ),
                    ),
                    /// Apresenta-se com um ícone
                    icon: const Icon(Icons.leaderboard),
                    /// E uma etiqueta
                    label: const Text("Ver Ranking"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  /// Este widget define os atributos dos botões de teste do ecrã de menu
  Widget _botaoCategoria(BuildContext context, int nivel){
    return SizedBox(
      width: double.infinity,
      child: 
        ElevatedButton.icon(
          /// Quando o botão é pressionado, vai para o nível em questão
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EcraNiveis(
                  utilizador: utilizador,
                  nivel: nivel,
                ),
              ),
            );
          },
          /// Apresenta-se com uma etiqueta
          label: Text("Nível $nivel"),
        ),
    );
  }

}
import 'package:flutter/material.dart';
import 'ecra_ranking_niveis.dart';

/// Classe que apresenta o ecrã de ranking
class EcraRankingMenu extends StatelessWidget {
  const EcraRankingMenu({super.key});

  @override
  /// Widget que constroi os botões
  Widget build(BuildContext context){
    /// Retorna um Scaffold que contem
    return Scaffold(
      /// Uma AppBar com um título fixo
      appBar: AppBar(
        title: const Text("Ranking"),
      ),
      /// um body que se apresenta numa "área segura", ou seja, 
      /// não se sobrepõe ao local da camera ou barra superior do sistema
      body: SafeArea(
        /// Um child centralizado
        child: Center(
          /// Um padding em todos os lados por 32 pixeis
          child: Padding(
            padding: const EdgeInsets.all(32),
            /// Uma coluna que apresenta os botões centralizados
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Cria 3 botões nos quais as suas caracteristicas são definidas através do widget _botaoCategoriaRanking
                _botaoCategoriaRanking(context, "Dart"),
                const SizedBox(height: 16),
                _botaoCategoriaRanking(context, "Flutter"),
                const SizedBox(height: 16),
                _botaoCategoriaRanking(context, "SQL"),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      )
    );
  }

  /// Este widget define os atributos dos botões de ranking do ecrã de ranking
  Widget _botaoCategoriaRanking(BuildContext context, String categoria){
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        /// Quando o botão é pressionado reencaminha para uma nova página
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EcraRankingNiveis(categoria: categoria),
          ),
        ),
        /// Apresenta-se com um ícone
        icon: const Icon(Icons.leaderboard),
        label: Text(categoria),
        /// E a etiqueta definida em cada botão
      )
    );
  }
}
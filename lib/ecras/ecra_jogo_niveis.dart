import 'package:flutter/material.dart';
import '/ecras/ecra_jogo.dart';
import '../modelos/utilizador.dart';

/// Classe que apresenta o ecrã de ranking
class EcraNiveis extends StatelessWidget {
  final Utilizador utilizador;
  final int nivel;

  const EcraNiveis({
    super.key,
    required this.utilizador,
    required this.nivel,
  });

  @override
  /// Widget que constroi os botões
  Widget build(BuildContext context){
    /// Retorna um Scaffold que contem
    return Scaffold(
      /// Uma AppBar com um título fixo
      appBar: AppBar(
        title: Text("Nível $nivel"),
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
                /// Cria 3 botões no qual as suas caracteristicas são definidas através do widget _botaoNiveis
                _botaoNiveis(context, "Dart", "Dart"),
                const SizedBox(height: 16),
                _botaoNiveis(context, "Flutter", "Flutter"),
                const SizedBox(height: 16),
                _botaoNiveis(context, "SQL", "SQL"),
              ],
            ),
          ),
        ),
      )
    );
  }

  /// Este widget define os atributos dos botões de ranking do ecrã de ranking
  Widget _botaoNiveis(BuildContext context, String etiqueta, String categoria){
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        /// Quando o botão é pressionado reencaminha para uma nova página
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EcraJogo(
              utilizador: utilizador,
              categoria: categoria,
              nivel: nivel
            ),
          ),
        ),
        /// Apresenta-se com um ícone
        icon: const Icon(Icons.leaderboard),
        /// E a etiqueta definida em cada botão
        label: Text(etiqueta),
      )
    );
  }
}
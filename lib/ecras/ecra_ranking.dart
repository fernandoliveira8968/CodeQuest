import 'package:flutter/material.dart';
import '../database/database_helper.dart';

/// Classe que apresenta o ranking
class EcraRanking extends StatefulWidget {
  /// Se for null, ou seja, não existir categoria, mostra o ranking geral
  final String? categoria;
  final int? nivel;
  const EcraRanking({
    super.key, 
    this.categoria,
    this.nivel
    });

  @override
  State<EcraRanking> createState() => _EcraRankingState();
}

class _EcraRankingState extends State<EcraRanking> {
  final _db = DatabaseHelper();

  /// Lista vazia para guardar os resultados do ranking
List<Map<String, dynamic>> _resultados = [];
    /// Controla se está a carregar os resultados ou não
  bool _loading = true;

  @override
  /// Método que carrega o ranking através do método _carregarRanking
  void initState() {
    super.initState();
    _carregarRanking();
  }

  /// Método que carrega os resultados do ranking da base de dados
Future<void> _carregarRanking() async {
  final resultados = await _db.obterRanking(
    categoria: widget.categoria,
    nivel: widget.nivel,
  );
  setState(() {
    _resultados = resultados;
    _loading = false;
  });
}

  @override
  /// Neste widget é definido a "aparência" do que irá mostrar o ecrã
  Widget build(BuildContext context) {
    /// Se estiver a carregar
    if (_loading) {
      /// Retorna um Scaffold
      return const Scaffold(
        /// Centrado com um icone de carregamento
        body: Center(child: CircularProgressIndicator()),
      );
    }
    
    /// Caso contrário, se já carregou, retorna um Scaffold que contem
    return Scaffold(
      /// Uma AppBar
      appBar: AppBar(
        /// Com um título que mostra ou a categoria ou o texto predefinido
        title: Text(widget.categoria ?? "Ranking Geral")
        ),
      /// Um body que a sua aparência varia consoante o resultado de uma condição
      /// Se os resultado estão vazios
      body: _resultados.isEmpty
          /// Apresenta essa mensagem, centralizada, ao utilizador
          ? const Center(child: Text("Sem resultados ainda"))
          /// Caso contrário, apresenta uma lista
          : ListView.builder(
              /// Em que o seu tamanho vai ser igual ao tamanho da lista de resultados
              itemCount: _resultados.length,
              itemBuilder: (context, index) {
                /// Apresenta o resultado atual através do index na lista _resultados
                final resultado = _resultados[index];
                return ListTile(
                  /// E a posição no ranking
                  leading: Text(
                    "${index + 1}º",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  /// Apresenta a categoria das perguntas respondidas
                  title: Text(resultado['nome']),
                  /// Com a melhor pontuação
                  trailing: Text(
                    "${resultado['melhor_pontuacao']} pontos",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
    );
  }
}
import 'package:flutter/material.dart';
import '../modelos/utilizador.dart';
import '../database/database_helper.dart';

class EcraEstatisticas extends StatefulWidget {
  final Utilizador utilizador;

  const EcraEstatisticas({super.key, required this.utilizador});

  @override
  State<EcraEstatisticas> createState() => _EcraEstatisticasState();
}

class _EcraEstatisticasState extends State<EcraEstatisticas> {
  final _db = DatabaseHelper();

  /// Cria uma lista que guarda as estatisticas
  List<Map<String, dynamic>> _estatisticas = [];
  /// Variável que guarda se o ecrã está a carregar ou não
  bool _aCarregar = true;

  @override
  void initState() {
    super.initState();
    _carregarEstatisticas();
  }

  /// Devolve, no futuro, uma função que vai carregar as estatisticas
  Future<void> _carregarEstatisticas() async {
    /// Guarda na variável dados o resultado do método obterEstatisticas
    final dados = await _db.obterEstatisticas(widget.utilizador.id!);
    /// Atualiza o ecrã para que quando o valor for carregado na variável,
    setState(() {
      /// O valor da variável dados fique guardado na lista de estatisticas
      _estatisticas = dados;
      /// "Termina" de carregar
      _aCarregar = false;
    });
  }

  /// Widget que define a aparência deste ecrã
  @override
  Widget build(BuildContext contexto) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("As Minhas Estatísticas"),
      ),
      /// Cria uma condição de que se está a carregar (True)
      body: _aCarregar
        /// Apresenta um icone de carregamento
          ? const Center(child: CircularProgressIndicator())
          /// Se não está (False), e se a lista de estatisticas está vazia
          : _estatisticas.isEmpty
              /// Apresenta um texto centrado
              ? const Center(
                  child: Text("Ainda não respondeste a nenhum teste."),
                )
              /// Caso contrário, apresenta uma vista de lista com 
              : ListView.builder(
                  /// Um padding em todos os lados de 16px
                  padding: const EdgeInsets.all(16),
                  /// Conta a quantidade de estatisticas presentes na lista
                  itemCount: _estatisticas.length,
                  /// Constroi cada item a partir da posição do indice da lista
                  itemBuilder: (context, indice) {
                    final linha = _estatisticas[indice];
                    final int totalAcertos = linha["totalAcertos"] ?? 0;
                    final int totalPerguntas = linha["totalPerguntas"] ?? 1;
                    final int totalErros = totalPerguntas - totalAcertos;
                    final double percentagemAcerto =
                        (totalAcertos / totalPerguntas) * 100;
                    final double percentagemErro =
                        (totalErros / totalPerguntas) * 100;

                    /// Devolve um cartão com o resultado
                    return Card(
                      /// com uma margem apenas em baixo de 12px, para dar espaço entre cartões
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Padding(
                        /// Um padding em todos os lados de 16px
                        padding: const EdgeInsets.all(16),
                        /// Uma coluna
                        child: Column(
                          /// Alinhada ao início
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Um título com a categoria e nível em questão a apresentar
                            Text(
                              "${linha["categoria"]} — Nível ${linha["nivel"]}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "$totalPerguntas respostas dadas",
                              style: TextStyle(
                                fontSize: 13,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            const SizedBox(height: 12),

                            // Barra de acertos
                            _barraEstatistica(
                              contexto: context,
                              etiqueta: "Acertos",
                              valor: percentagemAcerto,
                              cor: Colors.green,
                            ),
                            const SizedBox(height: 8),

                            // Barra de erros
                            _barraEstatistica(
                              contexto: contexto,
                              etiqueta: "Erros",
                              valor: percentagemErro,
                              cor: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }

  /// Widget auxiliar que constrói uma linha com etiqueta, barra e percentagem
  Widget _barraEstatistica({
    required BuildContext contexto,
    required String etiqueta,
    required double valor,
    required Color cor,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(etiqueta, style: const TextStyle(fontSize: 13)),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: valor / 100,
              minHeight: 12,
              backgroundColor: Theme.of(contexto)
                  .colorScheme
                  .surfaceContainerHighest,
              valueColor: AlwaysStoppedAnimation<Color>(cor),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          "${valor.toStringAsFixed(1)}%",
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../modelos/utilizador.dart';
import '../modelos/pergunta.dart';
import '../modelos/resultado.dart';
import 'ecra_resultado.dart';

class EcraJogo extends StatefulWidget {
  final Utilizador utilizador;
  final String categoria;
  final int nivel;

  const EcraJogo ({
    super.key,
    required this.utilizador,
    required this.categoria,
    required this.nivel,
  });

  @override
  State<EcraJogo> createState() => _EcraJogoState();
}

class _EcraJogoState extends State<EcraJogo>{
  final _db = DatabaseHelper();

  ///Uma lista vazia para as perguntas
  List<Pergunta> _perguntas = [];

  /// Índice da pergunta atual na lista
  int _indiceAtual = 0;
  /// Pontuação acumulada
  int _pontuacao = 0;
  /// Opção escolhida pelo utilizador, null (?) se ainda não escolheu
  String? _respostaSelecionada;
  // Controla se já respondeu ou não
  bool _respondeu = false;
  /// Controla se está a carregar as perguntas ou não
  bool _loading = true;
  /// Variável que guarda o número de respostas acertadas
  int _acertos = 0;

  /// Método que carrega as perguntas através do método _carregarPerguntas
  @override
  void initState() {
    super.initState();
    _carregarPerguntas();
  }
  
  /// Método que define como é que as perguntas vão ser carregadas para o utilizador
  Future<void> _carregarPerguntas() async{
    /// Obtem as perguntas através do método obterPerguntas
    final perguntas = await _db.obterPerguntas(widget.categoria, widget.nivel);
    /// Atualiza o ecrã para que estas perguntas seja exibidas e que o estado de carregamento desapareça
    setState(() {
      _perguntas = perguntas;
      _loading = false;
    });
  }

  /// Este método confirma as respostas
  void _confirmarResposta() {
    /// Se nenhuma resposta for selecionada, sai do método
    if (_respostaSelecionada == null) return;
    /// Atualiza o ecrã com
    setState(() {
      /// A informação de que o utilizador já respondeu
      _respondeu = true;
      /// E se a resposta selecionada for a resposta correta (a pergunta atual que é representada 
      /// pelo indice atual na lista _perguntas corresponder ao valor da variável respostaCorreta)
      if (_respostaSelecionada == _perguntas[_indiceAtual].respostaCorreta) {
        /// Incrementa o número de respostas corretas
        _acertos++;
        /// Adiciona pontos consoante o nível
        switch (widget.nivel) {
          /// Caso seja nível 1, acrescenta mais 10 pontos por cada resposta correta
          case 1: _pontuacao += 10; break;
          /// Caso seja nível 2, acrescenta mais 20 pontos por cada resposta correta
          case 2: _pontuacao += 20; break;
          /// Caso seja nível 3, acrescenta mais 30 pontos por cada resposta correta
          case 3: _pontuacao += 30; break;
        }
      } else {
        /// Desconta pontos consoante o nível, sem deixar ficar negativo
        switch (widget.nivel) {
          /// Caso seja nível 1, desconta 5 pontos por cada resposta incorreta
          case 1: _pontuacao -= 5; break;
          /// Caso seja nível 2, desconta 10 pontos por cada resposta incorreta
          case 2: _pontuacao -= 10; break;
          /// Caso seja nível 3, desconta 15 pontos por cada resposta incorreta
          case 3: _pontuacao -= 15; break;
        }
      }
    });
  }

  
  
  /// Este método serve para que seja possível avançar para a próxima pergunta
  Future<void> _avancar() async{
    /// Se a minha posição na lista de perguntas for menor que o tamanho da lista - 1
    if (_indiceAtual < _perguntas.length - 1) {
      /// Atualiza o ecrã com
      setState(() {
        /// O valor da variável indice atual incrementa em 1
        _indiceAtual ++;
        /// A variável respostaSelecionada fica null, para que seja possível guardar a próxima seleção
        _respostaSelecionada = null;
        /// E a variável _respondeu torna-se falsa
        _respondeu = false;
      });
    } 
    /// Caso contrário
    else {
      /// Cria uma variável resultado para guardar e apresentar o resultado final do utilizador
      final resultado = Resultado(
        /// Guarda o id do utilizador que é garantido nunca ser nulo (através do id!)
        utilizadorId: widget.utilizador.id!,
        /// A sua pontuação
        pontuacao: _pontuacao,
        /// O seu nivel
        nivel: widget.nivel,
        /// A sua categoria
        categoria: widget.categoria,
        /// Guarda e converte a data atual para um formato internacionalmente conhecido
        data: DateTime.now().toIso8601String(),
      );
        
      /// Guarda o resultado na base de dados
      await _db.guardarResultado(resultado);

      /// Se o utilizador já saiu do ecrã atual, não faz nada
      if (!mounted) return;
      /// Se isso não acontecer, o código segue e substitui o ecrã atual pelo ecrã que apresenta o resultado
      Navigator.pushReplacement(
        context,
        /// Através de uma animação
        MaterialPageRoute(
          builder: (context) => EcraResultado(
            utilizador: widget.utilizador,
            pontuacao: _pontuacao,
            total: _perguntas.length,
            categoria: widget.categoria,
            acertos: _acertos,
          ),
        ),
      );
    }
  }

  /// Neste widget é definida a "aparência" do que irá mostrar o ecrã
  @override
  Widget build(BuildContext context){
    /// Se a app estiver a carregar as perguntas
    if (_loading) {
      return const Scaffold(
        body: Center(
          /// Mostra um simbolo de carregamento centrado no ecrã
          child: CircularProgressIndicator(),
        ),
      );
    }
    /// Se a lista de perguntas está vazia, ou seja, não há mais perguntas para responder
    if (_perguntas.isEmpty){
      return   Scaffold(
        appBar: AppBar(title: Text(widget.categoria)),
        body: const Center(
          /// É apresentada uma mensagem centrada ao utilizador com essa informação
          child: Text("Sem perguntas disponíveis")
        ),
      );
    }

    /// Guarda o conteúdo da posição atual na lista _perguntas como uma variável pergunta 
    final pergunta = _perguntas[_indiceAtual];
    /// Guarda as "etiquetas" das opções numa lista
    final opcoes = ["A", "B", "C", "D"];
    /// Guarda os textos das perguntas numa lista
    final textos = [pergunta.opcaoA, pergunta.opcaoB, pergunta.opcaoC, pergunta.opcaoD];

    /// Devolve um Scaffold que contem
    return Scaffold(
      /// Uma AppBar em que o seu título varia consoante a categoria selecionada
      appBar: AppBar(
        title: Text(widget.categoria),
      ),
      /// um body que se apresenta numa "área segura", ou seja, 
      /// não se sobrepõe ao local da camera ou barra superior do sistema
      body: SafeArea(
        /// Com um padding que se aplica a todos os lados por 32 pixeis
        child: Padding(
          padding: const EdgeInsets.all(24),
          /// Uma coluna
          child: Column(
            /// Alinhada ao inicio
            crossAxisAlignment: CrossAxisAlignment.start,
            /// Um children que contem
            children: [
              /// Um texto de guia para saber em que pergunta o utilizador se encontra referente ao total da lista
              Text(
                "Pergunta ${_indiceAtual + 1} de ${_perguntas.length}",
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 16),

              /// Um texto que apresenta a pergunta
              Text(
                pergunta.pergunta,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 24),

              /// Gera uma lista de 4 elementos, que se baseiam no indice atual das listas opcoes e textos. 
              /// Ou seja, o A vai corresponder ao perguntaOpcaoA, o B ao perguntaOpcaoB, etc
              ...List.generate(4, (i){
                final opcao = opcoes[i];
                final texto = textos[i];

                Color cor = Colors.transparent;

                /// Se já respondeu
                if (_respondeu) {
                  /// Então se a opcao for igual à resposta correta
                  if (opcao == pergunta.respostaCorreta) {
                    /// altera a opcao para cor verde
                    cor = Colors.green.shade300;
                    /// Se for a opcao errada
                  } else if (opcao == _respostaSelecionada) {
                    /// altera a cor para vermelho
                    cor = Colors.red.shade300;
                  }
                }
                /// É utilizado um detetor de gestos para quando o utilizador responder, bloquear as opções
                return GestureDetector(
                  /// Se já responder (_respondeu = true), o toque (onTap) fica nulo, ou seja, inativo
                  /// Se ainda não, ainda pode selecionar uma opção 
                  onTap: _respondeu ? null : () {
                    /// Atualiza o ecrã para que a resposta selecionada seja igual à opção
                    setState(() {
                      _respostaSelecionada = opcao;
                    });
                  } ,
                  /// Este child contem uma animação de mudança de cor quando a resposta está certa ou errada
                  child: AnimatedContainer(
                    /// Que dura 300 milésimos de segundo
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: cor,
                      border: Border.all(
                        /// E para que a opção selecionada se destaque das restantes, 
                        /// esta fica a azul enquanto as outras ficam a cinzento
                        color: _respostaSelecionada == opcao
                          ? Colors.blue
                          : Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    /// Apresenta a opção com a possivel resposta 
                    child: Text("$opcao. $texto"),
                  ),
                );
              }),
              
              /// O spacer é utilizado para empurrar o restante conteúdo para o fundo do ecrã
              const Spacer(),

              /// Se o utilizador já respondeu
              if (_respondeu) 
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  /// Apresenta uma explicação para a pergunta
                  child: Text(pergunta.explicacao),
                ),
              

                const SizedBox(height: 16),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    /// Este botão, quando pressionado, tem uma ação consoante o resultado de uma condição
                    /// Se se já respondeu, avança. 
                    /// Se selecionou uma resposta, ou seja _respostaSelecionada diferente de nulo, pode confirmar a resposta
                    /// Se não selecionou, o botão fica inativo
                    onPressed: _respondeu 
                    ? _avancar 
                    : (_respostaSelecionada != null 
                      ? _confirmarResposta 
                      : null), 
                      /// O texto apresentado varia consoante o resultado de uma condição
                      /// Se já respondeu, apresenta e ainda há perguntas, apresenta "próximo"
                      /// Se já respondeu mas não há mais perguntas, apresenta "ver resultado"
                      /// Se ainda não respondeu, apresenta "Confirmar" para confirmar a resposta.
                    child: Text(_respondeu 
                    ? (_indiceAtual < _perguntas.length - 1 ? "Próxima" : "Ver Resultado")
                    : "Confirmar"),
                  ),
                ),
            ],
          )
        ),
      )
    );
  }
}
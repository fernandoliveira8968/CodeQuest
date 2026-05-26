/// Esta classe representa as perguntas
class Pergunta{
  final int? id;
  final String categoria;
  final int nivel;
  final String pergunta;
  final String opcaoA;
  final String opcaoB;
  final String opcaoC;
  final String opcaoD;
  final String respostaCorreta;
  final String explicacao;
  
  /// Este construtor é utilizado para criar as perguntas. 
  /// Recebe os dados da classe e atribui-os às propriedades
  /// Todos os campos (menos o id) são obrigatórios.
  Pergunta({
  this.id,
  required this.categoria,
  required this.nivel,
  required this.pergunta,
  required this.opcaoA,
  required this.opcaoB,
  required this.opcaoC,
  required this.opcaoD,
  required this.respostaCorreta,
  required this.explicacao,
  });
  
  /// São atribuídas chaves-valor com os valores das variáveis para a base de dados
  Map<String, dynamic> paraMap(){
    return{
      "id": id,
      "categoria": categoria,
      "nivel": nivel,
      "pergunta": pergunta,
      "opcao_a": opcaoA,
      "opcao_b": opcaoB,
      "opcao_c": opcaoC,
      "opcao_d": opcaoD,
      "resposta_correta": respostaCorreta,
      "explicacao": explicacao,
    };
  }

  // O factory permite que a lógica do construtor se mantenha.
  /// Faz o contrário do paraMap. Atribui os valores da base de dados para a aplicação. 
  /// Utilizado para importar dados da base de dados para a app.
  factory Pergunta.deMap(Map<String, dynamic> map) {
    return Pergunta(
      id: map["id"],
      categoria: map["categoria"],
      nivel: map["nivel"],
      pergunta: map["pergunta"],
      opcaoA: map["opcao_a"],
      opcaoB: map["opcao_b"],
      opcaoC: map["opcao_c"],
      opcaoD: map["opcao_d"],
      respostaCorreta: map["resposta_correta"],
      explicacao: map["explicacao"],
    );
  }

}
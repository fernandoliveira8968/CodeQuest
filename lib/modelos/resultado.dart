/// Esta classe representa os resultados
class Resultado{
  final int? id;
  final int utilizadorId;
  final int pontuacao;
  final int nivel;
  final String categoria; 
  final String data;
  final int acertos;
  final int totalPerguntas;

  /// Este construtor é utilizado para dar os resultados. 
  /// Recebe os dados da classe e atribui-os às propriedades
  /// Todos os campos (menos o id) são obrigatórios.
  Resultado({
    this.id,
    required this.utilizadorId,
    required this.pontuacao,
    required this.nivel,
    required this.categoria,
    required this.data,
    required this.acertos,
    required this.totalPerguntas,
  });

  /// São atribuídas chaves-valor com os valores das variáveis para a base de dados
  Map<String, dynamic> paraMap(){
    return{
    "id": id,
    "utilizador_id": utilizadorId,
    "pontuacao": pontuacao,
    "nivel": nivel,
    "categoria": categoria,
    "data": data,
    "acertos": acertos,
    "total_perguntas": totalPerguntas,
    };
  }

  // O factory permite que a lógica do construtor se mantenha.
  /// deMap faz o contrário do paraMap. Atribui os valores da base de dados para a aplicação. 
  /// Utilizado para importar dados da base de dados para a app.
  factory Resultado.deMap(Map<String, dynamic> map){
    return Resultado(
      id: map["id"],
      utilizadorId: map["utilizador_id"],
      pontuacao: map["pontuacao"],
      nivel: map["nivel"],
      categoria: map["categoria"],
      data: map["data"],
      acertos:map["acertos"] ?? 0,
      totalPerguntas: map["total_perguntas"] ?? 1,
    );
  }

}
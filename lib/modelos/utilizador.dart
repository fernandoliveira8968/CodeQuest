/// Esta classe representa o utilizador
class Utilizador{
  /// O id pode ser nulo porque antes de este ser guardado na base de dados, ele é nulo.
  final int? id;
  final String nome;
  final String email;
  final String passwordHash;
  
  /// Este construtor é utilizado para criar um utilizador. 
  /// Recebe os dados da classe e atribui-os às propriedades
  /// Todos os campos (menos o id) são obrigatórios.
  Utilizador({
    this.id,
    required this.nome,
    required this.email,
    required this.passwordHash,
  });

  /// São atribuídas chaves-valor com os valores das variáveis para a base de dados
  Map<String, dynamic> paraMap(){
    return{
      "id": id,
      "nome": nome,
      "email": email,
      "password_hash": passwordHash,
    };
  }

  // O factory permite que a lógica do construtor se mantenha.
  /// deMap faz o contrário do paraMap. Atribui os valores da base de dados para a aplicação. 
  /// Utilizado para importar dados da base de dados para a app.
  factory Utilizador.deMap(Map<String, dynamic> map){
    return Utilizador(
      id: map["id"],
      nome: map["nome"],
      email: map["email"],
      passwordHash: map["password_hash"],
    );
  }

}
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import '../modelos/utilizador.dart';
import '../modelos/pergunta.dart';
import '../modelos/resultado.dart';
import '../dados/questoes.dart';

///Classe que gere as operações na base de dados
class DatabaseHelper {
  ///Cria uma instância única quando a app arranca.
  static final DatabaseHelper _instancia = DatabaseHelper._interno();
  /// Faz a ligação à base de dados
  static Database? _baseDados;
  /// Devolve a instância em vez de uma DatabaseHelper novo
  factory DatabaseHelper() => _instancia;
  DatabaseHelper._interno();

  /// Devolve, no futuro, uma base de dados. Cria uma se ainda não existir.
  Future<Database> get baseDados async {
    if (_baseDados != null) return _baseDados!;
    _baseDados = await _iniciarBaseDados();
    return _baseDados!;
  }

  /// Inicializa, no futuro, a base de dados
  Future<Database> _iniciarBaseDados() async {
    /// variavel caminho guarda o caminho até ao ficheiro da base de dados
    final caminho = await getDatabasesPath();
    /// variavel localizacao une o caminho com o ficheiro final
    final localizacao = join(caminho, "codequest.db");
    
    /// retorna, e espera pelo retorno, uma base de dados, aberta pelo método openDatabase.
    return await openDatabase(
      localizacao,
      version: 1,
      /// Na primeira vez, chama o método criarTabelas para criar as tabelas
      onCreate: _criarTabelas,
    );
  }

  /// Cria, no futuro, tabelas
  Future<void> _criarTabelas(Database db, int versao) async {
    /// Uma tabela para guardas os utilizadores
    await db.execute('''
      CREATE TABLE utilizadores (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT NOT NULL,
      email TEXT NOT NULL UNIQUE,
      password_hash TEXT NOT NULL
      )
    ''');
    
    /// Uma tabela para guardas os resultados
    await db.execute('''
      CREATE TABLE resultados (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      utilizador_id INTEGER NOT NULL,
      pontuacao INTEGER NOT NULL,
      nivel INTEGER NOT NULL,
      categoria TEXT NOT NULL,
      data TEXT NOT NULL,
      FOREIGN KEY (utilizador_id) REFERENCES utilizadores(id)
      )
    ''');

    /// Uma tabela para guardas as perguntas
    await db.execute('''
      CREATE TABLE perguntas (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      categoria TEXT NOT NULL,
      nivel INTEGER NOT NULL,
      pergunta TEXT NOT NULL,
      opcao_a TEXT NOT NULL,
      opcao_b TEXT NOT NULL,
      opcao_c TEXT NOT NULL,
      opcao_d TEXT NOT NULL,
      resposta_correta TEXT NOT NULL,
      explicacao TEXT NOT NULL
      )
    ''');

    /// Insere as perguntas na base de dados após as tabelas serem criadas
    await _inserirPerguntas(db);
  }

  /// Insere, no futuro, as perguntas na base de dados
  Future<void> _inserirPerguntas (Database db) async {
    /// Para cada pergunta, existente na lista de perguntas no questoes.dart
    for (final pergunta in perguntasDados) {
      /// insere na tabela perguntas através do paraMap declarado no ficheiro pergunta.dart
      await db.insert("perguntas", pergunta.paraMap());
    }
  }

  /// Cria um hash para que a password nunca seja guardada em texto simples na base de dados
  String _hashPassword(String password) {
    /// Converte o texto da variável password para bytes
    final bytes  = utf8.encode(password);
    /// Converte os bytes para texto através do sha256
    return sha256.convert(bytes).toString();
  }

  /// Regista, no futuro, um novo utilizador, com conexao à base de dados
  Future<int> registarUtilizador(String nome, String email, String password) async {
    final db = await baseDados;
    ///tenta inserir na tabela utilizadores
    try {
      return await db.insert("utilizadores", {
        /// o nome
        "nome": nome,
        /// o email em minusculas (.toLowerCase()) e sem espaços (.trim())
        "email": email.toLowerCase().trim(),
        /// e a password encriptada
        "password_hash": _hashPassword(password),
      });
      /// Como a variável email é definida como unique, não podem existir emails iguais. 
      /// Logo, no caso de erro, devolve a variável "e" (-1) em vez de crashar
    } catch (e) {
      return -1;
    }
  }
  /// Devolve, no futuro, um utilizador ou null caso não encontre um utilizador, pois o ? permite devolver nulo.
  Future<Utilizador?> autenticarUtilizador(String email, String password) async {
    final db = await baseDados;
    /// atribui o resultado da pesquisa na base de dados à variável resultado
    final resultado = await db.query(
      /// Procura na tabela utilizadores uma correspondência onde
      "utilizadores",
      /// o email e a password cumpram os requisitos no whereArgs
      /// É utilizado ? e whereArgs em vez dos próprios atributos por uma questão de segurança.
      /// Sem estes, seria possível que, através dos campos de texto da app e SQL Injection, o query fosse manipulado
      where: "email = ? AND password_hash = ?",
      whereArgs: [email.toLowerCase().trim(), _hashPassword(password)],
    );
    /// Se a variável resultado ficar vazia, o que significa que não encontrou um utilizador, devolve null
    if (resultado.isEmpty) return null;
    /// Caso contrário, pega no primeiro resultado e transforma-o num objeto através do deMap().
    return Utilizador.deMap(resultado.first);
  }
  /// Devolve, no futuro, uma lista com as perguntas filtradas por categoria em ordem aleatória
  Future<List<Pergunta>> obterPerguntas(String categoria, int nivel) async {
    final db = await baseDados;
    /// atribui o resultado da pesquisa na base de dados à variável resultado
    final resultado = await db.query(
      /// Procura na tabela perguntas uma correspondência onde
      "perguntas",
      /// a categoria e o nivel cumpram os requisitos no whereArgs
      /// É utilizado ? e whereArgs em vez dos próprios atributos por uma questão de segurança.
      /// Sem estes, seria possível que, através dos campos de texto da app e SQL Injection, o query fosse manipulado
      where: "categoria = ? AND nivel = ?",
      whereArgs: [categoria, nivel],
      /// ordena-os de forma aleatória
      orderBy: "RANDOM()",
    );
    /// converte cada map do resultado para um objeto pergunta, através do deMap()
    /// o .toList coloca tudo numa lista no fim
    return resultado.map((map) => Pergunta.deMap(map)).toList();
  }

  /// Guarda os resultado de uma sessão de jogo na base de dados
  Future<void> guardarResultado(Resultado resultado) async {
    final db = await baseDados;
    /// Insere os resultados na tabela resultados da base de dados e transforma-os em objetos através do paraMap() 
    await db.insert("resultados", resultado.paraMap());
  }

  /// Retorna, no futuro, uma lista, em map, do ranking de melhores utilizadores
  Future<List<Map<String, dynamic>>> obterRanking({String? categoria, int? nivel}) async {
    final db = await baseDados;

      /// Converte a variável para int para que a base de dados consiga trabalhar com o valor do nível
      final nivelInt = int.parse(nivel.toString());

      return await db.rawQuery('''
      -- é selecionado o nome do utilizador (u.nome), 
      -- a maior pontuacao da tabela resultados e guarda como um novo campo chamado melhor_pontuacao
      SELECT u.nome, MAX(r.pontuacao) as melhor_pontuacao
      -- procura estes valores na tabela resultados
      FROM resultados r
      -- junta o utilizador ao seu id, criando o u.id
      INNER JOIN utilizadores u ON r.utilizador_id = u.id
      -- onde a variável categoria e nivelInt é igual ao elemento da tabela
      WHERE r.categoria = "$categoria" AND r.nivel = "$nivelInt"
      -- agrupa os resultados do select por id de utilizador
      GROUP BY r.utilizador_id
      -- e ordena-os por melhor pontuacao decrescente
      ORDER BY melhor_pontuacao DESC
      -- mantendo um limite de 5 resultados na lista
      LIMIT 5
      ''');
    }
}

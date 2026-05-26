import '../modelos/pergunta.dart';

/// Cria uma lista de perguntas. Todas seguem um modelo intuitivo por isso é fácil acrescentar mais perguntas
final List<Pergunta> perguntasDados= [

    // --- Dart - Nível 1 ---

  Pergunta(
    categoria: "Dart",
    nivel: 1,
    pergunta: "Que tipo de dados é usado para números inteiros em Dart?",
    opcaoA: "int",
    opcaoB: "bool",
    opcaoC: "num",
    opcaoD: "double",
    respostaCorreta: "A",
    explicacao: "Em Dart, 'int' representa números inteiros.",
  ),

  Pergunta(
    categoria: "Dart",
    nivel: 1,
    pergunta: "O que faz o operador '??' em Dart?",
    opcaoA: "Verifica se é nulo e lança erro",
    opcaoB: "Devolve o valor da direita se o da esquerda for nulo",
    opcaoC: "Compara dois valores",
    opcaoD: "Converte para booleano",
    respostaCorreta: "B",
    explicacao: "'??' é o operador null-coalescing: devolve o valor da direita se o da esquerda for null.",
  ),

  Pergunta(
    categoria: "Dart",
    nivel: 1,
    pergunta: "Que palavra-chave se usa para declarar uma variável que nunca muda?",
    opcaoA: "var",
    opcaoB: "let",
    opcaoC: "final",
    opcaoD: "static",
    respostaCorreta: "C",
    explicacao: "'final' declara uma variável que só pode ser atribuída uma vez.",
  ),

  Pergunta(
    categoria: "Dart",
    nivel: 1,
    pergunta: "Como se declara uma lista em Dart?",
    opcaoA: "Array<int> lista = [];",
    opcaoB: "List<int> lista = [];",
    opcaoC: "list<int> lista = [];",
    opcaoD: "int[] lista = [];",
    respostaCorreta: "B",
    explicacao: "Em Dart, listas são declaradas com o tipo 'List<T>'.",
  ),

  Pergunta(
    categoria: "Dart",
    nivel: 1,
    pergunta: "Qual é o tipo de dados para texto em Dart?",
    opcaoA: "Text",
    opcaoB: "char",
    opcaoC: "String",
    opcaoD: "str",
    respostaCorreta: "C",
    explicacao: "Em Dart, o tipo 'String' representa texto.",
  ),

// --- Dart - Nível 2 ---

  Pergunta(
    categoria: "Dart",
    nivel: 2,
    pergunta: "O que é um 'Future' em Dart?",
    opcaoA: "Uma lista de valores futuros",
    opcaoB: "Um valor que estará disponível no futuro, após uma operação assíncrona",
    opcaoC: "Uma função que corre em loop",
    opcaoD: "Um tipo de variável imutável",
    respostaCorreta: "B",
    explicacao: "'Future' representa o resultado de uma operação assíncrona que será concluída no futuro.",
  ),

  Pergunta(
    categoria: "Dart",
    nivel: 2,
    pergunta: "O que faz a palavra-chave 'async' numa função Dart?",
    opcaoA: "Torna a função mais rápida",
    opcaoB: "Permite usar 'await' dentro da função",
    opcaoC: "Cria uma nova thread",
    opcaoD: "Cancela operações em curso",
    respostaCorreta: "B",
    explicacao: "'async' marca uma função como assíncrona, permitindo o uso de 'await' para esperar por Futures.",
  ),

  Pergunta(
    categoria: "Dart",
    nivel: 2,
    pergunta: "Qual é a diferença entre '==' e '===' em Dart?",
    opcaoA: "'===' compara tipo e valor",
    opcaoB: "Não existe '===' em Dart, usa-se apenas '=='",
    opcaoC: "'==' compara referências",
    opcaoD: "'===' é mais preciso que '=='",
    respostaCorreta: "B",
    explicacao: "Ao contrário do JavaScript, Dart não tem '==='. O operador '==' compara valor e tipo.",
  ),

  // --- Dart - Nível 3 ---

  Pergunta(
    categoria: "Dart",
    nivel: 3,
    pergunta: "Identifica o erro neste código:\nvoid main() {\n  String? nome;\n  print(nome.length);\n}",
    opcaoA: "Nenhum erro",
    opcaoB: "Erro: 'nome' pode ser null, é necessário usar 'nome?.length' ou verificar antes",
    opcaoC: "Erro: 'String?' não existe em Dart",
    opcaoD: "Erro: falta ponto e vírgula",
    respostaCorreta: "B",
    explicacao: "'nome' é nullable (String?). Aceder a '.length' diretamente pode causar um erro de null. Usa 'nome?.length' ou verifica se é null antes.",
  ),

  Pergunta(
    categoria: "Dart",
    nivel: 3,
    pergunta: "O que é um 'mixin' em Dart?",
    opcaoA: "Um tipo de lista especial",
    opcaoB: "Uma forma de reutilizar código em múltiplas classes sem herança",
    opcaoC: "Um construtor privado",
    opcaoD: "Uma função anónima",
    respostaCorreta: "B",
    explicacao: "'mixin' permite partilhar métodos entre classes sem usar herança direta, promovendo reutilização de código.",
  ),

  Pergunta(
    categoria: "Dart",
    nivel: 3,
    pergunta: "Qual a melhor prática para evitar erros com valores null em Dart?",
    opcaoA: "Nunca usar variáveis",
    opcaoB: "Usar sempre 'dynamic'",
    opcaoC: "Usar null safety com '?' e '!' de forma adequada e verificar valores antes de os usar",
    opcaoD: "Converter tudo para String",
    respostaCorreta: "C",
    explicacao: "O null safety do Dart obriga a declarar explicitamente variáveis nullable com '?', reduzindo erros em tempo de execução.",
  ),

  // --- Flutter - Nível 1 ---

  Pergunta(
    categoria: "Flutter",
    nivel: 1,
    pergunta: "Que widget é utilizado para criar uma barra de topo no ecrã?",
    opcaoA: "TopBar",
    opcaoB: "Header",
    opcaoC: "AppBar",
    opcaoD: "NavBar",
    respostaCorreta: "C",
    explicacao: "O AppBar é o widget padrão do Flutter para a barra superior.",
  ),
  Pergunta(
    categoria: "Flutter",
    nivel: 1,
    pergunta: "O que é um StatelessWidget?",
    opcaoA: "Um widget que guarda dados na base de dados",
    opcaoB: "Um widget cujo estado nunca muda após ser criado",
    opcaoC: "Um widget apenas para texto",
    opcaoD: "Um widget que comunica com APIs",
    respostaCorreta: "B",
    explicacao: "Um StatelessWidget é imutável — o seu conteúdo não muda após ser construído.",
  ),

  Pergunta(
    categoria: "Flutter",
    nivel: 1,
    pergunta: "Que widget organiza os seus filhos em coluna vertical?",
    opcaoA: "Row",
    opcaoB: "Stack",
    opcaoC: "Column",
    opcaoD: "Grid",
    respostaCorreta: "C",
    explicacao: "O widget 'Column' organiza os seus filhos verticalmente.",
  ),

  Pergunta(
    categoria: "Flutter",
    nivel: 1,
    pergunta: "Como se adiciona espaçamento à volta de um widget em Flutter?",
    opcaoA: "Margin()",
    opcaoB: "Padding()",
    opcaoC: "Spacing()",
    opcaoD: "Border()",
    respostaCorreta: "B",
    explicacao: "O widget 'Padding' adiciona espaço interior à volta do seu filho.",
  ),

  Pergunta(
    categoria: "Flutter",
    nivel: 1,
    pergunta: "Que widget Flutter é usado para mostrar uma imagem?",
    opcaoA: "Picture()",
    opcaoB: "Photo()",
    opcaoC: "Image()",
    opcaoD: "ImageView()",
    respostaCorreta: "C",
    explicacao: "O widget 'Image' é o padrão do Flutter para exibir imagens.",
  ),

  // --- Flutter - Nível 2 ---

  Pergunta(
    categoria: "Flutter",
    nivel: 2,
    pergunta: "Qué método reconstrói o ecrã num StatefulWidget?",
    opcaoA: "rebuild()",
    opcaoB: "refresh()",
    opcaoC: "setState()",
    opcaoD: "update()",
    respostaCorreta: "C",
    explicacao: "'setState()' notifica o Flutter que o estado mudou e que o widget deve ser reconstruído.",
  ),

  Pergunta(
    categoria: "Flutter",
    nivel: 2,
    pergunta: "O que é o 'BuildContext' em Flutter?",
    opcaoA: "O nome do ficheiro atual",
    opcaoB: "A localização do widget na árvore de widgets",
    opcaoC: "O tema da aplicação",
    opcaoD: "A base de dados da app",
    respostaCorreta: "B",
    explicacao: "'BuildContext' representa a posição de um widget na árvore, permitindo aceder a dados do contexto como temas e navegação.",
  ),

  Pergunta(
    categoria: "Flutter",
    nivel: 2,
    pergunta: "Que widget se usa para navegar entre ecrãs em Flutter?",
    opcaoA: "Router()",
    opcaoB: "Navigator()",
    opcaoC: "PageManager()",
    opcaoD: "ScreenChanger()",
    respostaCorreta: "B",
    explicacao: "'Navigator' gere a pilha de ecrãs, permitindo navegar com push() e pop().",
  ),

  // --- Flutter - Nível 3 ---

  Pergunta(
    categoria: "Flutter",
    nivel: 3,
    pergunta: "Identifica o problema neste código:\nElevatedButton(\n  child: Text('OK'),\n)",
    opcaoA: "Nenhum problema",
    opcaoB: "Falta o parâmetro 'onPressed', obrigatório no ElevatedButton",
    opcaoC: "Deve usar 'TextButton' em vez de 'ElevatedButton'",
    opcaoD: "O texto deve estar entre aspas simples",
    respostaCorreta: "B",
    explicacao: "'onPressed' é obrigatório no ElevatedButton. Sem ele, o botão fica inativo. Pode ser 'null' para desativar intencionalmente.",
  ),

  Pergunta(
    categoria: "Flutter",
    nivel: 3,
    pergunta: "Qual é a melhor abordagem para partilhar estados entre vários ecrãs em Flutter?",
    opcaoA: "Usar variáveis globais",
    opcaoB: "Passar dados por parâmetros em todos os widgets",
    opcaoC: "Usar gestão de estado como Provider, Riverpod ou BLoC",
    opcaoD: "Reiniciar a app a cada mudança",
    respostaCorreta: "C",
    explicacao: "Soluções de gestão de estados como Provider evitam passar dados manualmente por toda a árvore de widgets.",
  ),

  Pergunta(
    categoria: "Flutter",
    nivel: 3,
    pergunta: "O que significa o erro 'RenderFlex overflowed by X pixels'?",
    opcaoA: "A app ficou sem memória",
    opcaoB: "Um widget filho é maior que o espaço disponível no Row ou Column",
    opcaoC: "A imagem é demasiado grande",
    opcaoD: "Falta importar um pacote",
    respostaCorreta: "B",
    explicacao: "Este erro ocorre quando o conteúdo de um Row/Column ultrapassa o espaço disponível. Solução: usar 'Expanded', 'Flexible' ou 'SingleChildScrollView'.",
  ),

  // --- SQL - Nível 1 ---

  Pergunta(
    categoria: "SQL",
    nivel: 1,
    pergunta: "Que comando SQL é usado para obter dados de uma tabela?",
    opcaoA: "GET",
    opcaoB: "FETCH",
    opcaoC: "SELECT",
    opcaoD: "READ",
    respostaCorreta: "C",
    explicacao: "O comando SELECT é utilizado para consultar dados em SQL.",
  ),
  Pergunta(
    categoria: "SQL",
    nivel: 1,
    pergunta: "O que significa PRIMARY KEY numa tabela SQL?",
    opcaoA: "A primeira coluna da tabela",
    opcaoB: "Um identificador único para cada linha",
    opcaoC: "A coluna mais importante",
    opcaoD: "Uma chave de encriptação",
    respostaCorreta: "B",
    explicacao: "PRIMARY KEY garante que cada registo tem um identificador único e não nulo.",
  ),

  Pergunta(
    categoria: "SQL",
    nivel: 1,
    pergunta: "Que comando SQL apaga todos os registos de uma tabela?",
    opcaoA: "REMOVE",
    opcaoB: "CLEAR",
    opcaoC: "DELETE FROM",
    opcaoD: "DROP",
    respostaCorreta: "C",
    explicacao: "'DELETE FROM tabela' apaga os registos. 'DROP TABLE' apagaria a tabela inteira.",
  ),

  Pergunta(
    categoria: "SQL",
    nivel: 1,
    pergunta: "Que cláusula SQL filtra os resultados de uma consulta?",
    opcaoA: "FILTER",
    opcaoB: "WHERE",
    opcaoC: "HAVING",
    opcaoD: "LIMIT",
    respostaCorreta: "B",
    explicacao: "'WHERE' filtra os registos que cumprem uma condição antes de serem devolvidos.",
  ),

  Pergunta(
    categoria: "SQL",
    nivel: 1,
    pergunta: "O que faz o comando INSERT em SQL?",
    opcaoA: "Atualiza um registo existente",
    opcaoB: "Apaga uma tabela",
    opcaoC: "Adiciona um novo registo numa tabela",
    opcaoD: "Cria uma nova base de dados",
    respostaCorreta: "C",
    explicacao: "'INSERT INTO' adiciona novos registos a uma tabela.",
  ),

  // --- SQL - Nível 2 ---

  Pergunta(
    categoria: "SQL",
    nivel: 2,
    pergunta: "O que é uma FOREIGN KEY em SQL?",
    opcaoA: "Uma chave de encriptação",
    opcaoB: "Uma coluna que referencia a chave primária de outra tabela",
    opcaoC: "Uma chave duplicada",
    opcaoD: "O índice da tabela",
    respostaCorreta: "B",
    explicacao: "'FOREIGN KEY' cria uma relação entre duas tabelas, referenciando a PRIMARY KEY de outra tabela.",
  ),

  Pergunta(
    categoria: "SQL",
    nivel: 2,
    pergunta: "O que faz o comando JOIN em SQL?",
    opcaoA: "Une duas bases de dados",
    opcaoB: "Combina registos de duas tabelas com base numa relação",
    opcaoC: "Duplica os registos",
    opcaoD: "Ordena os resultados",
    respostaCorreta: "B",
    explicacao: "'JOIN' combina linhas de duas tabelas com base numa condição, geralmente uma chave estrangeira.",
  ),
  Pergunta(
    categoria: "SQL",
    nivel: 2,
    pergunta: "Qual é a diferença entre DELETE e DROP em SQL?",
    opcaoA: "Não há diferença",
    opcaoB: "DELETE apaga registos; DROP apaga a tabela inteira",
    opcaoC: "DROP apaga registos; DELETE apaga a tabela",
    opcaoD: "Ambos apagam a base de dados",
    respostaCorreta: "B",
    explicacao: "'DELETE' remove registos de uma tabela mantendo a sua estrutura. 'DROP TABLE' elimina a tabela por completo.",
  ),

  // --- SQL - Nível 3 ---

  Pergunta(
      categoria: "SQL",
      nivel: 3,
      pergunta: "Identifica o erro nesta query:\nSELECT nome FROM utilizadores WHERE id = '1'",
      opcaoA: "Nada, está correta",
      opcaoB: "O SELECT está mal escrito",
      opcaoC: "O id é um INTEGER, não deve ser comparado com texto '1', mas com o número 1",
      opcaoD: "Falta o ponto e vírgula",
      respostaCorreta: "C",
      explicacao: "Comparar um INTEGER com uma String ('1') pode causar comportamentos inesperados. O correto é 'WHERE id = 1'.",
  ),

  Pergunta(
    categoria: "SQL",
    nivel: 3,
    pergunta: "O que é SQL Injection e como se previne?",
    opcaoA: "Um vírus que apaga bases de dados; previne-se com antivírus",
    opcaoB: "Uma técnica de ataque que manipula queries SQL; previne-se com parâmetros preparados ('?')",
    opcaoC: "Um erro de sintaxe SQL; previne-se com maiúsculas",
    opcaoD: "Um tipo de backup; previne-se com passwords",
    respostaCorreta: "B",
    explicacao: "SQL Injection insere código malicioso em queries. A prevenção é usar parâmetros preparados (whereArgs no sqflite) em vez de interpolação direta.",
  ),

  Pergunta(
    categoria: "SQL",
    nivel: 3,
    pergunta: "Qual a vantagem de usar índices numa tabela SQL?",
    opcaoA: "Reduzem o tamanho da base de dados",
    opcaoB: "Tornam as pesquisas mais rápidas em tabelas grandes",
    opcaoC: "Impedem registos duplicados",
    opcaoD: "Encriptam os dados automaticamente",
    respostaCorreta: "B",
    explicacao: "Índices aceleram as operações de leitura (SELECT/WHERE) em tabelas com muitos registos, à custa de algum espaço extra.",
  ),

];

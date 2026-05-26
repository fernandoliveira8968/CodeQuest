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

  // --- HTML - Nível 1 ---

  Pergunta(
    categoria: "HTML",
    nivel: 1,
    pergunta: "Qual é a tag HTML usada para criar uma hiperligação?",
    opcaoA: "<link>",
    opcaoB: "<a>",
    opcaoC: "<href>",
    opcaoD: "<url>",
    respostaCorreta: "B",
    explicacao: "A tag <a> (anchor) é usada para criar hiperligações em HTML.",
  ),

  Pergunta(
    categoria: "HTML",
    nivel: 1,
    pergunta: "Qual é a tag HTML correta para o título mais importante de uma página?",
    opcaoA: "<title>",
    opcaoB: "<head>",
    opcaoC: "<h1>",
    opcaoD: "<header>",
    respostaCorreta: "C",
    explicacao: "<h1> define o título principal da página. Deve existir apenas um por página.",
  ),
  Pergunta(
    categoria: "HTML",
    nivel: 1,
    pergunta: "Qual é a tag HTML usada para inserir uma imagem?",
    opcaoA: "<image>",
    opcaoB: "<img>",
    opcaoC: "<pic>",
    opcaoD: "<src>",
    respostaCorreta: "B",
    explicacao: "A tag <img> é usada para inserir imagens. O atributo 'src' define o caminho da imagem.",
  ),
  Pergunta(
    categoria: "HTML",
    nivel: 1,
    pergunta: "O que significa HTML?",
    opcaoA: "Hyper Transfer Markup Language",
    opcaoB: "High Text Modern Links",
    opcaoC: "HyperText Markup Language",
    opcaoD: "Home Tool Markup Language",
    respostaCorreta: "C",
    explicacao: "HTML significa HyperText Markup Language — a linguagem padrão para criar páginas web.",
  ),
  Pergunta(
    categoria: "HTML",
    nivel: 1,
    pergunta: "Que atributo define o destino de uma hiperligação?",
    opcaoA: "link",
    opcaoB: "src",
    opcaoC: "href",
    opcaoD: "url",
    respostaCorreta: "C",
    explicacao: "O atributo 'href' define o URL de destino de uma tag <a>.",
  ),

  // --- HTML - Nível 2 ---

  Pergunta(
    categoria: "HTML",
    nivel: 2,
    pergunta: "O que faz o atributo 'alt' numa tag <img>?",
    opcaoA: "Define o tamanho da imagem",
    opcaoB: "Fornece texto alternativo quando a imagem não carrega e melhora a acessibilidade",
    opcaoC: "Define a cor de fundo da imagem",
    opcaoD: "Cria um link na imagem",
    respostaCorreta: "B",
    explicacao: "O atributo 'alt' fornece texto descritivo alternativo, essencial para acessibilidade e quando a imagem falha ao carregar.",
  ),

  Pergunta(
    categoria: "HTML",
    nivel: 2,
    pergunta: "Qual é a diferença entre as tags <div> e <span>?",
    opcaoA: "Não há diferença",
    opcaoB: "<div> é um elemento de bloco; <span> é um elemento inline",
    opcaoC: "<span> é um elemento de bloco; <div> é inline",
    opcaoD: "<div> é para texto; <span> é para imagens",
    respostaCorreta: "B",
    explicacao: "<div> é um contentor de bloco (ocupa toda a largura). <span> é inline (ocupa apenas o espaço do conteúdo).",
  ),

  Pergunta(
    categoria: "HTML",
    nivel: 2,
    pergunta: "O que é o atributo 'action' num formulário HTML?",
    opcaoA: "Define o estilo do formulário",
    opcaoB: "Define para onde os dados são enviados ao submeter",
    opcaoC: "Define o método de encriptação",
    opcaoD: "Define o tamanho do formulário",
    respostaCorreta: "B",
    explicacao: "O atributo 'action' especifica o URL para onde os dados do formulário são enviados quando submetido.",
  ),

  // --- HTML - Nível 3 ---

  Pergunta(
    categoria: "HTML",
    nivel: 3,
    pergunta: "Qual o problema neste código?\n<img src='foto.jpg'>",
    opcaoA: "Nenhum problema",
    opcaoB: "Falta o atributo 'alt', necessário para acessibilidade",
    opcaoC: "A tag <img> precisa de tag de fecho </img>",
    opcaoD: "O atributo 'src' está mal escrito",
    respostaCorreta: "B",
    explicacao: "Toda a tag <img> deve ter o atributo 'alt' para descrever a imagem, garantindo acessibilidade a utilizadores com leitores de ecrã.",
  ),
  Pergunta(
    categoria: "HTML",
    nivel: 3,
    pergunta: "Qual a melhor prática para tornar um site HTML acessível?",
    opcaoA: "Usar apenas imagens sem texto",
    opcaoB: "Usar tags semânticas como <header>, <main>, <nav> e <footer>",
    opcaoC: "Usar apenas <div> e <span> para toda a estrutura",
    opcaoD: "Evitar formulários",
    respostaCorreta: "B",
    explicacao: "Tags semânticas descrevem o propósito do conteúdo, melhoram a acessibilidade e ajudam motores de busca a interpretar a página.",
  ),
  Pergunta(
    categoria: "HTML",
    nivel: 3,
    pergunta: "Qual é o erro neste formulário?\n<form>\n  <input type='email'>\n  <button>Enviar</button>\n</form>",
    opcaoA: "Nenhum erro",
    opcaoB: "Falta o atributo 'action' e os campos não têm 'name' nem 'label'",
    opcaoC: "O botão deve ser <input type='submit'>",
    opcaoD: "O type='email' não existe em HTML",
    respostaCorreta: "B",
    explicacao: "Sem 'name', os dados do campo não são enviados. Sem <label>, o campo não tem descrição acessível. Sem 'action', os dados não têm destino definido.",
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

CodeQuest

Aplicação Android educativa desenvolvida em Flutter, em formato de jogo de perguntas e respostas sobre desenvolvimento web e mobile. O utilizador responde a desafios sobre Dart, Flutter e SQL, acumula pontuação e compete no ranking dos melhores jogadores.

--- Funcionalidades ---

- Registo e autenticação local — criação de conta e início de sessão com dados guardados em SQLite
- Sistema de perguntas — perguntas de escolha múltipla organizadas por categoria e nível de dificuldade
- Feedback imediato — indicação de resposta certa ou errada com explicação após cada resposta
- Sistema de pontuação — pontuação com bónus e penalizações consoante o nível
- Ranking — os 5 melhores resultados por categoria e nível
- Ecrã de resultado — resumo da sessão com pontos obtidos e percentagem de acertos

--- Categorias e Níveis ---

A aplicação dispõe de testes de 3 tipos de categorias e 3 níveis de dificuldade. Sendo estes:

Temas dos testes:
- Dart
- Flutter
- SQL

Níveis de dificuldade:
- Nível 1 - Conhecimentos básicos
- Nível 2 - Conhecimentos aprofundados
- Nível 3 - Conhecimentos avançados


--- Sistema de Pontuação ---

Os níveis dispõem de diferentes pontuações, isto é, quanto mais difícil o teste, maior a pontuação obtida por cada pergunta correta.
Em contrapartida, quanto maior o nível, e em caso de tentativa falhada, a perda de pontos também é maior.

A pontuação divide-se da seguinte forma:

Nível 1 - +10 por acerto;
          -5 pontos por insucesso;
Nível 2 - +20 por acerto;
          -10 pontos por insucesso;
Nível 1 - +30 por acerto;
          -15 pontos por insucesso;

A pontuação nunca desce abaixo de 0.


--- Tecnologias Utilizadas ---

- Flutter - (https://flutter.dev/) — framework de desenvolvimento mobile
- Dart - (https://dart.dev/) — linguagem de programação
- sqflite - (https://pub.dev/packages/sqflite) — base de dados SQLite local
- path - (https://pub.dev/packages/path) — gestão de caminhos de ficheiros
- crypto - (https://pub.dev/packages/crypto) — encriptação SHA-256 das passwords


--- Pré-requisitos ---

- Flutter SDK - (https://docs.flutter.dev/get-started/install) (versão 3.0 ou superior)
- Android Studio - (https://developer.android.com/studio) 
       ou 
- VS Code - (https://code.visualstudio.com/) com extensão Flutter
- Emulador Android/iOS ou dispositivo físico ligado


----- Instalação e Execução -----

Através do terminal, deves executar os seguintes comandos:

--- 1. Clonar o repositório ---

git clone https://github.com/<utilizador>/<repositorio>.git
cd <repositorio>

--- 2. Instalar dependências ---

flutter pub get

--- 3. Executar a aplicação ---

flutter run

* Para executar num dispositivo específico, usa flutter devices para listar os disponíveis e flutter run -d <id> para escolher.


--- Estrutura do Projeto ---


lib/
├── main.dart                    # Ponto de entrada da aplicação
├── dados/
│   └── questoes.dart            # Lista de perguntas da aplicação
├── database/
│   └── database_helper.dart     # Gestão da base de dados SQLite
├── ecras/
│   ├── ecra_inicial.dart        # Ecrã de boas-vindas
│   ├── ecra_registo.dart        # Ecrã de registo
│   ├── ecra_login.dart          # Ecrã de autenticação
│   ├── ecra_menu.dart           # Menu principal
│   ├── ecra_categorias.dart     # Seleção de categoria e nível
│   ├── ecra_jogo.dart           # Ecrã de jogo
│   ├── ecra_jogo_niveis.dart    # Ecrã de seleção de nível de jogo
│   ├── ecra_resultado.dart      # Ecrã de resultado
│   └── ecra_ranking.dart        # Ecrã de ranking
│   └── ecra_ranking_menu.dart   # Ecrã de seleção de ranking por categoria
│   └── ecra_ranking_niveis.dart # Ecrã de seleção de ranking por níveis
└── modelos/
    ├── utilizador.dart        # Modelo de utilizador
    ├── pergunta.dart          # Modelo de pergunta
    └── resultado.dart         # Modelo de resultado



--- Como Utilizar ---

1. Abrir a aplicação — é apresentado o ecrã inicial com as opções de registo e início de sessão
2. Criar conta — preencher nome, email e password no ecrã de registo
3. Iniciar sessão — entrar com o email e password registados
4. Escolher categoria e nível — selecionar o nível de dificuldade (1, 2 ou 3) e a categoria (Dart, Flutter ou SQL)
5. Responder às perguntas — selecionar uma opção e confirmar; após cada resposta é apresentado feedback com explicação
6. Ver resultado — no final da sessão é apresentada a pontuação obtida e o número total de respostas acertadas
7. Consultar ranking — verificar os 5 melhores resultados por categoria e nível


--- Base de Dados ---

A aplicação utiliza SQLite para persistência local. As tabelas criadas são:

- utilizadores - Dados de autenticação (nome, email, password encriptada)
- resultados - Resultados das sessões de jogo por utilizador
- perguntas - Lista de perguntas organizadas por categoria e nível

* As passwords são armazenadas com encriptação SHA-256, nunca em texto simples.


--- Autores ---

Fernando Miguel Gomes Oliveira
Desenvolvido no âmbito da unidade curricular **Programação de Dispositivos Móveis II**  
CTESP - Desenvolvimento para Web & Dispositivos Móveis
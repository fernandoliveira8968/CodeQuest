import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../modelos/utilizador.dart';
import '../ecras/ecra_menu.dart';

/// Esta classe é imutável (mantém-se o mesmo) pelo uso do StatefulWidget
class EcraLogin extends StatefulWidget {
  const EcraLogin({super.key});

  @override
  State<EcraLogin> createState() => _EcraLoginState();
}

/// Este state lida com a lógica, logo as variáveis pode mudar.
/// Esta classe é privada (_) de forma a que apenas a classe EcraLogin possa interagir com ela
class _EcraLoginState extends State<EcraLogin>{
  /// É criada uma variável para identificar o formulário de inicio de sessão, utilizada para validação
  final _formKey = GlobalKey<FormState>();
  /// Variável de controlador de texto para os campos de introdução pelo utilizador
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  /// Variável em tipo boolean que permite ativar ou desativar a visualização da inserção da password pelo utilizador 
  bool _passwordVisivel = false;

  /// Criação de variável interna da classe para que o DatabaseHelper seja executado
  final _db = DatabaseHelper();

/// Devolve, no futuro, a ação de iniciar sessão
  Future<void> _iniciarSessao() async {
    /// Verifica se o o estado atual do formulário de inicio de sessão é válido. Se não o for, termina a ação. 
    if (!_formKey.currentState!.validate()) return;

    /// Guarda o texto introduzido pelo utilizador na variável correspondente
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    /// Guarda, na variável utilizador, caso encontre um utilizador com as mesmas correspondências 
    /// de email e password, um objeto que representa o perfil do utilizador que iniciou sessão
    final Utilizador? utilizador = await _db.autenticarUtilizador(email, password);

    /// Se o widget ainda se mantiver ativo, volta ao ecrã anterior, 
    /// evitando um erro por o utilizador terminar o método de forma voluntária
    if (!mounted) return;

    /// Se o utilizador for nulo, ou seja, não existiram correspondências
    if (utilizador == null) {
      /// É apresentada uma mensagem em formato snackBar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          /// Com o texto
          content: Text("Email ou palavra-passe incorretos."),
        ),
      );
    /// E termina
    return;
    }
    /// Caso contrário, troca a página a ser utilizada
    Navigator.pushReplacement(
      context,
      /// MaterialPageRoute é uma animação de transição entre páginas
      MaterialPageRoute(
        /// É criada a página que vai ser apresentada quando o botão for pressionado
        /// Neste caso, a página com o respetivo utilizador
        builder: (context) => EcraMenu(utilizador: utilizador)
        ),
    );
  }

   @override
  Widget build(BuildContext context){
    /// retorna um Scaffold que nele contem
    return Scaffold(
      /// uma barra superior da aplicação
      appBar: AppBar(
        title: const Text("Login"),
      ),
      /// um body que se apresenta numa "área segura", ou seja, 
      /// não se sobrepõe ao local da camera ou barra superior do sistema
      body: SafeArea(
        /// um child centrado
        child: Center(
          /// um child que permite o scroll, a ser utilizado 
          /// quando o teclado está aberto e permite a visualização do conteúdo por debaixo
          child: SingleChildScrollView(
            /// com um padding de 32 pixeis em todos os lados
            padding: const EdgeInsets.all(32),
            /// um child com um widget que agrupa campos de texto, tornando-o um formulário
            child: Form(
              /// que utiliza o _formKey para validar os dados
              key: _formKey,
              /// com um child que contém uma coluna
              child: Column(
                children: [
                  /// Este TextFormField abre um campo de texto para o utilizador colocar o seu email
                  TextFormField(
                    /// Utiliza a variável controladora para controlar o texto inserido
                    controller: _emailController,
                    /// Só permite a introdução de um texto do formato de email, ou seja, abcd@efg.com
                    keyboardType: TextInputType.emailAddress,
                    /// E decora-o com
                    decoration: const InputDecoration(
                      /// Uma etiqueta
                      labelText: "Email",
                      /// Um ícone
                      prefixIcon: Icon(Icons.email),
                      /// Uma borda externa
                      border: OutlineInputBorder(),
                    ),
                    /// O validator é utilizado para validar o texto introduzido pelo utilizador
                    validator: (value) {
                      /// Neste caso cria uma condição de que se o email for nulo ou vazio
                      if (value == null || value.isEmpty){
                        /// Retorna com uma mensagem
                        return "Por favor, introduza um endereço de email";
                      }
                      /// Se o texto inserido não contiver (através do uso do !) um @
                      if (!value.contains("@")){
                        /// Retorna com uma mensagem
                        return "Email inválido";
                      }
                      /// Caso contrário, retorna nulo, ou seja, nenhuma mensagem de erro é apresentada
                      return null;
                    },
                  ),

                  const SizedBox(height : 16),

                  /// Este TextFormField abre um campo de texto para o utilizador colocar a sua palavra-passe
                  TextFormField(
                    /// Utiliza a variável controladora para controlar o texto inserido
                    controller: _passwordController,
                    /// Oculta o texto através do inverso (!) do valor da variável _passwordVisivel (true)
                    obscureText: !_passwordVisivel,
                    /// E decora-o com
                    decoration: InputDecoration(
                      /// Uma etiqueta
                      labelText: "Password",
                      /// Um ícone
                      prefixIcon: const Icon(Icons.lock),
                      /// Uma borda externa
                      border: const OutlineInputBorder(),
                      /// Um outro ícone, mas este no fim da barra
                      suffixIcon: IconButton(
                        /// O formato deste ícone é definido pela variável _passwordVisivel
                        icon: Icon(
                          _passwordVisivel
                          /// Caso a variável seja true, mostra um ícone de um olho
                          ? Icons.visibility
                          /// Caso contrário, mostra um ícone de um olho rasurado
                          : Icons.visibility_off,
                        ),
                        /// Quando este ícone é pressionado
                        onPressed: (){
                          /// Atualiza o ecrã para que o valor da variável _passwordVisivel se altere para o seu inverso
                          /// e assim alterar também o ícone a ser apresentado
                          setState(() {
                            _passwordVisivel = !_passwordVisivel;
                          });
                        },
                      ),
                    ),
                    /// O validator é utilizado para validar o texto introduzido pelo utilizador
                    validator: (value) {
                      /// Neste caso cria uma condição de que se a palavra-passe for nulo ou vazio
                      if (value == null || value.isEmpty){
                        /// Retorna com uma mensagem
                        return "Por favor, introduza uma palavra-passe";
                      }
                      /// Se o seu tamanho for menor que 6
                      if (value.length < 6) {
                        /// Retorna com uma mensagem
                        return "A palavra-passe deve conter pelo menos 6 caracteres!";
                      }
                      /// Caso contrário, retorna nulo, ou seja, nenhuma mensagem de erro é apresentada
                      return null;
                    },
                  ),

                  const SizedBox(height: 32),
                  /// Este sizedBox é onde o botão de iniciar sessão vai estar
                  SizedBox(
                    /// vai ocupar toda a largura necessária
                    width: double.infinity,
                    child: ElevatedButton(
                      /// quando pressionado vai executar o método _iniciarSessão
                      onPressed: _iniciarSessao,
                      /// contém uma etiqueta no seu interior
                      child: const Text("Login")
                    )
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
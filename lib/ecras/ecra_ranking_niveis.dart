import 'package:flutter/material.dart';
import 'ecra_ranking.dart';

class EcraRankingNiveis extends StatelessWidget{
  final String categoria;

  const EcraRankingNiveis({
    super.key,
    required this.categoria,
  });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Ranking - $categoria"),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _botaoNivel(context, 1),
                const SizedBox(height: 16),
                _botaoNivel(context, 2),
                const SizedBox(height: 16),
                _botaoNivel(context, 3),
              ],
            ),
          ),
        )
      ),
    );
  }

  Widget _botaoNivel (BuildContext context, int nivel){
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EcraRanking(
              categoria: categoria,
              nivel: nivel,
            )
          )
        ),
        icon: const Icon(Icons.leaderboard),
        label: Text("Nível $nivel"),
      ),
    );
  }
}
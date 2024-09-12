import 'dart:math';

class JogoLogica {
  final List<String> _escolhas = ['Pedra', 'Papel', 'Tesoura'];

  // Retorna a escolha do computador
  String getEscolhaComputador() {
    Random random = Random();
    int index = random.nextInt(_escolhas.length);
    return _escolhas[index];
  }

  // Avalia o resultado com base na escolha do jogador e do computador
  String getResultado(String escolhaJogador, String escolhaComputador) {
    if (escolhaJogador == escolhaComputador) {
      return 'Empate!';
    } else if (
        (escolhaJogador == 'Pedra' && escolhaComputador == 'Tesoura') ||
        (escolhaJogador == 'Papel' && escolhaComputador == 'Pedra') ||
        (escolhaJogador == 'Tesoura' && escolhaComputador == 'Papel')) {
      return 'Você Ganhou!';
    } else {
      return 'Computador Ganhou!';
    }
  }
}
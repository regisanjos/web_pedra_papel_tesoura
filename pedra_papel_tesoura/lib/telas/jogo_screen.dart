import 'package:flutter/material.dart';
import '../models/jogo_logica.dart';

class JogoScreen extends StatefulWidget {
  @override
  _JogoScreenState createState() => _JogoScreenState();
}

class _JogoScreenState extends State<JogoScreen> {
  final JogoLogica _jogoLogica = JogoLogica();
  int playerScore = 0;
  int computerScore = 0;
  String result = '';
  String escolhaJogador = '';
  String escolhaComputador = '';

  // Função para avaliar o resultado da rodada
  void _avaliarRodada(String escolhaJogador) {
    setState(() {
      this.escolhaJogador = escolhaJogador;
      escolhaComputador = _jogoLogica.getEscolhaComputador();

      result = _jogoLogica.getResultado(escolhaJogador, escolhaComputador);

      if (result == 'Você Ganhou!') {
        playerScore++;
      } else if (result == 'Computador Ganhou!') {
        computerScore++;
      }
    });
  }

  // Função para reiniciar o jogo
  void _reiniciarJogo() {
    setState(() {
      playerScore = 0;
      computerScore = 0;
      result = '';
      escolhaJogador = '';
      escolhaComputador = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Pedra Papel Tesoura')),
        backgroundColor: Colors.blue[800],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.blue, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Placar
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Você:', style: TextStyle(fontSize: 20)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('$playerScore', style: TextStyle(fontSize: 20)),
                  ),
                  Text('Computador:', style: TextStyle(fontSize: 20)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('$computerScore', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),
            // Escolha do jogador
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildEscolhaButton('assets/images/stone.png', 'Pedra'),
                _buildEscolhaButton('assets/images/paper.png', 'Papel'),
                _buildEscolhaButton('assets/images/scissor.png', 'Tesoura'),
              ],
            ),
            // Resultado da Rodada
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Text(
                result,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            // Escolha do Computador
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Computador escolheu: ', style: TextStyle(fontSize: 18)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    escolhaComputador,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            // Botão Reiniciar
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                onPressed: _reiniciarJogo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[400],
                  padding: EdgeInsets.all(10),
                  textStyle: TextStyle(fontSize: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Reiniciar'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para construir os botões de escolha
  Widget _buildEscolhaButton(String imagePath, String escolha) {
    return ElevatedButton(
      onPressed: () => _avaliarRodada(escolha),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[600],
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Image.asset(
        imagePath,
        width: 60,
        height: 60,
      ),
    );
  }
}
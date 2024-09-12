import 'package:flutter/material.dart';
import 'telas/jogo_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo Pedra Papel Tesoura',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: JogoScreen(),
    );
  }
  }
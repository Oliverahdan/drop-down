import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Cabeçalho Personalizado')),
        body: Column(
          children: [
            CabecalhoPersonalizado(),
            // Outros widgets podem ser adicionados aqui abaixo do cabeçalho
          ],
        ),
      ),
    );
  }
}

class CabecalhoPersonalizado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFfcd167), // Cor de fundo #FCD167
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Row(
        children: [
          Icon(
            Icons.person,
            color: Colors.black,
            size: 50,
          ),
          SizedBox(width: 20),
          Text(
            'Bem Vindo (a)',
            style: TextStyle(
              color: Color(0xFF765A13), // Cor do texto #765A13
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

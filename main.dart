import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Imagem Clicável')),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CartaoVisita(),
                  SizedBox(height: 20),
                  ImagensRedesSociais(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartaoVisita extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: Daniel'),
            Text('Cargo: Técnico em Informática'),
            Text('Número: 37 4002 8922'),
            Text('Email: flavindopneu@gmail.com'),
            Text('Manutenção e Suporte Técnico'),
          ],
        ),
      ),
    );
  }
}

class ImagensRedesSociais extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () async {
            const url = 'https://www.instagram.com/';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Não foi possível abrir o link $url';
            }
          },
          child: Image.asset(
            'assets/instagram.png',
            width: 70,
            height: 70,
          ),
        ),
        SizedBox(width: 20),
        InkWell(
          onTap: () async {
            const url = 'https://pt-br.facebook.com/';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Não foi possível abrir o link $url';
            }
          },
          child: Image.asset(
            'assets/facebook.png',
            width: 70,
            height: 70,
          ),
        ),
        SizedBox(width: 20),
        InkWell(
          onTap: () async {
            const url = 'https://twitter.com/';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Não foi possível abrir o link $url';
            }
          },
          child: Image.asset(
            'assets/twitter.png',
            width: 70,
            height: 70,
          ),
        ),
        SizedBox(width: 20),
        InkWell(
          onTap: () async {
            const url = 'https://www.whatsapp.com/';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Não foi possível abrir o link $url';
            }
          },
          child: Image.asset(
            'assets/whatsapp.png',
            width: 70,
            height: 70,
          ),
        ),
      ],
    );
  }
}

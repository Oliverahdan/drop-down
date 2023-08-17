import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cronômetro de Tempo de Atividade'),
        ),
        body: TempoDeAtividade(),
      ),
    );
  }
}

class TempoDeAtividade extends StatefulWidget {
  @override
  _TempoDeAtividadeState createState() => _TempoDeAtividadeState();
}

class _TempoDeAtividadeState extends State<TempoDeAtividade> {
  late Timer _timer;
  int _segundosAtivos = 0;

  Color _backgroundColor = Colors.white;
  String _mensagem = '';

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _segundosAtivos++;
        if (_segundosAtivos == 5) {
          _backgroundColor = Colors.yellow;
        } else if (_segundosAtivos == 10) {
          _backgroundColor = Colors.orange;
        } else if (_segundosAtivos == 15) {
          _backgroundColor = Colors.red;
          _mensagem = 'Hello World';
        } else if (_segundosAtivos == 20) {
          _timer.cancel();
          Navigator.pop(context);
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tempo de Atividade:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              _formatDuration(Duration(seconds: _segundosAtivos)),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              _mensagem,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

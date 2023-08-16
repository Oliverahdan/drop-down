import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  String _selectedState = 'Amigável';

  Map<String, Color> _statesColors = {
    'Amigável': Colors.orange,
    'Em paz': Colors.white,
    'Confiante': Colors.blue,
    'Animado': Colors.yellow,
    'Furioso': Colors.red,
    'Sensivel': Colors.purple,

  };

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = _statesColors[_selectedState] ?? Colors.white;
    return Scaffold(
      appBar: AppBar(
        title: Text('Estado Emocional'),
      ),
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selecione o estado mental de hoje:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: _selectedState,
              onChanged: (newValue) {
                setState(() {
                  _selectedState = newValue!;
                });
              },
              items: _statesColors.keys.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

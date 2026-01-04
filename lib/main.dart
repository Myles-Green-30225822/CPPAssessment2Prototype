import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App!!',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(title: 'Flutter Example App'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _buttonPressed = false;
  String _result = "";
  String _aiResult = "";
  String _playerChoice = "";
  String _winnerText = "";
  var _choices = ["Rock", "Paper", "Scissors"];
  var _randomAIChoice = null;

  void _gameReset() {
    setState(() {
          _playerChoice = "";
          _aiResult = "";
          _winnerText = "";
          _randomAIChoice = null;
          _buttonPressed = false;
        });
  }

  void _winningPlayer(String _result) {
    setState(() {
      _buttonPressed = false;
      _playerChoice = _result;
      _randomAIChoice = Random().nextInt(2);
      _aiResult = _choices[_randomAIChoice];
      if((_playerChoice == "Rock" && _aiResult == "Scissors")
      || (_playerChoice == "Paper" && _aiResult == "Rock")
      || (_playerChoice == "Scissors" && _aiResult == "Paper")) {
        _winnerText = "Player 1 - Wins!";
        _buttonPressed = true;
        Timer(Duration(seconds: 3), () {
          _gameReset();
        });
      }
      else if((_playerChoice == "Scissors" && _aiResult == "Rock")
      || (_playerChoice == "Rock" && _aiResult == "Paper")
      || (_playerChoice == "Paper" && _aiResult == "Scissors")) {
        _winnerText = "Player 2 - Wins!";
        _buttonPressed = true;
        Timer(Duration(seconds: 3), () {
          _gameReset();
        });
      }
      else if((_playerChoice == "Rock" && _aiResult == "Rock")
      || (_playerChoice == "Paper" && _aiResult == "Paper")
      || (_playerChoice == "Scissors" && _aiResult == "Scissors")) {
        _winnerText = "Draw";
        _buttonPressed = true;
        Timer(Duration(seconds: 3), () {
          _gameReset();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: 
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              'You have chosen:',
            ),
            Text(
              '$_playerChoice',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Text(
              'The enemy has chosen:',
            ),
            Text(
              '$_aiResult',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              '$_winnerText',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: _buttonPressed ? null : () => _winningPlayer("Rock"),
                  tooltip: 'Rock',
                  child: const Icon(Icons.handshake),
                ),
                FloatingActionButton(
                  onPressed: _buttonPressed ? null : () => _winningPlayer("Paper"),
                  tooltip: 'Paper',
                  child: const Icon(Icons.copy),
                ),
                FloatingActionButton(
                  onPressed: _buttonPressed ? null : () => _winningPlayer("Scissors"),
                  tooltip: 'Scissors',
                  child: const Icon(Icons.cut),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

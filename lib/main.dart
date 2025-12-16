import 'package:flutter/material.dart';

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
  String _result = "";
  String _AIresult = "";

  void _winningPlayer(String _result) {
    setState(() {
      print(_result);
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_AIresult',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () => _winningPlayer("Rock"),
                  tooltip: 'Rock',
                  child: const Icon(Icons.handshake),
                ),
                FloatingActionButton(
                  onPressed: () => _winningPlayer("Paper"),
                  tooltip: 'Paper',
                  child: const Icon(Icons.copy),
                ),
                FloatingActionButton(
                  onPressed: () => _winningPlayer("Scissors"),
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

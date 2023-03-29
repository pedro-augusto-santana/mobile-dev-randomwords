import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lorem Ipsum',
      theme: ThemeData(primaryColor: Colors.amber[900]),
      home: const MyHomePage(title: 'Lorem Ipsum'),
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
  WordPair _word = WordPair.random();

  void _incrementCounter() {
    setState(() {
      _word = WordPair.random();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Your random word is:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '${_word}',
              style: theme.textTheme.headlineLarge,
              semanticsLabel: '${_word.first} ${_word.second}',
            ),
            ElevatedButton(
              onPressed: _incrementCounter,
              // ignore: prefer_const_constructors
              style: ButtonStyle(
                padding: const MaterialStatePropertyAll(
                    EdgeInsets.fromLTRB(24, 24, 24, 24)),
              ),
              child: const Icon(Icons.question_mark_sharp),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const RandomWordsApp());
}

class RandomWordsApp extends StatelessWidget {
  const RandomWordsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lorem Ipsum',
      theme: ThemeData(primaryColor: Colors.amber[900], useMaterial3: true),
      home: const HomePage(title: 'Lorem Ipsum'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => MyAppState();
}

class MyAppState extends State<HomePage> {
  WordPair _word = WordPair.random();
  List<WordPair> _words = <WordPair>[];

  void _incrementCounter() {
    setState(() {
      _word = WordPair.random();
    });
  }

  void _toggleFavorite() {
    setState(() {
      if (_words.contains(_word)) {
        _words.remove(_word);
        return;
      }
      _words.add(_word);
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 12),
                ElevatedButton.icon(
                    onPressed: _incrementCounter,
                    // ignore: prefer_const_constructors
                    style: ButtonStyle(
                      minimumSize:
                          const MaterialStatePropertyAll(Size(196, 64)),
                      maximumSize:
                          const MaterialStatePropertyAll(Size(196, 64)),
                      padding:
                          const MaterialStatePropertyAll(EdgeInsets.all(0)),
                    ),
                    icon: const Icon(Icons.question_mark_sharp),
                    label: const Text('Próxima Palavra')),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  label: _words.contains(_word)
                      ? const Text('Favoritar')
                      : const Text(
                          'Remover dos favoritos',
                          overflow: TextOverflow.ellipsis,
                        ),
                  onPressed: () {
                    _toggleFavorite();
                  },
                  // ignore: prefer_const_constructors
                  style: ButtonStyle(
                    maximumSize: const MaterialStatePropertyAll(Size(196, 64)),
                    minimumSize: const MaterialStatePropertyAll(Size(196, 64)),
                    padding: const MaterialStatePropertyAll(EdgeInsets.all(0)),
                  ),
                  icon: _words.contains(_word)
                      ? const Icon(Icons.star_sharp)
                      : const Icon(Icons.star_outline_sharp),
                )
              ],
            ),
            Text(_words.toString())
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

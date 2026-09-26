import 'package:flutter/material.dart';

void main() {
  runApp(const OdysseyApp());
}

class OdysseyApp extends StatelessWidget {
  const OdysseyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Odyssey IELTS English',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final modules = [
      'Vocabulary',
      'Grammar',
      'Reading',
      'Writing',
      'Listening',
      'Speaking',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Odyssey IELTS English'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: modules.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(modules[index]),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          );
        },
      ),
    );
  }
}
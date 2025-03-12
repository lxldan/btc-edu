import 'package:flutter/material.dart';
import 'package:telegram_web_app/telegram_web_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bitcoin Edu Platform',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Bitcoin Education bla bla bla'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title)
      ),
      body: Stack(
        children: [
          if (TelegramWebApp.instance.isSupported)...[
            Text('Authorized by telegram'),
            Text('Telegram version: ${TelegramWebApp.instance.version}'),
            Text('Telegram init data: ${TelegramWebApp.instance.initData}'),
          ] else ...[
            Text('No authorized'),
          ]
        ]
      )
    );
  }
}
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:telegram_web_app/telegram_web_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              if (TelegramWebApp.instance.isSupported) {
                print(TelegramWebApp.instance.initData.toString());
                print(TelegramWebApp.instance.version);
              } else {
                print('It is not launched as TG mini app');
              }
            },
            icon: Icon(Icons.info),
          ),
        ],
      ),
      body: Center(
        child: RiveAnimation.network(
          'https://wkoghhjwpryqvljnbshj.supabase.co/storage/v1/object/public/test//untitled.riv',
        ),
      ),
    );
  }
}

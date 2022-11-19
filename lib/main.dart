import 'package:exec_penal_app/screens/calendar_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue // ou blue
          ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Teste Calendario'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: CalendarScreen(),
        backgroundColor: Colors.white,
      ),
    );
  }
}

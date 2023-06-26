import 'package:flutter/material.dart';
import 'package:obs/ogrenciana/devamsizlik.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Devamsızlık Girişi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AdminLoginPage(),
    );
  }
}

class AdminLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Girişi'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Öğrenci Devamsızlık Girişi'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DevamsizlikPage()),
            );
          },
        ),
      ),
    );
  }
}

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Ders Ekleme İşlemleri',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: DersEkle(),
    );
  }
}

class Student {
  final String dersAdi;
  final String kredi;
  final String saat;
  final String dersId;

  bool isDeleted;

  Student({
    required this.dersAdi,
    required this.kredi,
    required this.saat,
    required this.dersId,
    this.isDeleted = false,
  });
}

class DersEkle extends StatefulWidget {
  @override
  _DersEkleState createState() => _DersEkleState();
}

class _DersEkleState extends State<DersEkle> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _dersAdiController = TextEditingController();
  final TextEditingController _krediController = TextEditingController();
  final TextEditingController _saatController = TextEditingController();
  final TextEditingController _dersIdController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Ders İşlemleri'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _dersAdiController,
                decoration: InputDecoration(labelText: 'Ders Adı'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ders Adı zorunludur.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _krediController,
                decoration: InputDecoration(labelText: 'kredi'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'kredi zorunludur.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _saatController,
                decoration: InputDecoration(labelText: 'Ders saat'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ders saat zorunludur.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dersIdController,
                decoration: InputDecoration(labelText: 'Ders Id'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ders Id zorunludur.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: addDers,
                child: Text('Ders Ekle'),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void addDers() async {
    if (_formKey.currentState!.validate()) {
      String dersAdi = _dersAdiController.text;
      String kredi = _krediController.text;
      String saat = _saatController.text;
      String dersId = _dersIdController.text;

      // Firestore'a ders ekleme
      await _firestore.collection('ders').doc(dersId).set({
        'dersAdi': dersAdi,
        'kredi': kredi,
        'saat': saat,
        'dersId': dersId,
        'isDeleted': false,
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Başarılı'),
            content: Text('Ders eklendi.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Tamam'),
              ),
            ],
          );
        },
      );
    }
  }
}

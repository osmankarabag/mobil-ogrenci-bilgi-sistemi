import 'dart:math';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:obs/admin_page.dart';
import 'package:obs/oana_sayfa_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Öğrenci İşlemleri',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _ogrencinoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giriş Yap'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple, Colors.blue],
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _ogrencinoController,
                decoration: InputDecoration(
            labelText: 'Ogrenci No',
            border: OutlineInputBorder(),
            hintText: 'Ogrenci No',
          ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Öğrenci Numarası zorunludur.';
                  }
                  if (value.length != 11) {
                    return 'Öğrenci Numarası 11 haneli olmalıdır.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                    labelText: 'Şifre',
                    border: OutlineInputBorder(),
                ),

                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Şifre zorunludur.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: login,
                child: Text('Giriş Yap'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  primary: Colors.indigo,
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _goToAdminPage,
                child: Text('Admin Girişi'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  primary: Colors.indigo,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _goToAdminPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AdminPage()),
    );
  }

  void login() async {
    if (_formKey.currentState!.validate()) {
      String ogrencino = _ogrencinoController.text;
      String password = _passwordController.text;

      // Firestore'dan öğrenciyi kontrol etme
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('students')
          .where('ogrencino', isEqualTo: ogrencino)
          .where('password', isEqualTo: password)
          .get();

      if (snapshot.docs.isNotEmpty) {
        // Giriş başarılı, Ana Sayfaya yönlendirme yapılabilir

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Başarılı'),
              content: Text('Giriş başarılı! Ana sayfaya yönlendiriliyorsunuz.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => AnaSayfaPage()),
                    );
                  },
                  child: Text('Tamam'),
                ),
              ],
            );
          },
        );
      }
      else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Hata'),
              content: Text('Giriş başarısız! Öğrenci Numarası veya Şifre yanlış.'),
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
}

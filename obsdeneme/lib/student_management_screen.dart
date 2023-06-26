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
      title: 'Firebase Öğrenci İşlemleri',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StudentManagementScreen(),
    );
  }
}

class Student {
  final String name;
  final String surname;
  final String email;
  final String tcNumber;
  final String ogrencino;
  final String? ders;
  final String? not;
  final String? devamsizlik;
  bool isDeleted;

  Student({
    required this.name,
    required this.surname,
    required this.email,
    required this.tcNumber,
    required this.ogrencino,
    this.ders,
    this.not,
    this.devamsizlik,
    this.isDeleted = false,
  });
}

class StudentManagementScreen extends StatefulWidget {
  @override
  _StudentManagementScreenState createState() => _StudentManagementScreenState();
}

class _StudentManagementScreenState extends State<StudentManagementScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _tcNumberController = TextEditingController();
  final TextEditingController _ogrencinoController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Öğrenci İşlemleri'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'İsim'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'İsim zorunludur.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _surnameController,
                decoration: InputDecoration(labelText: 'Soyisim'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Soyisim zorunludur.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'E-posta'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'E-posta zorunludur.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _tcNumberController,
                decoration: InputDecoration(labelText: 'TC Kimlik Numarası'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'TC Kimlik Numarası zorunludur.';
                  }
                  if (value.length != 11) {
                    return 'TC Kimlik Numarası 11 haneli olmalıdır.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ogrencinoController,
                decoration: InputDecoration(labelText: 'Öğrenci No'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Öğrenci No zorunludur.';
                  }
                  if (value.length != 11) {
                    return 'Öğrenci No 11 haneli olmalıdır.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: addStudent,
                child: Text('Öğrenci Ekle'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addStudent() async {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text;
      String surname = _surnameController.text;
      String email = _emailController.text;
      String tcNumber = _tcNumberController.text;
      String ogrencino = _ogrencinoController.text;

      // Kontrol etme işlemleri
      bool isTCNumberExists = await checkIfTCNumberExists(tcNumber);
      bool isOgrenciNoExists = await checkIfOgrenciNoExists(ogrencino);
      bool isEmailExists = await checkIfEmailExists(email);

      if (isTCNumberExists) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Hata'),
              content: Text('Bu TC Kimlik Numarası zaten kayıtlı.'),
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
        return;
      }

      if (isOgrenciNoExists) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Hata'),
              content: Text('Bu Öğrenci No zaten kayıtlı.'),
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
        return;
      }

      if (isEmailExists) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Hata'),
              content: Text('Bu e-posta adresi zaten kayıtlı.'),
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
        return;
      }

      // Şifre oluşturma
      String password = _generateRandomPassword();

      // Firestore'a öğrenci ekleme
      await _firestore.collection('students').doc(ogrencino).set({
        'name': name,
        'surname': surname,
        'email': email,
        'tcNumber': tcNumber,
        'password': password,
        'ogrencino': ogrencino,
        'ders' : null,
        'not' : null,
        'devamsizlik': null,
        'isDeleted': false,
      });

      // Şifre gönderme işlemi burada yapılabilir

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Başarılı'),
            content: Text('Öğrenci eklendi. Şifre gönderildi.'),
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

  Future<bool> checkIfTCNumberExists(String tcNumber) async {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection('students')
        .where('tcNumber', isEqualTo: tcNumber)
        .get();

    return snapshot.docs.isNotEmpty;
  }

  Future<bool> checkIfOgrenciNoExists(String ogrencino) async {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection('students')
        .where('ogrencino', isEqualTo: ogrencino)
        .get();

    return snapshot.docs.isNotEmpty;
  }

  Future<bool> checkIfEmailExists(String email) async {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection('students')
        .where('email', isEqualTo: email)
        .get();

    return snapshot.docs.isNotEmpty;
  }

  String _generateRandomPassword() {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    final passwordLength = 8;
    String password = '';

    for (int i = 0; i < passwordLength; i++) {
      password += chars[random.nextInt(chars.length)];
    }

    return password;
  }
}

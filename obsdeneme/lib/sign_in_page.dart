/*import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _tcController = TextEditingController();
  final _dobController = TextEditingController();
  final _passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.purple, Colors.blue],
    ),
    ),
    child: Center(
    child: Form(
    key: _formKey,
    child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    TextFormField(
    controller: _tcController,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
    labelText: 'TC Kimlik No',
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    ),
    ),
    validator: (value) {
    if (value!.isEmpty) {
    return 'TC Kimlik No boş olamaz';
    }
    return null;
    },
    ),
    SizedBox(height: 16),
    TextFormField(
    controller: _dobController,
    keyboardType: TextInputType.datetime,
    decoration: InputDecoration(
    labelText: 'Doğum Tarihi',
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    ),
    ),
    validator: (value) {
    if (value!.isEmpty) {
    return 'Doğum Tarihi boş olamaz';
    }
    return null;
    },
    ),
    SizedBox(height: 16),
    TextFormField(
    controller: _passwordController,
    obscureText: true,
    decoration: InputDecoration(
    labelText: 'Şifre',
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    ),
    ),
    validator: (value) {
    if (value!.isEmpty) {
    return 'Şifre boş olamaz';
    }
    return null;
    },
    ),
    SizedBox(height: 16),
    Container(
    width: double.infinity,
    height: 50,
    margin: EdgeInsets.all(10),
    child: ElevatedButton(
    onPressed: () async {
    if (_formKey.currentState!.validate()) {
    try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: _tcController.text + '@example.com',
    password: _passwordController.text,
    );


    Navigator.pushNamed(context, '/login');
    } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
    showDialog(
    context: context,
    builder: (context) => AlertDialog(
    title: Text('Hata!'),
    content: Text('Şifre zayıf. Lütfen daha güçlü bir şifre seçin.'),
    ),
    );
    } else if (e.code == 'email-already-in-use') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Hata!'),
          content: Text('Bu e-posta zaten kullanımda. Lütfen farklı bir e-posta kullanın.'),
        ),
      );
    }
    } catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Hata!'),
          content: Text('Kayıt olurken bir hata oluştu. Lütfen tekrar deneyin.'),
        ),
      );
    }
    }
    },
      child: Text('Kayıt Ol'),
    ),
    ),
      ],
    ),
    ),
        ),
    ),
    ),
    );
  }
}
*/

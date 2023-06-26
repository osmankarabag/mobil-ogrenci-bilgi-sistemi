import 'package:flutter/material.dart';
import 'log_in_page.dart';
import 'aana_sayfa_page.dart';

class AdminPage extends StatefulWidget {
  @override
  AdminPageState createState() => AdminPageState();
}

String kullaniciadi = "";
String sifre = "";

class AdminPageState extends State<AdminPage> {
  void _login() {
    if (kullaniciadi == 'osman' && sifre == '123456') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdminAnaSayfaPage()),
      );
    } else if (kullaniciadi == '' && sifre == '') {
      var alert = AlertDialog(
        title: Text('Hata!'),
        content: Text('kullanıcı adı veya şifre girilmedi'),
      );
      showDialog(context: context, builder: (BuildContext) => alert);
    } else {
      var alert = AlertDialog(
        title: Text('Hata!'),
        content: Text('kullanıcı adı veya şifre hatalı'),
      );
      showDialog(context: context, builder: (BuildContext) => alert);
    }
  }

  void _goToLoginPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Girişi'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.blue],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Kullanıcı Adı',
                  border: OutlineInputBorder(),
                  hintText: 'Kullanıcı Adı',
                ),
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  kullaniciadi = value;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Şifre',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                onChanged: (value) {
                  sifre = value;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _login,
                child: Text('Giriş'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  primary: Colors.indigo,
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _goToLoginPage,
                child: Text('Öğrenci Girişi'),
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
}

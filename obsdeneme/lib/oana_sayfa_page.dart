import 'package:flutter/material.dart';
import 'package:obs/log_in_page.dart';
import 'package:obs/ogrenciana/dersprogrami.dart';
import 'package:obs/ogrenciana/transkript.dart';
import 'package:obs/ogrenciana/notbilgisi.dart';
import 'package:obs/ogrenciana/danisman.dart';
import 'package:obs/ogrenciana/devamsizlik.dart';
import 'package:obs/ogrenciana/akademik.dart';

class AnaSayfaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ana sayfa',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ana sayfa'),
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    'Öğrenci Paneli',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.calculate),
                title: Text('Not bilgisi'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotBilgisi()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Danışman bilgileri'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DanismanSayfasi(
                        danismanAdi: "Ali Yel", // Danışmanın adını buraya gönderin
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.schedule),
                title: Text('Ders programı'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DersProgrami()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.event),
                title: Text('Devamsızlık Girişi'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DevamsizlikPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text('Akademik takvim'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AkademikTakvim()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.power_settings_new),
                title: Text('Çıkış Yap'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ],
          ),
        ),
        body: const Center(
          child: const Text('Ana sayfaya hoşgeldiniz'),
        ),
      ),
    );
  }
}

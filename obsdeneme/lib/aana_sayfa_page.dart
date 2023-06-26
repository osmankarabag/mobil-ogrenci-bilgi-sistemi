import 'package:flutter/material.dart';
import 'package:obs/admin_page.dart';
import 'package:obs/adminpanel/danismangiris.dart';
import 'package:obs/adminpanel/dersekle.dart';
import 'package:obs/adminpanel/devamsizlikgiris.dart';
import 'package:obs/adminpanel/ogencilist.dart';
import 'student_management_screen.dart';

import 'ogrenciana/devamsizlik.dart';

class AdminAnaSayfaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Ana sayfa',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Admin Ana sayfa'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Admin Menüsü',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: Text('Öğrenci Yönetimi'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StudentManagementScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.check),
                title: Text('Öğrenci Listele'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder:(context) => StudentListPage()
                      )
                  );
                },
              ),ListTile(
                leading: Icon(Icons.person_add),
                title: Text('Danışman bilgilerine ekleme'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DanismanGirisSayfasi()
                    )
                  );
                },
              ),

              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Ders ekleme'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DersEkle()
                  )
                  );
                },
              ),

              ListTile(
                leading: Icon(Icons.arrow_forward),
                title: Text('Devamsızlık Girişi'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DevamsizlikPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.event),
                title: Text('Akademik takvimi düzenleme'),
                onTap: () {
                },
              ),

              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Çıkış Yap'),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => AdminPage()
                      ),
                  );
                },
              ),
            ],
          ),
        ),
        body: const Center(
          child: const Text('Ana sayfaya hoşgeldin'),
        ),
      ),
    );
  }
}

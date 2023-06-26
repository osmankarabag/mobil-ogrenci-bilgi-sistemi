/*import 'package:flutter/material.dart';
import 'package:obs/oana_sayfa_page.dart';

class TranskriptCikarmaPage extends StatelessWidget {
  final List<Transkript> transkriptler = AnaSayfaPage().getTranskriptler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transkript Çıkarma'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Transkript (not dökümü) çıkarma'),
              onTap: () {
                // TODO: Implement transkript çıkarma
              },
            ),
            ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text('Çıkış Yap'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: transkriptler.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          Transkript transkript = transkriptler[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListTile(
              title: Text(transkript.ad),
              subtitle: Text(transkript.tarih),
              onTap: () {
                // TODO: Implement transkript seçimi
              },
            ),
          );
        },
      ),
    );
  }
}

class Transkript {
  final String ad;
  final String tarih;

  Transkript(this.ad, this.tarih);
}
*/
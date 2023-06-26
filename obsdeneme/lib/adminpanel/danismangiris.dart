import 'package:flutter/material.dart';
import 'package:obs/ogrenciana/danisman.dart';

class DanismanGirisSayfasi extends StatefulWidget {
  @override
  _DanismanGirisSayfasiState createState() => _DanismanGirisSayfasiState();
}

class _DanismanGirisSayfasiState extends State<DanismanGirisSayfasi> {
  List<String> siniflar = ["1. Sınıf", "2. Sınıf", "3. Sınıf", "4. Sınıf"];
  List<String> danismanlar = ["Ahmet Yel", "Mehmet Yel", "Ali Yel", "Veli Yel"];
  String? secilenSinif;
  String? secilenDanisman;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Danışman Atama"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: secilenSinif,
              hint: Text("Sınıf Seçin"),
              items: siniflar.map((sinif) {
                return DropdownMenuItem<String>(
                  value: sinif,
                  child: Text(sinif),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  secilenSinif = newValue;
                });
              },
            ),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              value: secilenDanisman,
              hint: Text("Danışman Seçin"),
              items: danismanlar.map((danisman) {
                return DropdownMenuItem<String>(
                  value: danisman,
                  child: Text(danisman),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  secilenDanisman = newValue;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (secilenSinif != null && secilenDanisman != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DanismanSayfasi(
                        danismanAdi: secilenDanisman!,
                      ),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Uyarı"),
                        content: Text("Lütfen sınıf ve danışman seçin."),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Tamam"),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text("Atama Yap"),
            ),
          ],
        ),
      ),
    );
  }
}

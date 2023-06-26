import 'package:flutter/material.dart';

class DanismanSayfasi extends StatelessWidget {
  final String danismanAdi;

  DanismanSayfasi({required this.danismanAdi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Danışman Bilgileri"),
      ),
      body: Container(
        color: Colors.yellow, // Renkli blok için kullanılan renk
        padding: EdgeInsets.all(16.0),
        child: Text(
          "Danışman: $danismanAdi",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

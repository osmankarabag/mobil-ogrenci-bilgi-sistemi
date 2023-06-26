import 'package:flutter/material.dart';

class DersProgrami extends StatefulWidget {
  const DersProgrami({Key? key}) : super(key: key);

  @override
  _DersProgramiState createState() => _DersProgramiState();
}

class _DersProgramiState extends State<DersProgrami> {
  List<List<String>> dersler = List.generate(9, (_) => List.filled(8, ''));

  void dersEkle(int saat, int gun, String ders) {
    setState(() {
      dersler[saat - 8][gun] = ders;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ders Programı'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('Dersler/Saatler')),
            DataColumn(label: Text('Pazartesi')),
            DataColumn(label: Text('Salı')),
            DataColumn(label: Text('Çarşamba')),
            DataColumn(label: Text('Perşembe')),
            DataColumn(label: Text('Cuma')),
            DataColumn(label: Text('Cumartesi')),
            DataColumn(label: Text('Pazar')),
          ],
          rows: List.generate(9, (index) {
            return DataRow(cells: [
              DataCell(Text('${index + 8}:00 - ${index + 9}:00')),
              DataCell(Text(dersler[index][0])),
              DataCell(Text(dersler[index][1])),
              DataCell(Text(dersler[index][2])),
              DataCell(Text(dersler[index][3])),
              DataCell(Text(dersler[index][4])),
              DataCell(Text(dersler[index][5])),
              DataCell(Text(dersler[index][6])),
            ]);
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dersEkle(9, 1, 'Matematik'); // Örnek bir ders ekleyelim
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DersProgrami(),
  ));
}

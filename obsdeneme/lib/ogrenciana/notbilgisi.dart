import 'package:flutter/material.dart';

class NotBilgisi extends StatefulWidget {
  const NotBilgisi({Key? key}) : super(key: key);

  @override
  _NotBilgisiState createState() => _NotBilgisiState();
}

class _NotBilgisiState extends State<NotBilgisi> {
  final List<NotBilgisiModel> _notlar = [    NotBilgisiModel('Matematik', null),    NotBilgisiModel('Fizik', null),    NotBilgisiModel('Kimya', null),    NotBilgisiModel('Türk Dili ve Edebiyatı', null),  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Not Bilgisi'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: [
            DataColumn(label: Text('Ders')),
            DataColumn(label: Text('Not')),
          ],
          rows: _notlar.map((not) => DataRow(
              cells: [
                DataCell(Text(not.ders)),
                DataCell(Text(not.not == null ? '-' : not.not.toString())),
              ]
          )).toList(),
        ),
      ),
    );
  }
}

class NotBilgisiModel {
  String ders;
  int? not;

  NotBilgisiModel(this.ders, this.not);
}

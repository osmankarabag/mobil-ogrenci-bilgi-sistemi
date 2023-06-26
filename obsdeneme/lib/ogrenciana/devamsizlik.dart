import 'package:flutter/material.dart';

class DevamsizlikPage extends StatefulWidget {
  @override
  _DevamsizlikPageState createState() => _DevamsizlikPageState();
}

class _DevamsizlikPageState extends State<DevamsizlikPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _absenceController = TextEditingController();

  List<Student> _students = [];

  void _addAttendance() {
    String name = _nameController.text;
    int absence = int.tryParse(_absenceController.text) ?? 0;

    Student student = Student(name: name, absence: absence);
    setState(() {
      _students.add(student);
    });

    _nameController.clear();
    _absenceController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Öğrenci Devamsızlık Girişi'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Öğrenci Adı'),
            ),
            TextField(
              controller: _absenceController,
              decoration: InputDecoration(labelText: 'Devamsızlık Sayısı'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              child: Text('Devamsızlık Ekle'),
              onPressed: _addAttendance,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _students.length,
                itemBuilder: (context, index) {
                  Student student = _students[index];
                  return ListTile(
                    title: Text(student.name),
                    subtitle: Text('Devamsızlık: ${student.absence}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Student {
  String name;
  int absence;

  Student({required this.name, required this.absence});
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Öğrenci Listesi'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('students').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<DocumentSnapshot> documents = snapshot.data!.docs;
            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> student =
                documents[index].data() as Map<String, dynamic>;
                String? name = student['name'];
                String? surname = student['surname'];
                String? ogrencino = student['ogrencino'];
                return ListTile(
                  title: Text(name! + ' ' + surname!),
                  subtitle: Text(ogrencino!),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            StudentDetailsPage(student: student),
                      ),
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Hata: Veri alınamadı'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class StudentDetailsPage extends StatefulWidget {
  final Map<String, dynamic> student;

  const StudentDetailsPage({required this.student});

  @override
  _StudentDetailsPageState createState() => _StudentDetailsPageState();
}

class _StudentDetailsPageState extends State<StudentDetailsPage> {
  TextEditingController dersController = TextEditingController();
  TextEditingController notController = TextEditingController();
  TextEditingController devamsizlikController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dersController.text = widget.student['ders'] ?? '';
    notController.text = widget.student['not'] ?? '';
    devamsizlikController.text = widget.student['devamsizlik'] ?? '';
  }

  @override
  void dispose() {
    dersController.dispose();
    notController.dispose();
    devamsizlikController.dispose();
    super.dispose();
  }

  void _saveStudentDetails() {
    String ders = dersController.text.trim();
    String not = notController.text.trim();
    String devamsizlik = devamsizlikController.text.trim();

    // Update the existing student document in Firestore
    FirebaseFirestore.instance
        .collection('students')
        .doc(widget.student['ogrencino'])
        .update({
      'ders': ders,
      'not': not,
      'devamsizlik': devamsizlik,
    }).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Öğrenci bilgileri güncellendi')),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Öğrenci bilgileri güncellenirken hata oluştu')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Öğrenci Bilgileri'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Öğrenci Adı Soyadı: ${widget.student['name']} ${widget.student['surname']}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Öğrenci Numarası: ${widget.student['ogrencino']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Ders Bilgisi:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: dersController,
              decoration: InputDecoration(
                hintText: 'Ders bilgisini girin',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Not Bilgisi:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: notController,
              decoration: InputDecoration(
                hintText: 'Not bilgisini girin',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Devamsızlık Bilgisi:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: devamsizlikController,
              decoration: InputDecoration(
                hintText: 'Devamsızlık bilgisini girin',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveStudentDetails,
              child: Text('Bilgileri Güncelle'),
            ),
          ],
        ),
      ),
    );
  }
}

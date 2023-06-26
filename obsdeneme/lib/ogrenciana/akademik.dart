import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AkademikTakvim extends StatefulWidget {
  const AkademikTakvim({Key? key}) : super(key: key);

  @override
  _AkademikTakvimState createState() => _AkademikTakvimState();
}

class _AkademikTakvimState extends State<AkademikTakvim> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime? _focusedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = _selectedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akademik Takvim'),
      ),
      body: Column(
        children: [
          TableCalendar(
            calendarFormat: _calendarFormat,
            focusedDay: _focusedDay!,
            firstDay: DateTime(DateTime.now().year - 1),
            lastDay: DateTime(DateTime.now().year + 1),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  _buildAkademikTakvimEvent(
                    title: 'Yarıyıl Tatili',
                    date: DateTime(DateTime.now().year, 1, 15),
                  ),
                  _buildAkademikTakvimEvent(
                    title: 'Dönem Sonu Sınavları',
                    date: DateTime(DateTime.now().year, 5, 20),
                  ),
                  // Buraya istediğiniz diğer akademik etkinlikleri ekleyebilirsiniz...
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAkademikTakvimEvent({
    required String title,
    required DateTime date,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(title),
        subtitle: Text(_getFormattedDate(date)),
      ),
    );
  }

  String _getFormattedDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
  }
}

void main() {
  runApp(MaterialApp(
    home: AkademikTakvim(),
  ));
}

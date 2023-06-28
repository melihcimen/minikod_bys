import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class DersProgrami extends StatefulWidget {
  final User user;
  const DersProgrami({super.key, required this.user});

  @override
  State<DersProgrami> createState() => _DersProgramiState();
}

class _DersProgramiState extends State<DersProgrami> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf5eefa),
      appBar: AppBar(
        backgroundColor: const Color(0xFF93278F),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        title: const Text(
          'Ders Programı',
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SfCalendar(
          monthViewSettings: const MonthViewSettings(showAgenda: true),
          firstDayOfWeek: 1,
          timeSlotViewSettings: const TimeSlotViewSettings(timeFormat: 'h:mm'),
          view: CalendarView.month,
        ),
      ),
    );
  }
}

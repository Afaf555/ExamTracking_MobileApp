import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  String timeLeft() {
    final now = DateTime.now();
    final diff = exam.dateTime.difference(now);

    if (diff.isNegative) {
      return "Испитот веќе помина";
    }

    final days = diff.inDays;
    final hours = diff.inHours.remainder(24);

    return "$days дена, $hours часа преостануваат";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exam.subjectName),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Предмет: ${exam.subjectName}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.calendar_month),
                const SizedBox(width: 6),
                Text("Датум: ${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year}"),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.schedule),
                const SizedBox(width: 6),
                Text("Време: ${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2, '0')}"),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.room),
                const SizedBox(width: 6),
                Text("Простории: ${exam.rooms.join(", ")}"),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              timeLeft(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}

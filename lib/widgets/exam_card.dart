import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    bool passed = exam.dateTime.isBefore(DateTime.now());

    return Card(
      color: passed ? Colors.pink[200] : Colors.green[200],
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // const Icon(Icons.school, size: 35),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(exam.subjectName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.calendar_month, size: 18),
                      const SizedBox(width: 4),
                      Text("${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year}"),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.schedule, size: 18),
                      const SizedBox(width: 4),
                      Text("${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2, '0')}"),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.room, size: 18),
                      const SizedBox(width: 4),
                      Text(exam.rooms.join(", ")),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

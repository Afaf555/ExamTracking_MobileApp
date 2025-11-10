import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatelessWidget {
  const ExamListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Exam> exams = [
      Exam(subjectName: "Мобилни апликации", dateTime: DateTime(2025, 11, 15, 9, 0), rooms: ["А1", "А2"]),
      Exam(subjectName: "Оперативни системи", dateTime: DateTime(2025, 12, 10, 12, 0), rooms: ["Лаб 3"]),
      Exam(subjectName: "Веб програмирање", dateTime: DateTime(2025, 12, 27, 10, 0), rooms: ["А3"]),
      Exam(subjectName: "Алгоритми и податочни структури", dateTime: DateTime(2025, 2, 5, 9, 30), rooms: ["Б1"]),
      Exam(subjectName: "Бази на податоци", dateTime: DateTime(2025, 11, 18, 8, 0), rooms: ["Лаб 2"]),
      Exam(subjectName: "Интернет технологии", dateTime: DateTime(2025, 2, 2, 14, 0), rooms: ["А2"]),
      Exam(subjectName: "Компјутерски мрежи", dateTime: DateTime(2025, 11, 30, 9, 0), rooms: ["Б4"]),
      Exam(subjectName: "Сајбер безбедност", dateTime: DateTime(2025, 12, 7, 11, 0), rooms: ["Б5"]),
      Exam(subjectName: "Структурно програмирање", dateTime: DateTime(2024, 12, 20, 10, 0), rooms: ["А1"]), // поминат
      Exam(subjectName: "Математика", dateTime: DateTime(2025, 11, 25, 13, 0), rooms: ["Амфитеатар"]),
    ];


    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Распоред за испити - 233032"),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ExamDetailScreen(exam: exam),
                ),
              );
            },
            child: ExamCard(exam: exam),
          );
        },
      ),


      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(14),
        color: Colors.blue[400],
        child: Text(
          "Вкупно испити: ${exams.length}",
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black, fontSize: 17),
        ),
      ),
    );
  }
}

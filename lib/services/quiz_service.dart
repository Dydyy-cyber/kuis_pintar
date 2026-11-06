import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/quiz_question.dart';

class QuizService {

  Future<List<QuizQuestion>> loadQuestions() async {

    // Membaca file JSON
    final String response =
        await rootBundle.loadString('assets/data/kuis.json');

    // Mengubah JSON menjadi List
    final List<dynamic> data = jsonDecode(response);

    // Mengubah data menjadi objek Model
    return data.map((item) {
      return QuizQuestion.fromJson(item);
    }).toList();
  }
}
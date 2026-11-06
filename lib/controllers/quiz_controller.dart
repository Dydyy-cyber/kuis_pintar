import 'package:flutter/material.dart';
import '../models/quiz_question.dart';
import '../services/quiz_service.dart';

class QuizController extends ChangeNotifier {

  final QuizService service = QuizService();

  List<QuizQuestion> questions = [];

  Map<int, int> answers = {};

  int currentIndex = 0;

  bool isLoading = false;

  String? errorMessage;

  // Mengambil soal saat ini
  QuizQuestion? get currentQuestion {
    if (questions.isEmpty) return null;
    return questions[currentIndex];
  }

  // Jawaban yang dipilih
  int? get selectedAnswer {
    return answers[currentIndex];
  }

  // Memuat data JSON
  Future<void> loadQuestions() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      questions = await service.loadQuestions();

      if (questions.isEmpty) {
        errorMessage = 'Data soal masih kosong.';
      }
    } catch (e) {
      errorMessage = 'Gagal membaca data soal: $e';
    }

    isLoading = false;
    notifyListeners();
  }

  // Memilih jawaban
  void selectAnswer(int index) {
    answers[currentIndex] = index;
    notifyListeners();
  }

  // Pindah soal
  void nextQuestion() {
    if (selectedAnswer == null) return;

    if (currentIndex < questions.length - 1) {
      currentIndex++;
      notifyListeners();
    }
  }

  // Menghitung skor
  int calculateScore() {
    int benar = 0;

    for (int i = 0; i < questions.length; i++) {
      if (answers[i] == questions[i].jawabanBenar) {
        benar++;
      }
    }

    return benar;
  }

  // Reset kuis
  void resetQuiz() {
    answers.clear();
    currentIndex = 0;
    notifyListeners();
  }
}
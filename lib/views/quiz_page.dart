import 'package:flutter/material.dart';

import '../controllers/quiz_controller.dart';
import '../widgets/answer_button.dart';
import '../widgets/question_card.dart';
import '../widgets/progress_bar.dart';
import 'result_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late QuizController controller;

  @override
  void initState() {
    super.initState();

    controller = QuizController();
    controller.loadQuestions();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // Fungsi pindah soal
  void nextQuestion() {
    if (controller.selectedAnswer == null) {
      return;
    }

    if (controller.currentIndex ==
        controller.questions.length - 1) {

      int score = controller.calculateScore();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            score: score,
            total: controller.questions.length,
          ),
        ),
      );
    } else {
      controller.nextQuestion();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Kuis Pilihan Ganda',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          body: controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : controller.errorMessage != null
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          controller.errorMessage!,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : buildQuiz(),
        );
      },
    );
  }

  Widget buildQuiz() {
    final question = controller.currentQuestion!;

    return Padding(
      padding: const EdgeInsets.all(20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Progress Bar
          ProgressBar(
            currentQuestion:
                controller.currentIndex + 1,
            totalQuestions:
                controller.questions.length,
          ),

          const SizedBox(height: 30),

          // Area soal dan pilihan jawaban
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [

                  // Question Card
                  QuestionCard(
                    question: question.pertanyaan,
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    'PILIH SATU JAWABAN',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      letterSpacing: 1,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Daftar jawaban
                  ...List.generate(
                    question.pilihan.length,
                    (index) {
                      return AnswerButton(
                        answer: question.pilihan[index],
                        letter: String.fromCharCode(
                          65 + index,
                        ),
                        isSelected:
                            controller.selectedAnswer == index,
                        onTap: () {
                          controller.selectAnswer(index);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 15),

          // Tombol selanjutnya
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed:
                  controller.selectedAnswer == null
                      ? null
                      : nextQuestion,

              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color(0xFF356AE6),
                foregroundColor: Colors.white,
                disabledBackgroundColor:
                    Colors.grey.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),

              child: Text(
                controller.currentIndex ==
                        controller.questions.length - 1
                    ? 'LIHAT HASIL'
                    : 'SELANJUTNYA',

                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
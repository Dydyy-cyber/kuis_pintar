import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;

  const ProgressBar({
    super.key,
    required this.currentQuestion,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    double progress = totalQuestions == 0
        ? 0
        : currentQuestion / totalQuestions;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'SOAL $currentQuestion',
              style: const TextStyle(
                color: Color(0xFF356AE6),
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              '$currentQuestion dari $totalQuestions',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            backgroundColor: Colors.grey.shade200,
            valueColor:
                const AlwaysStoppedAnimation<Color>(
              Color(0xFF356AE6),
            ),
          ),
        ),
      ],
    );
  }
}
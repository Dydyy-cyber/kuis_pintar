import 'package:flutter/material.dart';
import 'quiz_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Spacer(),

              const Icon(
                Icons.quiz_rounded,
                size: 85,
                color: Color(0xFF356AE6),
              ),

              const SizedBox(height: 30),

              const Text(
                'KUIS PINTAR',
                style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFF356AE6),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                'Uji Pengetahuanmu!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF17233D),
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                'Jawab pertanyaan pilihan ganda '
                'dan lihat hasil nilaimu di akhir kuis.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 30),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),

                child: const Row(
                  children: [
                    Icon(
                      Icons.list_alt,
                      color: Color(0xFF356AE6),
                      size: 30,
                    ),

                    SizedBox(width: 15),

                    Text(
                      '10 Soal Pilihan Ganda',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 58,

                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const QuizPage(),
                      ),
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF356AE6),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(15),
                    ),
                  ),

                  child: const Text(
                    'MULAI KUIS',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Center(
                child: Text(
                  'Semangat mengerjakan!',
                  style: TextStyle(color: Colors.grey),
                ),
              ),

              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
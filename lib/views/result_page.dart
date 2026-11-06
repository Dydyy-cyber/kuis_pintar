import 'package:flutter/material.dart';
import 'home_page.dart';

class ResultPage extends StatelessWidget {

  final int score;
  final int total;

  const ResultPage({
    super.key,
    required this.score,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {

    int nilai = total == 0
        ? 0
        : ((score / total) * 100).round();

    String predikat;

    if (nilai >= 80) {
      predikat = 'Bagus';
    } else if (nilai >= 60) {
      predikat = 'Cukup';
    } else {
      predikat = 'Perlu Belajar';
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),

          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,

            children: [

              const Icon(
                Icons.emoji_events,
                size: 90,
                color: Colors.amber,
              ),

              const SizedBox(height: 25),

              const Text(
                'KUIS SELESAI!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Berikut hasil pengerjaan kuismu',
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 35),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(30),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),

                child: Column(
                  children: [

                    const Text(
                      'SKOR AKHIR',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        letterSpacing: 2,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      '$nilai',
                      style: const TextStyle(
                        fontSize: 65,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF356AE6),
                      ),
                    ),

                    const Text('POIN'),

                    const SizedBox(height: 25),

                    Text(
                      'Predikat: $predikat',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF356AE6),
                      ),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      '$score jawaban benar dari $total soal',
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 35),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  onPressed: () {

                    Navigator.pushAndRemoveUntil(
                      context,

                      MaterialPageRoute(
                        builder: (context) =>
                            const HomePage(),
                      ),

                      (route) => false,
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF356AE6),
                    foregroundColor: Colors.white,
                  ),

                  child: const Text(
                    'ULANGI KUIS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
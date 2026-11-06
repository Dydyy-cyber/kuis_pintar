class QuizQuestion {
  final int id;
  final String pertanyaan;
  final List<String> pilihan;
  final int jawabanBenar;

  QuizQuestion({
    required this.id,
    required this.pertanyaan,
    required this.pilihan,
    required this.jawabanBenar,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      id: json['id'],
      pertanyaan: json['pertanyaan'],
      pilihan: List<String>.from(json['pilihan']),
      jawabanBenar: json['jawabanBenar'],
    );
  }
}
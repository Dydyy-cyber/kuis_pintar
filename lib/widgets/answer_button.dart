import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answer;
  final String letter;
  final bool isSelected;
  final VoidCallback onTap;

  const AnswerButton({
    super.key,
    required this.answer,
    required this.letter,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(17),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFFE7EEFF)
                : Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: isSelected
                  ? const Color(0xFF356AE6)
                  : Colors.grey.shade300,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: isSelected
                    ? const Color(0xFF356AE6)
                    : Colors.grey.shade200,
                child: Text(
                  letter,
                  style: TextStyle(
                    color: isSelected
                        ? Colors.white
                        : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: Text(
                  answer,
                  style: const TextStyle(fontSize: 15),
                ),
              ),

              if (isSelected)
                const Icon(
                  Icons.check_circle,
                  color: Color(0xFF356AE6),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
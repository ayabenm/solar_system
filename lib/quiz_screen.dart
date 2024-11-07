import 'package:flutter/material.dart';
import '../quiz_data.dart';
import '../quiz_question.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  bool isAnswered = false;
  String userAnswer = '';
  bool isCorrect = false;

  void checkAnswer(String answer) {
    setState(() {
      isAnswered = true;
      userAnswer = answer;
      isCorrect = answer == quizQuestions[currentQuestionIndex].answer;
      if (isCorrect) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (currentQuestionIndex + 1 < quizQuestions.length) {
      setState(() {
        isAnswered = false;
        userAnswer = '';
        currentQuestionIndex++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ResultScreen(score: score, total: quizQuestions.length),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = quizQuestions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('اختبار'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(question.question, style: TextStyle(fontSize: 20)),
            ...question.options.map((option) {
              return ElevatedButton(
                onPressed: isAnswered ? null : () => checkAnswer(option),
                child: Text(option),
              );
            }).toList(),
            if (isAnswered) ...[
              Text(isCorrect
                  ? 'صحيح!'
                  : 'خطأ! الإجابة الصحيحة هي ${question.answer}.'),
              ElevatedButton(
                onPressed: nextQuestion,
                child: Text('السؤال التالي'),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

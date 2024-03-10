// quiz_view_model.dart

import 'package:flutter/material.dart';

class QuizViewModel extends ChangeNotifier {
  List<Map<String, dynamic>> _questions;
  int _currentIndex = 0;
  int _score = 0;
  String? _selectedOption;
  bool? _isAnsweredCorrectly;

  QuizViewModel(this._questions);

  String get currentQuestionText => _questions[_currentIndex]['question'];
  List<String> get currentQuestionOptions =>
      List<String>.from(_questions[_currentIndex]['options']);
  int get totalQuestions => _questions.length;
  int get score => _score;
  bool get hasNextQuestion => _currentIndex < _questions.length - 1;
  int get currentIndex => _currentIndex;
  String? get selectedOption => _selectedOption;
  bool? get isAnsweredCorrectly => _isAnsweredCorrectly;

  void answerQuestion(String selectedOption) {
    String correctAnswer = _questions[_currentIndex]['correctAnswer'];

    if (selectedOption == correctAnswer) {
      _score++;
      _isAnsweredCorrectly = true;
    } else {
      _isAnsweredCorrectly = false;
    }

    _selectedOption = selectedOption;

    notifyListeners();
  }

  void nextQuestion() {
    if (_currentIndex < totalQuestions - 1) {
      _currentIndex++;
      _selectedOption = null;
      _isAnsweredCorrectly = null;
    }

    notifyListeners();
  }
}

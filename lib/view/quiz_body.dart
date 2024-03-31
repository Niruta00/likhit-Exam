// quiz_body.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/quiz_view_model.dart';
import '../widget/quizwidget.dart';
import 'next_screen.dart';

class QuizBody extends StatelessWidget {
  final String? selectedSetName;
  final List<Map<String, dynamic>>? selectedSetQuestions;

  const QuizBody({Key? key, this.selectedSetName, this.selectedSetQuestions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Quiz App'),
          ),
          body: SafeArea(
            child: Center(
              child: Card(
                color: Colors.white,
                elevation: 8.0,
                margin: EdgeInsets.all(16.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Selected Set: ${selectedSetName ?? 'No set selected'}',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Question ${viewModel.currentIndex + 1}/${viewModel.totalQuestions}',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 16.0),
                      Center(
                        child: Text(
                          selectedSetQuestions?[viewModel.currentIndex]['question'] ??
                              'No question available',
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 16.0),
                        child: OptionsWidget(
                          options: selectedSetQuestions?[viewModel.currentIndex]['options'] ?? [],
                          onOptionSelected: (selectedOption) {
                            viewModel.answerQuestion(selectedOption);
                          },
                          selectedOption: viewModel.selectedOption,
                          isAnsweredCorrectly: viewModel.isAnsweredCorrectly,
                        ),
                      ),
                      if (viewModel.selectedOption != null)
                        Text(
                          viewModel.isAnsweredCorrectly == true
                              ? 'Correct!'
                              : 'Incorrect!',
                          style: TextStyle(
                            color: viewModel.isAnsweredCorrectly == true
                                ? Colors.green
                                : Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ElevatedButton(
                        onPressed: () {
                          if (viewModel.hasNextQuestion) {
                            viewModel.nextQuestion();
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => NextScreen()),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          // primary: Colors.teal,
                          padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          viewModel.hasNextQuestion ? 'Next Question' : 'Finish Quiz',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Score: ${viewModel.score}/${viewModel.totalQuestions}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

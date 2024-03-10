import 'package:flutter/material.dart';
import '../model/question_model.dart';
import 'quiz_body.dart';

class ChooseSetScreen extends StatelessWidget {
  final Function(String, List<Map<String, dynamic>>)? onSetTap;

  const ChooseSetScreen({Key? key, this.onSetTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Set'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: quizSets.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              // Use Navigator.push to navigate to QuizBody
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizBody(
                    selectedSetName: quizSets[index].setName,
                    selectedSetQuestions: quizSets[index].questions,
                  ),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _getSetColor(index),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  quizSets[index].setName,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getSetColor(int index) {
    List<Color> colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
      Colors.teal,
      Colors.amber,
      Colors.indigo,
      Colors.deepOrange,
      Colors.cyan,
    ];

    return colors[index % colors.length];
  }
}

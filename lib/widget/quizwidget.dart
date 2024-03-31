import 'package:flutter/material.dart';

class OptionsWidget extends StatelessWidget {
  final List<String> options;
  final Function(String) onOptionSelected;
  final String? selectedOption;
  final bool? isAnsweredCorrectly;

  OptionsWidget({
    required this.options,
    required this.onOptionSelected,
    this.selectedOption,
    this.isAnsweredCorrectly,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options.map((option) {
        bool isCorrectOption = option == selectedOption;
        bool showCorrectness = isAnsweredCorrectly != null && isAnsweredCorrectly!;

        return Container(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: showCorrectness ? (isCorrectOption ? Colors.green : Colors.red) : Colors.black,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: TextButton(
            onPressed: () {
              if (isAnsweredCorrectly == null || !isAnsweredCorrectly!) {
                onOptionSelected(option);
              }
            },
            style: TextButton.styleFrom(
              // primary: Colors.black,
              padding: EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Align(
                alignment: Alignment.center,
                child: Text(option),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

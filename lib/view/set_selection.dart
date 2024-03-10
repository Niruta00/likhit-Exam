// // set_selection_screen.dart

// import 'package:flutter/material.dart';

// import 'home_view.dart';

// class SetSelectionScreen extends StatelessWidget {
//   final List<String> sets = ['Set 1', 'Set 2']; // Add more sets as needed

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Select a Quiz Set'),
//       ),
//       body: ListView.builder(
//         itemCount: sets.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(sets[index]),
//             onTap: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => QuizBody(selectedSet: sets[index]),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

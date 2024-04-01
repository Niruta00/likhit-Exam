import 'package:flutter/material.dart';
import 'package:quizapp/data/symbols.dart';

class TrafficSymbolsScreen extends StatelessWidget {
  const TrafficSymbolsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Traffic Symbols'),
      ),
      body: Container(
        color: Color.fromARGB(255, 238, 238, 238),
        width: MediaQuery.of(context).size.width,
        
        child: GridView.count(
          crossAxisCount: 2, 
          children: trafficSign.map((sign) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                elevation: 2.0,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(sign['image'],height:100,),
                    ),
                    SizedBox(height: 8), 
                    Text(
                      sign['title'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

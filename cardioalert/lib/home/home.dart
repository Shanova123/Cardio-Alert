import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController ageController = TextEditingController();
  int maxHeartRate = 0;
  int minHeartRate = 0;

  void calculateHeartRates() {
    int age = int.tryParse(ageController.text) ?? 0;

    maxHeartRate = 220 - age;
    minHeartRate = (maxHeartRate * 0.7).toInt();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cardio Alert'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Lottie.asset('assets/images/heart.json'),
              height: 300,
            ),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Your Age'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (ageController.text.isNotEmpty) {
                  calculateHeartRates();
                }
              },
              child: Text('Calculate Heart Rates'),
            ),
            SizedBox(height: 16),
            Text(
              'Max Heart Rate: $maxHeartRate',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Min Heart Rate: $minHeartRate',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

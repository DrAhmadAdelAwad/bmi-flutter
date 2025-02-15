import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double bmi = ModalRoute.of(context)!.settings.arguments as double;
    String status = "";
    String comment = "";
    var statusColor = Colors.black;
    if (bmi < 18.5) {
      status = "UnderWeight ";
      comment = "شد حيلك وكل شوية ياعم الحاج";
      statusColor = Colors.blue;
    } else if (bmi > 18.5 && bmi < 24.9) {
      status = "Normal";
      comment = "جميل جدا حافظ على كدة اوعى";
      statusColor = Colors.green;
    } else if (bmi > 24.9 && bmi < 29.9) {
      status = "OverWeight ";
      comment = "خس شوية";

      statusColor = Colors.yellow;
    } else if (bmi > 29.9 && bmi < 34.9) {
      status = "Obese";
      comment = "خس شويتين ياعم متفتريش";
      statusColor = Colors.orange;
    } else {
      status = "Extremly Obese";
      comment = "روح إعمل تكميم أو فجر نفسك";
      statusColor = Colors.red;
    }
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 224, 224),
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            color: Color(0xFF081853),
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 231, 224, 224),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your Result",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6d63ff),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              margin: EdgeInsets.all(10),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    status,
                    style: TextStyle(
                        fontSize: 30,
                        color: statusColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${double.parse(bmi.toStringAsFixed(1))}",
                    style: TextStyle(
                        color: Color(0xFF6d63ff),
                        fontSize: 80,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    comment,
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF6d63ff),
                        fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
            minWidth: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Color(0xFF6d63ff),
            shape: RoundedRectangleBorder(),
            child: Text(
              "Re-Calculate BMI",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

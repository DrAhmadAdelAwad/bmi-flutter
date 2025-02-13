import 'package:flutter/material.dart';

void main() {
  runApp(const Bmi());
}

class Bmi extends StatelessWidget {
  const Bmi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Screen1(),
    );
  }
}

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  double value = 100;
  int w = 70;
  int a = 20;
  int minAge = 18;
  int maxAge = 100;
  int minWeight = 50;
  int maxWeight = 350;
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = 'Male';
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: selectedGender == 'Male'
                              ? Color(0xFF081853)
                              : Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male_rounded,
                              size: 80,
                              color: selectedGender == "Male"
                                  ? Colors.white
                                  : Color(0xFF6d63ff),
                            ),
                            Text(
                              'Male',
                              style: TextStyle(
                                fontSize: 20,
                                color: selectedGender == "Male"
                                    ? Colors.white
                                    : Color(0xFF6d63ff),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = 'Female';
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: selectedGender == 'Female'
                              ? Colors.pinkAccent
                              : Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female_rounded,
                              size: 80,
                              color: selectedGender == "Female"
                                  ? Colors.white
                                  : Color(0xFF6d63ff),
                            ),
                            Text(
                              'Female',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: selectedGender == "Female"
                                      ? Colors.white
                                      : Color(0xFF6d63ff)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height",
                    style: TextStyle(fontSize: 20, color: Color(0xFF6d63ff)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text("${value.round()}",
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Color(
                                0xFF6d63ff,
                              ))),
                      Text(" Cm",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(
                                0xFF6d63ff,
                              ))),
                    ],
                  ),
                  Slider(
                    activeColor: Color(0xFF6d63ff),
                    inactiveColor: Color(0xFFf4f3ff),
                    value: value,
                    onChanged: (double x) {
                      setState(() {
                        value = x;
                      });
                    },
                    min: 100,
                    max: 250,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Weight",
                            style: TextStyle(
                                fontSize: 20, color: Color(0xFF6d63ff)),
                          ),
                          Text("$w",
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Color(
                                    0xFF6d63ff,
                                  ))),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                mini: true,
                                shape: StadiumBorder(),
                                backgroundColor: Color(0xFF081853),
                                onPressed: () {
                                  setState(() {
                                    w < maxWeight ? w++ : w;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 8),
                              FloatingActionButton(
                                backgroundColor: Color(0xFF081853),
                                mini: true,
                                shape: StadiumBorder(),
                                onPressed: () {
                                  setState(() {
                                    w > minWeight ? w-- : w;
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Age",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(
                                  0xFF6d63ff,
                                )),
                          ),
                          Text("$a",
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF6d63ff))),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                mini: true,
                                shape: StadiumBorder(),
                                backgroundColor: Color(0xFF081853),
                                onPressed: () {
                                  setState(() {
                                    a < maxAge ? a++ : a;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 8),
                              FloatingActionButton(
                                mini: true,
                                shape: StadiumBorder(),
                                backgroundColor: Color(0xFF081853),
                                onPressed: () {
                                  setState(() {
                                    a > minAge ? a-- : a;
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
            minWidth: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10),
            onPressed: () {},
            color: Color(0xFF6d63ff),
            shape: RoundedRectangleBorder(),
            child: Text(
              "Calculate BMI",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

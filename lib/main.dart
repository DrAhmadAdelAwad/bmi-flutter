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
  int w = 50;
  int a = 18;
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
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
                              ? Colors.blueAccent
                              : Colors.indigo,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male_rounded,
                              size: 80,
                              color: Colors.white,
                            ),
                            Text(
                              'Male',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
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
                              : Colors.pink,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female_rounded,
                              size: 80,
                              color: Colors.white,
                            ),
                            Text(
                              'Female',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
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
                color: Colors.deepOrange,
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text("${value.round()} Cm",
                      style: TextStyle(fontSize: 40, color: Colors.white)),
                  Slider(
                    activeColor: Colors.green,
                    inactiveColor: Colors.white,
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
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Weight",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Text("$w",
                              style:
                                  TextStyle(fontSize: 40, color: Colors.white)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                mini: true,
                                shape: StadiumBorder(),
                                backgroundColor: Colors.white,
                                onPressed: () {
                                  setState(() {
                                    w += 1;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  size: 30,
                                  color: Colors.red,
                                ),
                              ),
                              SizedBox(width: 8),
                              FloatingActionButton(
                                backgroundColor: Colors.white,
                                mini: true,
                                shape: StadiumBorder(),
                                onPressed: () {
                                  setState(() {
                                    w -= 1;
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  size: 30,
                                  color: Colors.red,
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
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Age",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Text("$a",
                              style:
                                  TextStyle(fontSize: 40, color: Colors.white)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                mini: true,
                                shape: StadiumBorder(),
                                backgroundColor: Colors.white,
                                onPressed: () {
                                  setState(() {
                                    a += 1;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  size: 30,
                                  color: Colors.red,
                                ),
                              ),
                              SizedBox(width: 8),
                              FloatingActionButton(
                                mini: true,
                                shape: StadiumBorder(),
                                backgroundColor: Colors.white,
                                onPressed: () {
                                  setState(() {
                                    a -= 1;
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  size: 30,
                                  color: Colors.red,
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
            color: Colors.teal,
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

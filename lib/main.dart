import 'package:bmi/screens/bmi_result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Bmi());
}

class Bmi extends StatelessWidget {
  const Bmi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "result_screen": (context) => ResultScreen(),
      },
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
  var num1 = TextEditingController();
  var num2 = TextEditingController();
  var result = 0.0;
  int w = 70;
  int a = 20;
  int minAge = 18;
  int maxAge = 100;
  int minWeight = 50;
  int maxWeight = 350;
  double bmi = 0.0;
  String? selectedGender;
  int currentIndex = 0;
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.boy_rounded),
      label: 'BMI',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.calculate),
      label: 'Calculator',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Login',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> views = [
      Column(
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
                              fontSize: 40,
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
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color(
                                    0xFF6d63ff,
                                  ))),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: null,
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
                                  size: 25,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 8),
                              FloatingActionButton(
                                heroTag: null,
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
                                  size: 25,
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
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF6d63ff))),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: null,
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
                                  size: 25,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 8),
                              FloatingActionButton(
                                heroTag: null,
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
                                  size: 25,
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
            onPressed: () {
              setState(() {
                bmi = w / ((value / 100) * (value / 100));

                Navigator.pushNamed(context, "result_screen", arguments: bmi);
              });
            },
            color: Color(0xFF6d63ff),
            shape: RoundedRectangleBorder(),
            child: Text(
              "Calculate BMI",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
        ],
      ),
      Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: Colors.teal,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: num1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(5)),
                        label: Text(
                          "Num 1",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: num2,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(5)),
                        label: Text(
                          "Num 2",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 20,
                    color: Colors.teal,
                  ),
                  Text(
                    "Result = ${result.toStringAsFixed(1)}",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 20,
                    color: Colors.teal,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.teal,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              double num1Value =
                                  double.tryParse(num1.text) ?? 0;
                              double num2Value =
                                  double.tryParse(num2.text) ?? 0;
                              result = num1Value + num2Value;
                              num1.clear();
                              num2.clear();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding:
                                EdgeInsets.all(6), // Adjust padding for size
                            backgroundColor: Colors.white, // Background color
                          ),
                          child: Text(
                            "+",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.teal,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              double num1Value =
                                  double.tryParse(num1.text) ?? 0;
                              double num2Value =
                                  double.tryParse(num2.text) ?? 0;
                              result = num1Value - num2Value;
                              num1.clear();
                              num2.clear();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding:
                                EdgeInsets.all(6), // Adjust padding for size
                            backgroundColor: Colors.white, // Background color
                          ),
                          child: Text(
                            "-",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.teal,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              double num1Value =
                                  double.tryParse(num1.text) ?? 0;
                              double num2Value =
                                  double.tryParse(num2.text) ?? 0;
                              result = num1Value * num2Value;
                              num1.clear();
                              num2.clear();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding:
                                EdgeInsets.all(6), // Adjust padding for size
                            backgroundColor: Colors.white, // Background color
                          ),
                          child: Text(
                            "×",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.teal,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              double num1Value =
                                  double.tryParse(num1.text) ?? 0;
                              double num2Value =
                                  double.tryParse(num2.text) ?? 1;
                              result =
                                  num2Value != 0 ? num1Value / num2Value : 0;
                              num1.clear();
                              num2.clear();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding:
                                EdgeInsets.all(6), // Adjust padding for size
                            backgroundColor: Colors.white, // Background color
                          ),
                          child: Text(
                            "÷",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.teal,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      Container(
        color: Color(0xFFe85b00),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              height: 150,
              width: double.infinity,
              color: Color(0xFFe85b00),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 40,
                      color: Color(0xFFf5dabb),
                    ),
                  ),
                  Text("Welcome Back",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFf5dabb),
                      ))
                ],
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Material(
                    elevation: 0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFe85b00).withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                              ),
                              prefixIcon: Icon(Icons.email,
                                  size: 20, color: Color(0xFFe85b00)),
                              labelText: "Email or Phone Number",
                              labelStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.key,
                                  size: 20, color: Color(0xFFe85b00)),
                              suffixIcon: Icon(Icons.visibility,
                                  size: 20, color: Color(0xFFe85b00)),
                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "Forgot Password ?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                      backgroundColor: Color(0xFFe85b00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "Continue with Social Media",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(120, 50),
                          backgroundColor: Color(0xFF2196f1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Facebook",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(120, 50),
                          backgroundColor: Color(0xFF000000),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "GitHub",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 224, 224),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: currentIndex,
        selectedItemColor: Color(0xFF081853),
        unselectedItemColor: Color(0xFF6d63ff),
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      appBar: currentIndex == 0
          ? AppBar(
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
            )
          : null, // No AppBar for the last two views
      extendBodyBehindAppBar:
          currentIndex != 0, // Allow body to extend behind AppBar
      body: views[currentIndex],
    );
  }
}

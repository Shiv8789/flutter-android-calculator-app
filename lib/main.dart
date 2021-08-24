import 'package:flutter/material.dart';
import './widgets/button.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      debugShowCheckedModeBanner: false,
      home: CalculatorHome(),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  CalculatorHome({Key? key}) : super(key: key);

  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String history = "";
  String input = "";

  void setinput(String c) {
    if (input.length > 35) {
      setState(() {
        input = "";
      });
    } else {
      setState(() {
        input += c;
      });
    }
  }

  void calc(String s) {
    String lchar = input[input.length - 1];

    if (lchar == "+" ||
        lchar == "-" ||
        lchar == "*" ||
        lchar == "/" ||
        lchar == "%") {
      setState(() {
        history = "";
        input = "Invalid Input   ";
      });
    } else {
      Parser p = Parser();
      Expression exp = p.parse(input);
      ContextModel cm = ContextModel();
      double ans = exp.evaluate(EvaluationType.REAL, cm);
      if (ans.isInfinite || ans.isNaN) {
        setState(() {
          history = "";
          input = "Error   ";
        });
      } else {
        if (input.contains("/") || input.contains("*")) {
          setState(() {
          history = input;
         // int ans1 = ans.toInt();
          input = ans.toString();
        });
        } else {
          setState(() {
            history = input;
            int ans1 = ans.toInt();
            input = ans1.toString();
          });
        }
      }
    }
  }

  void back(String s) {
    if (input.length > 0) {
      int l = input.length;
      setState(() {
        input = input.substring(0, l - 1);
      });
    }
  }

  void cleardata(String s) {
    setState(() {
      history = "";
      input = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Calculator',
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.4),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue[600],
        ),
        body: Center(
          child: Container(
            color: Colors.grey[900],
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white10,
                    ),
                    child: Text(
                      history,
                      style: TextStyle(
                          color: Colors.white30,
                          fontSize: 30,
                          fontWeight: FontWeight.w400),
                    )),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white70,
                    ),
                    child: Text(
                      input,
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    )),
                SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Cbutton(
                          num: "AC",
                          setinput: cleardata,
                        ),
                        Cbutton(
                          num: "<-",
                          setinput: back,
                        ),
                        Cbutton(
                          num: "%",
                          setinput: setinput,
                        ),
                        Cbutton(
                          num: "/",
                          setinput: setinput,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Cbutton(
                          num: "7",
                          setinput: setinput,
                        ),
                        Cbutton(
                          num: "8",
                          setinput: setinput,
                        ),
                        Cbutton(
                          num: "9",
                          setinput: setinput,
                        ),
                        Cbutton(
                          num: "*",
                          setinput: setinput,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Cbutton(
                          num: "4",
                          setinput: setinput,
                        ),
                        Cbutton(
                          num: "5",
                          setinput: setinput,
                        ),
                        Cbutton(
                          num: "6",
                          setinput: setinput,
                        ),
                        Cbutton(
                          num: "-",
                          setinput: setinput,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Cbutton(
                          num: "1",
                          setinput: setinput,
                        ),
                        Cbutton(
                          num: "2",
                          setinput: setinput,
                        ),
                        Cbutton(
                          num: "3",
                          setinput: setinput,
                        ),
                        Cbutton(
                          num: "+",
                          setinput: setinput,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Cbutton(
                          num: "0",
                          setinput: setinput,
                        ),
                        Cbutton(
                          num: "00",
                          setinput: setinput,
                        ),
                        Cbutton(
                          num: ".",
                          setinput: setinput,
                        ),
                        Cbutton(
                          num: "=",
                          setinput: calc,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

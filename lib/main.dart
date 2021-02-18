import 'package:Calculator/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = '';
  var userAnswer = '';
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userQuestion,
                      style: TextStyle(fontSize: 21, color: Colors.white),
                    ),
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        userAnswer,
                        style: TextStyle(fontSize: 21, color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Center(
                  child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return MyButton(
                      /* Delete the input*/
                      buttonTapped: () {
                        setState(() {
                          userQuestion = "";
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.red[400],
                      textColor: Colors.white,
                    );
                  }
                  if (index == 1) {
                    return MyButton(
                      buttonTapped: () {
                        /* Delete the last thing in the string*/
                        setState(() {
                          if (userQuestion.length > 0)
                            userQuestion = userQuestion.substring(
                                0, userQuestion.length - 1);
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.deepPurple,
                      textColor: Colors.white,
                    );
                  }
                  return MyButton(
                      buttonTapped: buttons[index] == '='
                          ? () {}
                          : () {
                              setState(() {
                                userQuestion += buttons[index];
                              });
                            },
                      buttonText: buttons[index],
                      color: isOperator(buttons[index])
                          ? Colors.deepPurple
                          : Colors.deepPurple[50],
                      textColor: isOperator(buttons[index])
                          ? Colors.white
                          : Colors.deepPurple);
                },
              )),
            ),
          )
        ],
      ),
    );
  }

  bool isOperator(String x) {
    try {
      int.parse(x);
      return false;
    } on Exception catch (_) {
      return true;
    }
  }
}

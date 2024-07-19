import 'package:calculator/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.8),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    children: [
                      Text(
                        userInput.toString(),
                        style:
                            const TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      Text(
                        answer.toString(),
                        style: const TextStyle(
                            fontSize: 40, color: Colors.white30),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                          title: 'AC',
                          color: Colors.grey,
                          onPress: () {
                            userInput = '';
                            answer = '';
                            setState(
                              () {},
                            );
                          },
                        ),
                        MyButton(
                          title: '+/-',
                          color: Colors.grey,
                          onPress: () {
                            userInput += '+/-';
                            setState(
                              () {},
                            );
                          },
                        ),
                        MyButton(
                          title: '%',
                          color: Colors.grey,
                          onPress: () {
                            userInput += '%';
                            setState(
                              () {},
                            );
                          },
                        ),
                        MyButton(
                          title: '/',
                          color: Colors.orange,
                          onPress: () {
                            userInput += '/';
                            setState(
                              () {},
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '7',
                          color: Colors.grey,
                          onPress: () {
                            userInput += '7';
                            setState(
                              () {},
                            );
                          },
                        ),
                        MyButton(
                          title: '8',
                          color: Colors.grey,
                          onPress: () {
                            userInput += '8';
                            setState(
                              () {},
                            );
                          },
                        ),
                        MyButton(
                          title: '9',
                          color: Colors.grey,
                          onPress: () {
                            userInput += '9';
                            setState(
                              () {},
                            );
                          },
                        ),
                        MyButton(
                          title: 'x',
                          color: Colors.orange,
                          onPress: () {
                            userInput += 'x';
                            setState(
                              () {},
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '4',
                          color: Colors.grey,
                          onPress: () {
                            userInput += '4';
                            setState(
                              () {},
                            );
                          },
                        ),
                        MyButton(
                          title: '5',
                          color: Colors.grey,
                          onPress: () {
                            userInput += '5';
                            setState(
                              () {},
                            );
                          },
                        ),
                        MyButton(
                          title: '6',
                          color: Colors.grey,
                          onPress: () {
                            userInput += '6';
                            setState(
                              () {},
                            );
                          },
                        ),
                        MyButton(
                          title: '-',
                          color: Colors.orange,
                          onPress: () {
                            userInput += '-';
                            setState(
                              () {},
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '1',
                          color: Colors.grey,
                          onPress: () {
                            userInput += '1';
                            setState(
                              () {},
                            );
                          },
                        ),
                        MyButton(
                          title: '2',
                          color: Colors.grey,
                          onPress: () {
                            userInput += '2';
                            setState(
                              () {},
                            );
                          },
                        ),
                        MyButton(
                          title: '3',
                          color: Colors.grey,
                          onPress: () {
                            userInput += '3';
                            setState(
                              () {},
                            );
                          },
                        ),
                        MyButton(
                          title: '+',
                          color: Colors.orange,
                          onPress: () {
                            userInput += '+';
                            setState(
                              () {},
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '0',
                          color: Colors.grey,
                          onPress: () {
                            userInput += '0';
                            setState(
                              () {},
                            );
                          },
                        ),
                        MyButton(
                          title: '.',
                          color: Colors.grey,
                          onPress: () {
                            userInput += '.';
                            setState(
                              () {},
                            );
                          },
                        ),
                        MyButton(
                          title: 'DEL',
                          color: Colors.grey,
                          onPress: () {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                            setState(
                              () {},
                            );
                          },
                        ),
                        MyButton(
                          title: '=',
                          color: Colors.orange,
                          onPress: () {
                            equalPres();
                            setState(
                              () {},
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  void equalPres() {
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}

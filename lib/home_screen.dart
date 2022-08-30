// ignore_for_file: camel_case_types, avoid_print

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'components/my_button.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  var input = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        input.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      answer.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        myButton(
                            textofbutton: 'AC',
                            onpressevent: () {
                              input = '';
                              answer = '';
                              setState(() {});
                            }),
                        myButton(
                            textofbutton: '+/-',
                            onpressevent: () {
                              input += '+/-';
                              setState(() {});
                            }),
                        myButton(
                            textofbutton: '%',
                            onpressevent: () {
                              input += '%';
                              setState(() {});
                            }),
                        myButton(
                            textofbutton: '/',
                            buttoncolor: Colors.yellow.shade900,
                            onpressevent: () {
                              input += '/';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        myButton(
                            textofbutton: '7',
                            onpressevent: () {
                              input += '7';
                              setState(() {});
                            }),
                        myButton(
                            textofbutton: '8',
                            onpressevent: () {
                              input += '8';
                              setState(() {});
                            }),
                        myButton(
                            textofbutton: '9',
                            onpressevent: () {
                              input += '9';
                              setState(() {});
                            }),
                        myButton(
                            textofbutton: '+',
                            buttoncolor: Colors.yellow.shade900,
                            onpressevent: () {
                              input += '+';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        myButton(
                            textofbutton: '4',
                            onpressevent: () {
                              input += '4';
                              setState(() {});
                            }),
                        myButton(
                            textofbutton: '5',
                            onpressevent: () {
                              input += '5';
                              setState(() {});
                            }),
                        myButton(
                            textofbutton: '6',
                            onpressevent: () {
                              input += '6';
                              setState(() {});
                            }),
                        myButton(
                            textofbutton: '-',
                            buttoncolor: Colors.yellow.shade900,
                            onpressevent: () {
                              input += '-';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        myButton(
                            textofbutton: '1',
                            onpressevent: () {
                              input += '1';
                              setState(() {});
                            }),
                        myButton(
                            textofbutton: '2',
                            onpressevent: () {
                              input += '2';
                              setState(() {});
                            }),
                        myButton(
                            textofbutton: '3',
                            onpressevent: () {
                              input += '3';
                              setState(() {});
                            }),
                        myButton(
                            textofbutton: 'x',
                            buttoncolor: Colors.yellow.shade900,
                            onpressevent: () {
                              input += 'x';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        myButton(
                            textofbutton: '0',
                            onpressevent: () {
                              input += '0';
                              setState(() {});
                            }),
                        myButton(
                            textofbutton: '.',
                            onpressevent: () {
                              input += '.';
                              setState(() {});
                            }),
                        myButton(
                            textofbutton: 'DEL',
                            onpressevent: () {
                              input = input.substring(0, input.length - 1);
                              setState(() {});
                            }),
                        myButton(
                            textofbutton: '=',
                            buttoncolor: Colors.yellow.shade900,
                            onpressevent: () {
                              equalbutton();
                              setState(() {});
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ));
  }

  void equalbutton() {
    String finalinput = input;
    finalinput = input.replaceAll('x', '*'); //to replace 'x' with '*'.
    Parser p = Parser();
    Expression expression = p.parse(finalinput);
    ContextModel contextModel = ContextModel();

    double evaluate = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = evaluate.toString();
  }
}

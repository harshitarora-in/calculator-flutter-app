import 'package:calculator/widget/calckey.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculator/constants.dart';
//import 'dart:math';

class Calc extends StatefulWidget {
  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  String expression = '';
  String result = '0.0';
  bool addDecimal = true;
  var exp1 = '0';
  var exp2 = '0';
  List expList = [];
  onButtonTap(value) {
    setState(() {
      expression = expression + value;
    });
  }

  void calculate() {
    if (expression.contains('+')) {
      expList = expression.split('+');
      exp1 = expList[0];
      exp2 = expList[1];
      double addedValue = double.parse(exp1) + double.parse(exp2);
      var calculatedValue = addedValue.toString();
      setState(() {
        result = calculatedValue;
      });
    } else if (expression.contains('-')) {
      expList = expression.split('-');
      exp1 = expList[0];
      exp2 = expList[1];
      double addedValue = double.parse(exp1) - double.parse(exp2);
      var calculatedValue = addedValue.toString();
      setState(() {
        result = calculatedValue;
      });
    } else if (expression.contains('x')) {
      expList = expression.split('x');
      exp1 = expList[0];
      exp2 = expList[1];
      double addedValue = double.parse(exp1) * double.parse(exp2);
      var calculatedValue = addedValue.toString();
      setState(() {
        result = calculatedValue;
      });
    } else if (expression.contains('÷')) {
      expList = expression.split('÷');
      exp1 = expList[0];
      exp2 = expList[1];
      double addedValue = double.parse(exp1) / double.parse(exp2);
      var calculatedValue = addedValue.toString();
      setState(() {
        result = calculatedValue;
      });
    }
  }

  bool chkOperator() {
    if ((!(expression.endsWith('-') ||
            expression.endsWith('+') ||
            expression.endsWith('÷') ||
            expression.endsWith('x'))) &&
        (expression != '') &&
        (!(expression.contains('-') ||
            expression.contains('+') ||
            expression.contains('÷') ||
            expression.contains('x')))) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: kThemeColor,
      ),
      body: Container(
        padding: EdgeInsets.only(right: 12.0, left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(expression, style: kSubheadingTextStyle),
            SizedBox(height: 30.0),
            Text(result, style: kHeadingTextStyle),
            SizedBox(height: 80.0),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                child: Column(
                  //column of keys vertically 7 4 1
                  children: [
                    CalcKey(
                        keyText: '7',
                        onKeyTap: () {
                          onButtonTap('7');
                        }),
                    CalcKey(
                        keyText: '4',
                        onKeyTap: () {
                          onButtonTap('4');
                        }),
                    CalcKey(
                        keyText: '1',
                        onKeyTap: () {
                          onButtonTap('1');
                        }),
                    CalcKey(
                        keyText: '.',
                        onKeyTap: () {
                          if (addDecimal == true) {
                            onButtonTap('.');
                            addDecimal = false;
                          }
                        }),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  //column of keys vertically 8 5 2 0
                  children: [
                    CalcKey(
                        keyText: '8',
                        onKeyTap: () {
                          onButtonTap('8');
                        }),
                    CalcKey(
                        keyText: '5',
                        onKeyTap: () {
                          onButtonTap('5');
                        }),
                    CalcKey(
                        keyText: '2',
                        onKeyTap: () {
                          onButtonTap('2');
                        }),
                    CalcKey(
                        keyText: '0',
                        onKeyTap: () {
                          onButtonTap('0');
                        })
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  //column of keys vertically 9 6 3 clear
                  children: [
                    CalcKey(
                        keyText: '9',
                        onKeyTap: () {
                          onButtonTap('9');
                        }),
                    CalcKey(
                        keyText: '6',
                        onKeyTap: () {
                          onButtonTap('6');
                        }),
                    CalcKey(
                        keyText: '3',
                        onKeyTap: () {
                          onButtonTap('3');
                        }),
                    SizedBox(height: 8.0),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if ((expression != '') && (expression.length > 1)) {
                              expression = expression.substring(
                                  0, expression.length - 1);
                            } else {
                              expression = '';
                              result = '0';
                            }
                          });
                        },
                        icon: Icon(
                          CupertinoIcons.arrow_left,
                          color: Colors.black54,
                          size: 32,
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Column(children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.deepPurple.shade100,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      //column of keys vertically % * - +
                      children: [
                        CalcKey(
                            keyText: '÷',
                            fontSize: 30,
                            onKeyTap: () {
                              if (chkOperator() == true) {
                                addDecimal = true;
                                onButtonTap('÷');
                              }
                            }),
                        CalcKey(
                            keyText: 'x',
                            fontSize: 28,
                            onKeyTap: () {
                              if (chkOperator() == true) {
                                addDecimal = true;
                                onButtonTap('x');
                              }
                            }),
                        CalcKey(
                            keyText: '-',
                            fontSize: 30,
                            onKeyTap: () {
                              if (chkOperator() == true) {
                                addDecimal = true;
                                onButtonTap('-');
                              }
                            }),
                        CalcKey(
                            keyText: '+',
                            fontSize: 30,
                            onKeyTap: () {
                              if (chkOperator() == true) {
                                addDecimal = true;
                                onButtonTap('+');
                              }
                            }),
                      ],
                    ),
                  ),
                  MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      child: Text(
                        '=',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      onPressed: () {
                        calculate();
                      },
                      color: kThemeColor)
                ]),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

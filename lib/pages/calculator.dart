import 'package:flutter/material.dart';
import 'dart:io';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String displayText = "";
  List<String> operatores = const ["+", "-", "/", "%", "x"];
  int countOperations = 0;
  final List<double> _bufferMemory = [0, 0];
  String? _operation;
  bool _usedOperation = false;
  String result = '';
  int bufferIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Card(
          margin:
              const EdgeInsets.only(top: 80, bottom: 80, left: 10, right: 10),
          color: const Color(0xFF3CA6A6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: const Color(0xFFeeffdb),
                        border: Border.all(
                          color: const Color(0xFF6bb39b),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        displayText,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  createButton(
                      elementButton: "AC",
                      colorButton: const Color(0xFF012E40),
                      paddingLeft: 10),
                  createButton(
                      elementButton: "%", colorButton: const Color(0xFF012E40)),
                  createButton(
                      elementButton: "/", colorButton: const Color(0xFF012E40)),
                  createButton(
                      elementButton: "delet",
                      colorButton: Colors.red,
                      paddingRight: 10,
                      fontSize: 30),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  createButton(
                      elementButton: "7",
                      colorButton: const Color(0xFF71dbd2),
                      paddingLeft: 10),
                  createButton(
                      elementButton: "8", colorButton: const Color(0xFF71dbd2)),
                  createButton(
                      elementButton: "9", colorButton: const Color(0xFF71dbd2)),
                  createButton(
                      elementButton: "+",
                      colorButton: const Color(0xFF012E40),
                      paddingRight: 10,
                      fontSize: 30),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  createButton(
                      elementButton: "4",
                      colorButton: const Color(0xFF71dbd2),
                      paddingLeft: 10),
                  createButton(
                      elementButton: "5", colorButton: const Color(0xFF71dbd2)),
                  createButton(
                      elementButton: "6", colorButton: const Color(0xFF71dbd2)),
                  createButton(
                      elementButton: "-",
                      colorButton: const Color(0xFF012E40),
                      paddingRight: 10,
                      fontSize: 30),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  createButton(
                      elementButton: "1",
                      colorButton: const Color(0xFF71dbd2),
                      paddingLeft: 10),
                  createButton(
                      elementButton: "2", colorButton: const Color(0xFF71dbd2)),
                  createButton(
                      elementButton: "3", colorButton: const Color(0xFF71dbd2)),
                  createButton(
                      elementButton: "x",
                      colorButton: const Color(0xFF012E40),
                      paddingRight: 10,
                      fontSize: 30),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  createButton(
                      elementButton: "0",
                      colorButton: const Color(0xFF71dbd2),
                      paddingLeft: 10,
                      paddingBottom: 20),
                  createButton(
                    elementButton: "00",
                    colorButton: const Color(0xFF71dbd2),
                    paddingBottom: 20,
                  ),
                  createButton(
                    elementButton: ".",
                    colorButton: const Color(0xFF71dbd2),
                    paddingBottom: 20,
                  ),
                  createButton(
                      elementButton: "=",
                      colorButton: const Color(0xFF012E40),
                      paddingRight: 10,
                      fontSize: 30,
                      paddingBottom: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateDisplay({required String contentButton}) {
    setState(() {
      displayText += contentButton;
      result += contentButton;
    });
  }

  void clearDisplay() {
    setState(() {
      displayText = "";
      countOperations = 0;
      _usedOperation = false;
      result = '';
      bufferIndex = 0;
      _bufferMemory.setAll(0, [0, 0]);
    });
  }

  void lastDelete() {
    setState(() {
      if (operatores.contains(displayText[displayText.length - 1])) {
        countOperations = 0;
      }
      displayText = displayText.substring(0, displayText.length - 1);
    });
  }

  void setOperation(String operation) {
    if (displayText.isNotEmpty && countOperations < 1) {
      setState(() {
        displayText += operation;
        countOperations++;
        _bufferMemory[bufferIndex] = double.parse(result);
        _usedOperation = true;
        _operation = operation;
        bufferIndex = 1;
        result = '';
      });
    }
  }

  //Calculo do resultado
  void viewResultDisplay() {
    if (result == '' || _usedOperation == false) return;
    _bufferMemory[bufferIndex] = double.parse(result);
    setState(() {
      if (_operation == "+") {
        displayText = (_bufferMemory[0] + _bufferMemory[1]).toString();
      } else if (_operation == '-') {
        displayText = (_bufferMemory[0] - _bufferMemory[1]).toString();
      } else if (_operation == '/' && _bufferMemory[1] != 0) {
        displayText = (_bufferMemory[0] / _bufferMemory[1]).toString();
      } else if (_operation == '*') {
        displayText = (_bufferMemory[0] * _bufferMemory[1]).toString();
      } else {
        displayText = (_bufferMemory[0] % _bufferMemory[1]).toString();
      }
    });
  }

  void applyCommand(String command) {
    if (command == "ac") {
      clearDisplay();
    } else if (command == "delet") {
      lastDelete();
    } else if (operatores.contains(command)) {
      setOperation(command);
    } else if (command == '=') {
      viewResultDisplay();
    } else {
      updateDisplay(contentButton: command);
    }
  }

  Widget createButton(
      {required String elementButton,
      required Color colorButton,
      double? paddingLeft,
      double? paddingRight,
      double? paddingBottom,
      double? fontSize}) {
    return Padding(
      padding: EdgeInsets.only(
          left: paddingLeft ?? 0,
          right: paddingRight ?? 0,
          bottom: paddingBottom ?? 0),
      child: GestureDetector(
        onTap: (() {
          elementButton = elementButton.toLowerCase();
          applyCommand(elementButton);
        }),
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colorButton,
          ),
          child: Center(
            child: elementButton != "delet"
                ? Text(
                    elementButton,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize ?? 22,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                : const Icon(
                    Icons.delete_outline,
                    color: Colors.white,
                    size: 30,
                  ),
          ),
        ),
      ),
    );
  }
}

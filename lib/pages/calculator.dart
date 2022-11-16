import 'dart:io';

import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String displayText = "";
  List<String> operatores = ["+", "-", "/", "%", "x"];
  int countOperations = 0;

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

  void updateDisplay(String contentButton) {
    setState(() {
      if (operatores.any((element) => element == contentButton) &&
          countOperations < 1) {
        countOperations += 1;
        displayText += contentButton;
      } else if (!operatores.any((element) => element == contentButton)) {
        countOperations = 0;
        displayText += contentButton;
      }
    });
  }

  void clearDisplay() {
    setState(() {
      displayText = "";
    });
  }

  void lastDelete() {
    setState(() {
      displayText = displayText.substring(0, displayText.length - 1);
    });
  }

  //Calculo do resultado
  void viewResultDisplay() {}

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
          switch (elementButton) {
            case "ac":
              clearDisplay();
              break;
            case "delet":
              if (displayText.isNotEmpty) {
                lastDelete();
              }
              break;
            case "=":
              viewResultDisplay();
              break;
            default:
              updateDisplay(elementButton);
              break;
          }
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

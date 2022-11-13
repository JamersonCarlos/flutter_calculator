import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String displayText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          margin:
              const EdgeInsets.only(top: 100, bottom: 100, left: 10, right: 10),
          color: const Color(0xFFd0eaa3),
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
                      colorButton: const Color(0xFF1f6764),
                      paddingLeft: 10),
                  createButton(
                      elementButton: "%", colorButton: const Color(0xFF1f6764)),
                  createButton(
                      elementButton: "/", colorButton: const Color(0xFF1f6764)),
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
                      colorButton: const Color(0xFF1f6764),
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
                      colorButton: const Color(0xFF1f6764),
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
                      elementButton: "/",
                      colorButton: const Color(0xFF1f6764),
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
                      colorButton: const Color(0xFF1f6764),
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
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorButton,
        ),
        child: Center(
          child: Text(
            elementButton,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize ?? 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

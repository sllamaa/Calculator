import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget buttons(String btntxt, Color btncolor, Color txtcolor) {
    return SizedBox(
      height: 90,
      width: 90,
      child: ElevatedButton(
        onPressed: () {
          //Offset(30, -20);
          calculation(btntxt);
        },
        style: ElevatedButton.styleFrom(
          elevation: 15.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: btncolor,
          padding: EdgeInsets.all(10),
        ),
        child: Text(
          btntxt,
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final alttext = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? 'Dark Theme'
        : 'Light Theme';
    // ignore: prefer_ _ ructors
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Standard',
          style: TextStyle(color: Colors.white),
        ),
        leading: Icon(Icons.menu_rounded),
        backgroundColor: Colors.black,
        //actions: [],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //calculator dispaly
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            // ignore: prefer_ _literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  '$numOne $preOpr $numTwo',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.purple,
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            // ignore: prefer_ _literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  '$text',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 100,
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buttons('%', Colors.grey.shade300, Colors.black),
                      buttons('CE', Colors.grey.shade300, Colors.black),
                      buttons('AC', Colors.grey.shade300, Colors.black),
                      buttons('/', Colors.grey.shade300, Colors.black),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buttons('7', Colors.grey.shade300, Colors.black),
                      buttons('8', Colors.grey.shade300, Colors.black),
                      buttons('9', Colors.grey.shade300, Colors.black),
                      buttons('x', Colors.grey.shade300, Colors.black),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buttons('4', Colors.grey.shade300, Colors.black),
                      buttons('5', Colors.grey.shade300, Colors.black),
                      buttons('6', Colors.grey.shade300, Colors.black),
                      buttons('-', Colors.grey.shade300, Colors.black),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: 20),
                      buttons('1', Colors.grey.shade300, Colors.black),
                      SizedBox(width: 20),
                      buttons('2', Colors.grey.shade300, Colors.black),
                      SizedBox(width: 20),
                      buttons('3', Colors.grey.shade300, Colors.black),
                      SizedBox(width: 20),
                      buttons('+', Colors.grey.shade300, Colors.black),
                      SizedBox(width: 20),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buttons(' ', Colors.grey.shade300, Colors.black),
                      buttons('0', Colors.grey.shade300, Colors.black),
                      buttons('.', Colors.grey.shade300, Colors.black),
                      buttons('=', Colors.purple.shade300, Colors.black),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Calculator logic
  dynamic text = '0';
  double numOne = 0;
  double numOne2 = 0;
  double numTwo = 0;
  double numTwo2 = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';

  void calculation(btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numOne2 = 0;
      numTwo = 0;
      numTwo2 = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }
}

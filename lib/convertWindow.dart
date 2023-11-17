import 'package:flutter/material.dart';

import 'colors.dart';

var mera;
var firstUnit;
var secondUnit;

String firstNumber = "0";
String secondNumber = "0";
bool activeFirstNumber = true;

Color firstNumberColor = MyColors.textColorSelected;
Color secondNumberColor = MyColors.textColor;

class convertWindow extends StatefulWidget {
  convertWindow(var obj) {
    mera = obj;

    firstUnit = mera.units[0];
    secondUnit = mera.units[1];

    firstNumber = "0";
    secondNumber = "0";
    activeFirstNumber = true;
  }

  @override
  createState() => convertWindowState();
}

class convertWindowState extends State<convertWindow> {
  updateState() {
    setState(() {});
  }

  String updateResult(var number, var value1, var value2) {
    double a = value1 * double.parse(number);
    return (a / value2).toString();
  }

  void printNumber(String digit) {
    bool checkDot(String num) {
      if (num.isEmpty) return false;
      if (num.contains(".")) return false;

      return true;
    }

    if (activeFirstNumber) {
      if (digit == ".") {
        if (!checkDot(firstNumber)) return;
      } else if (firstNumber == "0") firstNumber = "";

      firstNumber = firstNumber + digit;
      secondNumber =
          updateResult(firstNumber, firstUnit.value, secondUnit.value);
    } else {
      if (digit == ".") {
        if (!checkDot(secondNumber)) return;
      } else if (secondNumber == "0") secondNumber = "";

      secondNumber = secondNumber + digit;
      firstNumber =
          updateResult(secondNumber, secondUnit.value, firstUnit.value);
    }

    updateState();
  }

  void deleteNumber() {
    if (activeFirstNumber && firstNumber.isNotEmpty) {
      firstNumber = firstNumber.substring(0, firstNumber.length - 1);

      if (firstNumber.isEmpty) firstNumber = "0";

      secondNumber =
          updateResult(firstNumber, firstUnit.value, secondUnit.value);
    } else if (!activeFirstNumber && secondNumber.isNotEmpty) {
      secondNumber = secondNumber.substring(0, secondNumber.length - 1);

      if (secondNumber.isEmpty) secondNumber = "0";

      firstNumber =
          updateResult(secondNumber, secondUnit.value, firstUnit.value);
    }
  }

  void reset() {
    firstNumber = "0";
    secondNumber = "0";
  }

  void changeUnit(var unit) {
    if (!activeFirstNumber) {
      secondUnit = unit;
      secondNumber =
          updateResult(firstNumber, firstUnit.value, secondUnit.value);
    } else {
      firstUnit = unit;
      firstNumber =
          updateResult(secondNumber, secondUnit.value, firstUnit.value);
    }

    Navigator.pop(context);
    updateState();
  }

  void changeColor() {
    if (activeFirstNumber){
      firstNumberColor = MyColors.textColorSelected;
      secondNumberColor = MyColors.textColor;
    }else {
      firstNumberColor = MyColors.textColor;
      secondNumberColor = MyColors.textColorSelected;
    }
  }

  void selectUnit() {
    List<SimpleDialogOption> options = [];

    for (int i = 0; i < mera.units.length; i++) {
      SimpleDialogOption option = SimpleDialogOption(
          onPressed: () {
            changeUnit(mera.units[i]);
          },
          child: Text(mera.units[i].name));
      options.add(option);
    }

    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text("Выберите величину"),
          children: options,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(mera.name),
        ),
        body: Column(
          children: [
            Flexible(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                    flex: 1,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                              child: Text(firstUnit.shortName + "▼", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: firstNumberColor)),
                              onTap: () {
                                selectUnit();
                                activeFirstNumber = true;
                                changeColor();
                                updateState();
                              })
                        ])),
                Flexible(
                    flex: 1,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              child: Text(firstNumber.toString(), style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: firstNumberColor)),
                              onTap: () {
                                activeFirstNumber = true;
                                changeColor();
                                updateState();
                              },
                            ),
                          )
                        ])),
              ],
            )),
            Flexible(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    flex: 1,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                              child: Text(secondUnit.shortName + "▼", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: secondNumberColor)),
                              onTap: () {
                                selectUnit();
                                activeFirstNumber = false;
                                changeColor();
                                updateState();
                              })
                        ])),
                Flexible(
                    flex: 1,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              child: Text(secondNumber.toString(), style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: secondNumberColor)),
                              onTap: () {
                                activeFirstNumber = false;

                                changeColor();
                                updateState();
                              },
                            ),
                          )
                        ])),
              ],
            )),
            Flexible(
                flex: 3,
                fit: FlexFit.loose,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                        flex: 1,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                                child: OutlinedButton(
                                    onPressed: () => {printNumber("1")},
                                    child: Text('1', style: Theme.of(context).textTheme.bodyLarge,))),
                            Expanded(
                                child: OutlinedButton(
                                    onPressed: () => {printNumber("2")},
                                    child: Text('2', style: Theme.of(context).textTheme.bodyLarge,))),
                            Expanded(
                                child: OutlinedButton(
                                    onPressed: () => {printNumber("3")},
                                    child: Text('3', style: Theme.of(context).textTheme.bodyLarge,))),
                            Expanded(
                                child: OutlinedButton(
                                    onPressed: () => {reset(), updateState()},
                                    child: Text('AC', style: Theme.of(context).textTheme.bodyLarge,))),
                          ],
                        )),
                    Flexible(
                        flex: 1,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                                child: OutlinedButton(
                                    onPressed: () => {printNumber("4")},
                                    child: Text('4', style: Theme.of(context).textTheme.bodyLarge,))),
                            Expanded(
                                child: OutlinedButton(
                                    onPressed: () => {printNumber("5")},
                                    child: Text('5', style: Theme.of(context).textTheme.bodyLarge,))),
                            Expanded(
                                child: OutlinedButton(
                                    onPressed: () => {printNumber("6")},
                                    child: Text('6', style: Theme.of(context).textTheme.bodyLarge,))),
                            Expanded(
                                child: OutlinedButton(
                                    onPressed: () =>
                                        {deleteNumber(), updateState()},
                                    child: Text('<', style: Theme.of(context).textTheme.bodyLarge,))),
                          ],
                        )),
                    Flexible(
                        flex: 1,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                                child: OutlinedButton(
                                    onPressed: () => {printNumber("7")},
                                    child: Text('7', style: Theme.of(context).textTheme.bodyLarge,))),
                            Expanded(
                                child: OutlinedButton(
                                    onPressed: () => {printNumber("8")},
                                    child: Text('8', style: Theme.of(context).textTheme.bodyLarge,))),
                            Expanded(
                                child: OutlinedButton(
                                    onPressed: () => {printNumber("9")},
                                    child: Text('9', style: Theme.of(context).textTheme.bodyLarge,))),
                            Expanded(
                                child: OutlinedButton(
                                    onPressed: () => {printNumber(".")},
                                    child: Text('.', style: Theme.of(context).textTheme.bodyLarge,))),
                          ],
                        )),
                    Flexible(
                        flex: 1,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(child: Container()),
                            Expanded(
                                child: OutlinedButton(
                                    onPressed: () => {printNumber("0")},
                                    child: Text('0', style: Theme.of(context).textTheme.bodyLarge,))),
                            Expanded(child: Container()),
                            Expanded(child: Container()),
                          ],
                        )),
                  ],
                ))
          ],
        ));
  }
}

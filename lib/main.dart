import 'package:converter/convertWindow.dart';
import 'package:converter/theme.dart';
import 'package:flutter/material.dart';

import 'dictionaries/unit.dart';

import 'dictionaries/area_units.dart';
import 'dictionaries/length_units.dart';
import 'dictionaries/mass_units.dart';
import 'dictionaries/data_units.dart';
import 'dictionaries/speed_units.dart';
import 'dictionaries/volume_units.dart';
import 'dictionaries/time_units.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.mainTheme,
      home: Scaffold(
        appBar: AppBar(title: const Text('Конвертер')),
        body: MyBody(),
      )));
}

class MyBody extends StatelessWidget {
  Widget build(BuildContext context) {
    return MyWidget();
  }
}

class MyWidget extends StatefulWidget {
  @override
  createState() => MyWidgetState();
}

class MyWidgetState extends State<MyWidget> {
  updateState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Flexible(
          child: Column(
        children: [
          Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  
                  Expanded(
                    
                      child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return convertWindow(
                                      Unit(lengthUnits, "Длина"));
                                },
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Image.asset("lib/icons/length.png"),
                          Text("Длина",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: Colors.black)),
                            ],
                          ))),
                  
                  Expanded(
                    
                      child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return convertWindow(
                                      Unit(massUnits, "Масса"));
                                },
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Image.asset("lib/icons/weight.png"),
                          Text("Масса",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: Colors.black)),
                            ],
                          ))),
                  
                  Expanded(
                    
                      child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return convertWindow(
                                      Unit(areaUnits, "Площадь"));
                                },
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Image.asset("lib/icons/area.png"),
                          Text("Площадь",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: Colors.black)),
                            ],
                          ))),
                  
                ],
              )),
          
          Flexible(
              
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  
                  Expanded(
                    
                      child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return convertWindow(
                                      Unit(dataUnits, "Данные"));
                                },
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Image.asset("lib/icons/data.png"),
                          Text("Данные",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: Colors.black)),
                            ],
                          ))),
                  
                  Expanded(
                    
                      child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return convertWindow(
                                      Unit(speedUnits, "Скорость"));
                                },
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Image.asset("lib/icons/speed.png"),
                          Text("Скорость",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: Colors.black)),
                            ],
                          ))),
                  
                  Expanded(
                    
                      child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return convertWindow(
                                      Unit(volumeUnits, "Объем"));
                                },
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Image.asset("lib/icons/volume.png"),
                          Text("Объем",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: Colors.black)),
                            ],
                          ))),
                  
                ],
              )),
          
          Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                    flex: 1,
                      fit: FlexFit.tight,
                      child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return convertWindow(
                                      Unit(timeUnits, "Время"));
                                },
                              ),
                            );
                          },
                          style: Theme.of(context).outlinedButtonTheme.style,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Image.asset("lib/icons/time.png"),
                          Text("Время",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: Colors.black)),
                            ],
                          ))),
                  Expanded(flex: 2,child: Container()),
                ],
              )),
        ],
      )),
    ]);
  }
}

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<homePage> {
  Timer? timer;
  bool isplaying = false;
  int hours = 0;
  int minuts = 0;
  int secunds = 0;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Cronômetro")),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("$hours : $minuts : $secunds",
                      style: TextStyle(color: Colors.black, fontSize: 70)),
                  Container(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 50,
                        child: button(Icons.play_arrow, "play"),
                      ),
                      Container(
                        width: 100,
                      ),
                      SizedBox(
                          width: 100,
                          height: 50,
                          child: button(Icons.pause, "pause")),
                      Container(
                        width: 100,
                      ),
                      SizedBox(
                          width: 100,
                          height: 50,
                          child: button(Icons.stop, "stop"))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  FloatingActionButton button(IconData button, String isplay) {
    return FloatingActionButton(
        onPressed: () {
          switch (isplay) {
            case "play":
              isplaying = true;
                Timer.periodic(Duration(seconds: 1), (Timer) {
      setState(() {
        if (isplaying) {
          if (secunds < 59) {
            secunds++;
          } else if (secunds == 59) {
            if (minuts == 60) {
              hours++;
              minuts = 0;
            } else {
              minuts++;
            }
            secunds = 0;
          }
        }
      });
    });
              break;
            case "pause":
              isplaying = false;
              break;
            case "stop":
              isplaying = false;
              setState(() {
                secunds = 0;
                minuts = 0;
                hours = 0;
              });
          }
          ;
        },
        child: Icon(button));
  }
}

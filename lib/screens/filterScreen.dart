// import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:project/main.dart';
import '../function/themeColor.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class FilterScreen extends StatefulWidget {
  FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBlack,
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
              height: 100,
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Container(
                              width: 65,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 4),
                                child: Text(
                                  'high',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'comic',
                                      fontSize: 20,
                                      color: rBlack),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: rWhite),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Container(
                              width: 65,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 4),
                                child: Text(
                                  'low',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'comic',
                                      fontSize: 20,
                                      color: rBlack),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: rWhite),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Container(
                              width: 120,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 4, top: 3),
                                child: Text(
                                  'this week',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'comic',
                                      fontSize: 20,
                                      color: rBlack),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: rWhite),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Container(
                              width: 120,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 4),
                                child: Text(
                                  'pic date',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'comic',
                                      fontSize: 20,
                                      color: rBlack),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: rWhite),
                            ))
                      ],
                    ),
                  )
                ],
              )),
        )
      ]),
    );
  }
}

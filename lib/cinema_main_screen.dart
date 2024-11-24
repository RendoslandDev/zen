// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zen/constant.dart';
import 'package:zen/home_page.dart';

class CinemaMainScreen extends StatefulWidget {
  const CinemaMainScreen({super.key});

  @override
  State<CinemaMainScreen> createState() => _CinemaMainScreenState();
}

class _CinemaMainScreenState extends State<CinemaMainScreen> {
  List<IconData> bottomIcons = [
    Icons.home_max_outlined,
    CupertinoIcons.compass_fill,
    CupertinoIcons.ticket_fill,
    Icons.person_rounded
  ];

  int currentIndex = 0;
  late final List<Widget> pages;
  @override
  void initState() {
    super.initState();
    pages = [
      const HomePage(),
      navBarPage(CupertinoIcons.compass_fill),
      navBarPage(CupertinoIcons.ticket_fill),
      navBarPage(Icons.person_rounded),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              bottomIcons.length,
              (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: Stack(
                      children: [
                        AnimatedContainer(
                          duration: Duration(microseconds: 200),
                          height: currentIndex == index ? 25 : 0,
                          width: currentIndex == index ? 25 : 0,
                          decoration:
                              BoxDecoration(shape: BoxShape.circle, boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.1),
                              spreadRadius: currentIndex == index ? 10 : 0,
                              blurRadius: currentIndex == index ? 10 : 0,
                            )
                          ]),
                        ),
                        Icon(
                          bottomIcons[index],
                          color: currentIndex == index
                              ? Colors.white
                              : Colors.white.withOpacity(0.3),
                        ),
                      ],
                    ),
                  )),
        ),
      ),
      body: pages[currentIndex],
    );
  }

  navBarPage(IconName) {
    return Center(child: Icon(IconName, size: 100, color: Colors.white));
  }
}

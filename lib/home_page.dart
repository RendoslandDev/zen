// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zen/categories_model.dart';
import 'package:zen/constant.dart';
import 'package:zen/detail_page.dart';
import 'package:zen/movie_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController controller;
  double pageOffset = 1;
  int currentIndex = 1;

  @override
  void initState() {
    controller = PageController(
      initialPage: 1,
      viewportFraction: 0.6,
    )..addListener(() {
        setState(() {
          pageOffset = controller.page!;
        });
      });
    super.initState();
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: headerParts(),
      body: Column(
        children: [
          SizedBox(height: 35),
          searchField(),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Category",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            "see all",
                            style: TextStyle(
                                color: buttonColor,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: buttonColor,
                            size: 15,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 17),
                categoryItem(),
                SizedBox(height: 40),
              ],
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Showing this month",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800),
                ),
              ),
              SizedBox(height: 40),
              Expanded(
                  child: Stack(
                alignment: Alignment.center,
                children: [
                  PageView.builder(
                      controller: controller,
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index % movies.length;
                        });
                      },
                      itemBuilder: (context, index) {
                        double scale = max(
                          0.6,
                          (1 - (pageOffset - index).abs() + 0.6),
                        );
                        double angle = (controller.position.haveDimensions
                                ? index.toDouble() - (controller.page ?? 0)
                                : index.toDouble() - 1) *
                            5;
                        angle = angle.clamp(-5, 5);
                        final movie = movies[index % movies.length];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => MovieDetailPage(
                                          movie: movie,
                                        )));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 100 - (scale / 1.6 * 100),
                            ),
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Transform.rotate(
                                  angle: angle * pi / 90,
                                  child: Hero(
                                    tag: movie.poster,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Image.asset(
                                        movies[index].poster,
                                        height: 300,
                                        width: 205,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                  Positioned(
                      top: 330,
                      child: Row(
                        children: List.generate(
                          movies.length,
                          (index) => AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            margin: EdgeInsets.only(right: 15),
                            width: currentIndex == index ? 30 : 0,
                            height: 10,
                            decoration: BoxDecoration(
                                color: currentIndex == index
                                    ? buttonColor
                                    : Colors.black54,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ))
                ],
              ))
            ],
          ))
        ],
      ),
    );
  }

  Row categoryItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
          categories.length,
          (index) => Column(children: [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white10.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    categories[index].emoji,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  categories[index].name,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                )
              ])),
    );
  }

  Padding searchField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 19),
            filled: true,
            hintText: "",
            hintStyle: TextStyle(color: Colors.white54),
            fillColor: Colors.white.withOpacity(0.05),
            prefixIcon: Icon(
              Icons.search,
              size: 35,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(27),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar headerParts() {
    return AppBar(
      backgroundColor: appBackgroundColor,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: "Welcome Rendosland",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              color: Colors.white54)),
                      TextSpan(
                          text: "👏",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Let's relax and watch a movie!",
                  style: TextStyle(
                      height: 0.06,
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                )
              ],
            ),
            Container(
              width: 40,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage("images/zen.jpg"))),
            )
          ],
        ),
      ),
    );
  }
}

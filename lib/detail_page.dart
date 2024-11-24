import 'package:flutter/material.dart';
import 'package:zen/Widget/movie_info.dart';
import 'package:zen/constant.dart';
import 'package:zen/movie_model.dart';
import 'package:zen/reservation_app.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;
  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        foregroundColor: Colors.white,
        backgroundColor: appBackgroundColor,
        title: const Text(
          "Details",
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              SizedBox(
                height: 310,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: movie.poster,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(movie.poster),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MovieInfo(
                            icon: Icons.videocam_rounded,
                            name: "Genera",
                            value: movie.genre),
                        MovieInfo(
                            icon: Icons.timer,
                            name: "Duration",
                            value: formateTime(Duration(
                                minutes: movie.duration,
                                hours: movie.duration))),
                        MovieInfo(
                            icon: Icons.star,
                            name: "Rating",
                            value: "${movie.rating}/10"),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                movie.title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 22),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
              Text(
                "Synopsis",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                movie.synopsis,
                style:
                    TextStyle(fontSize: 13, color: Colors.white60, height: 2),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(color: Color(0xff1c1c27), blurRadius: 60, spreadRadius: 80)
        ]),
        child: FloatingActionButton.extended(
            backgroundColor: Colors.transparent,
            onPressed: () {},
            label: MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const ReservationScreen()));
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              color: buttonColor,
              height: 70,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Center(
                  child: Text(
                    "Get Reservation",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}

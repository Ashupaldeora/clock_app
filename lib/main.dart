import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

void main() {
  runApp(const clock());
}

class clock extends StatefulWidget {
  const clock({super.key});

  @override
  State<clock> createState() => _clockState();
}

class _clockState extends State<clock> {
  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.now();
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      time = DateTime.now();
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
              gradient: RadialGradient(
                  radius: 2.4,
                  focal: Alignment.topLeft,
                  colors: [Color(0xff775D8C), Colors.black, Colors.black])),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Stack(
                  children: [
                    (time.hour >= 6 && time.hour <= 19)
                        ? Image.asset('assets/images/good-morning-my-love.gif')
                        : Image.asset('assets/images/giphy.gif')
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(
                        text: (time.hour > 12 && time.hour <= 24)
                            ? "${time.hour % 12}"
                            : (time.hour == 0)
                                ? "${12}"
                                : "0${time.hour}",
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 80,
                            fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                        text: " hr ",
                        style: GoogleFonts.inter(
                            color: Colors.grey.shade400,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: (time.minute > 9)
                            ? "${time.minute}"
                            : "0${time.minute}",
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 80,
                            fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                        text: " min",
                        style: GoogleFonts.inter(
                            color: Colors.grey.shade400,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                    ])),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "${time.day}-${time.month}-${time.year}",
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                heightFactor: 3.5,
                child: GlassContainer(
                  height: 80,
                  width: double.maxFinite,
                  blur: 10,
                  color: Colors.white.withOpacity(0.1),
                  border: Border.fromBorderSide(BorderSide.none),
                  borderRadius: BorderRadius.circular(60),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          4,
                          (index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    click = index;
                                  });
                                },
                                child: (click == index)
                                    ? Container(
                                        height: 60,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: Color(0xffd7a6ff),
                                            borderRadius:
                                                BorderRadius.circular(70)),
                                        child: Icon(
                                          icons[index],
                                          size: 35,
                                        ),
                                      )
                                    : Container(
                                        height: 60,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(70)),
                                        child: Icon(
                                          icons[index],
                                          size: 35,
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                              ))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List icons = [Icons.alarm, Icons.all_inclusive, Icons.timer, Icons.schedule];
int click = 0;

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
                padding: const EdgeInsets.only(top: 50),
                child: Stack(
                  children: [
                    Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(280),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(-60, 110),
                                color: Color(0xff7E5F64),
                                blurRadius: 80,
                                spreadRadius: -30)
                          ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: Image.asset(
                          'assets/images/moon.png',
                          height: 350,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(30, 0),
                                color: Color(0xffFEA66A),
                                blurRadius: 30,
                                spreadRadius: -90)
                          ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: Image.asset(
                          'assets/images/stars.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(
                        text: "${time.hour % 12}",
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
                        text: "${time.minute}",
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
              Align(
                alignment: Alignment.bottomCenter,
                heightFactor: 4.8,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GlassContainer(
                    height: 80,
                    width: double.maxFinite,
                    blur: 4,
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
                                          width: 80,
                                          decoration: BoxDecoration(
                                              color: Color(0xffd7a6ff),
                                              borderRadius:
                                                  BorderRadius.circular(70)),
                                          child: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                icons[index],
                                                size: 35,
                                              )),
                                        )
                                      : Container(
                                          height: 60,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(70)),
                                          child: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                icons[index],
                                                size: 35,
                                              )),
                                        ),
                                ))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconcont(IconData icon) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 60,
        width: 80,
        decoration: BoxDecoration(
            color: Color(0xffd7a6ff), borderRadius: BorderRadius.circular(70)),
        child: IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              size: 35,
            )),
      ),
    );
  }
}

List icons = [Icons.alarm, Icons.all_inclusive, Icons.timer, Icons.schedule];
var click = 0;

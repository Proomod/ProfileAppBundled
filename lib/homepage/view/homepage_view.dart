import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pramodpro/homepage/widgets/bottom_sheet.dart';
import 'package:pramodpro/homepage/widgets/drawer_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Container(
          width: MediaQuery.of(context).size.width / 1.7,
          child: const Drawer(
            child: DrawerContent(),
            elevation: 10.0,
          ),
        ),
        //const Color(0xFF151617),
        backgroundColor: Colors.black54,
        body: Builder(
          builder: (BuildContext context) => SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    child: Image.asset(
                      'images/portfolioImage.png',
                      fit: BoxFit.cover,
                      color: Colors.black54,
                      cacheHeight: 680,
                      colorBlendMode: BlendMode.darken,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 40.0,
                    width: double.infinity,
                    child: AppBar(
                      leading: IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                      backgroundColor: Colors.black54,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height - 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Hello I am',
                        style: GoogleFonts.fredokaOne(
                            textStyle: const TextStyle(
                          fontSize: 20.0,
                        )),
                      ),
                      const SizedBox(height: 10.0),
                      Text('Pramod Bhusal',
                          style: GoogleFonts.fredokaOne(
                              textStyle: const TextStyle(
                            fontSize: 40,
                          ))),
                      const SizedBox(height: 5.0),
                      Text(
                        'Mobile Developer',
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                        )),
                      )
                    ],
                  ),
                ),
                DraggableScrollableSheet(
                    maxChildSize: 0.85,
                    minChildSize: 0.1,
                    initialChildSize: 0.1,
                    builder: (BuildContext context,
                        ScrollController scrollController) {
                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            padding: EdgeInsets.zero,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40),
                                  topLeft: Radius.circular(40)),
                            ),
                            child: MyBottomSheet(
                                scrollController: scrollController),
                          )
                        ],
                      );
                    })
              ],
            ),
          ),
        ));
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 50.0;
    final Path path = Path()
      ..lineTo(size.width - radius, 0)
      ..arcTo(
          Rect.fromPoints(Offset(size.width - radius, 0),
              Offset(size.width, radius)), // Rect
          1.5 * pi, // Start engle
          0.5 * pi, // Sweep engle
          true) // direction clockwise
      ..lineTo(size.width, size.height - radius)
      ..arcTo(
          Rect.fromCircle(
              center: Offset(size.width - radius, size.height - radius),
              radius: radius),
          0,
          0.5 * pi,
          false)
      ..lineTo(radius, size.height)
      ..arcTo(Rect.fromLTRB(0, size.height - radius, radius, size.height),
          0.5 * pi, 0.5 * pi, false)
      ..lineTo(0, radius)
      ..arcTo(Rect.fromLTWH(0, 0, 70, 100), 1 * pi, 0.5 * pi, false)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pramodpro/courses/course_details/course_details.dart';
import 'package:pramodpro/courses/overview/models/course_model.dart';

class CoursesOverview extends StatefulWidget {
  const CoursesOverview({Key? key}) : super(key: key);

  @override
  _CoursesOverviewState createState() => _CoursesOverviewState();
}

class _CoursesOverviewState extends State<CoursesOverview> {
  List<CourseModel> coursesList = <CourseModel>[];
  @override
  void initState() {
    super.initState();
    getJson();
  }

  Future<void> getJson() async {
    final List<CourseModel> courseList = <CourseModel>[];
    final String jsonText =
        await rootBundle.loadString('assets/course_overview.json');
    final List<dynamic> courses = json.decode(jsonText) as List<dynamic>;
    courses.forEach((dynamic course) =>
        courseList.add(CourseModel.fromJson(course as Map<String, dynamic>)));
    setState(() {
      coursesList = courseList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart_outlined),
        )
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl:
                  'https://images.indianexpress.com/2020/04/online759.jpg',
              memCacheHeight: 692,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Courses from \$9.99',
                  style: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.yellowAccent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const <Widget>[
                    Center(
                      child: Text(
                        'Your advertisement here',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Center(
                      child: Text(
                        'advertisement',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Featured',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: coursesList.map((CourseModel course) {
                  return Course(
                      tapCallback: () {
                        Navigator.push<void>(
                            context,
                            MaterialPageRoute(
                                builder: (_) => CompleteJS(course: course)));
                      },
                      name: course.title,
                      author: course.instructor,
                      price: "9.99\$",
                      imageUrl: course.imageUrl);
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 100.0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Text('Will be added soon'),
          ],
        ),
      ),
    );
  }
}

class Course extends StatelessWidget {
  const Course(
      {Key? key,
      required this.name,
      required this.author,
      required this.price,
      required this.imageUrl,
      required this.tapCallback})
      : super(key: key);
  final String name;
  final String author;
  final String price;
  final String imageUrl;
  final VoidCallback tapCallback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: tapCallback,
        child: Card(
          color: Colors.black54,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Hero(
                      tag: name,
                      child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          placeholder: (BuildContext context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, dynamic error) =>
                              Icon(Icons.error)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                child: Container(
                  width: 240,
                  child: Text(name,
                      style: GoogleFonts.aBeeZee(
                          textStyle: const TextStyle(
                        fontWeight: FontWeight.w900,
                      ))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  author,
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 6.0),
                child: Text('US$price'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pramodpro/courses/overview/models/course_model.dart';

class CompleteJS extends StatelessWidget {
  const CompleteJS({Key? key, required this.course}) : super(key: key);
  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Course',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.7,
                child: Column(
                  children: [
                    Expanded(
                        child: Hero(
                      tag: course.title,
                      child: CachedNetworkImage(
                        imageUrl: course.imageUrl,
                      ),
                    )),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(course.title,
                          style: GoogleFonts.aBeeZee(
                              textStyle: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900,
                          ))),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 18,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              ' et aliquip commodo amet id. Adipisicing magna sunt ex duis veniam nisi nisi do est incididunt ali exercitation ea. Cupidatat magna consectetur veniam cillum eiusmod tempor reprehenderit veniam excepteur Lorem ex.'),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Created By: ${course.instructor}'),
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: Text(
                            course.price,
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w900,
                            )),
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                  ),
                  onPressed: () {
                    showDialog<dynamic>(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                              content: Text('Wll add this feature soon'));
                        });
                  },
                  child: const Text('Buy Now',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18.0,
                      )),
                ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "What you'll learn",
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ...course.summary.map((point) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.check,
                                  size: 20.0,
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Flexible(child: Text(point))
                              ],
                            ),
                          )),
                    ],
                  )),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Curriculum',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
              Flexible(
                fit: FlexFit.loose,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: courseContent.length,
                    itemBuilder: (BuildContext context, int index) {
                      List subItems = courseContent[index]['content'] as List;
                      return Card(
                        child: ExpansionTile(
                          title: Text(courseContent[index]['title'].toString()),
                          children: subItems
                              .map((dynamic e) => Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.circle,
                                          size: 20.0,
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Flexible(
                                          child: Text(
                                            e.toString(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )))
                              .toList(),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}

List<Map<String, dynamic>> courseContent = <Map<String, dynamic>>[
  <String, dynamic>{
    'title': 'Welcome to the course',
    'content': <String>[
      'Elit in qui quis culpa sunt do quis.',
      'In cillum anim magna id enim consectetur fugiat.',
      'Culpa ex tempor nisi et id mollit non consequat sint duis consequat ex.',
      'Eiusmod ut consequat enim duis commodo ipsum esse.'
    ]
  },
  <String, dynamic>{
    'title': 'Javascript fundamentals',
    'content': <String>[
      'Elit in qui quis culpa sunt do quis.',
      'In cillum anim magna id enim consectetur fugiat.',
      'Culpa ex tempor nisi et id mollit non consequat sint duis consequat ex.',
      'Eiusmod ut consequat enim duis commodo ipsum esse.'
    ]
  },
  <String, dynamic>{
    'title': 'Fundamentals 2',
    'content': <String>[
      'Elit in qui quis culpa sunt do quis.',
      'In cillum anim magna id enim consectetur fugiat.',
      'Culpa ex tempor nisi et id mollit non consequat sint duis consequat ex.',
      'Eiusmod ut consequat enim duis commodo ipsum esse.'
    ]
  },
  <String, dynamic>{
    'title': 'Dom and events',
    'content': <String>[
      'Elit in qui quis culpa sunt do quis.',
      'In cillum anim magna id enim consectetur fugiat.',
      'Culpa ex tempor nisi et id mollit non consequat sint duis consequat ex.',
      'Eiusmod ut consequat enim duis commodo ipsum esse.'
    ]
  },
  <String, dynamic>{
    'title': 'Async/await concepts',
    'content': <String>[
      'Elit in qui quis culpa sunt do quis.',
      'In cillum anim magna id enim consectetur fugiat.',
      'Culpa ex tempor nisi et id mollit non consequat sint duis consequat ex.',
      'Eiusmod ut consequat enim duis commodo ipsum esse.'
    ]
  }
];

List<Map<String, dynamic>> courseInfo = [<String, dynamic>{}];

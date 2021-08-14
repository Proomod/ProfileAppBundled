import 'package:flutter/material.dart';
import 'package:pramodpro/courses/view/courses_overview_view.dart';
import 'package:pramodpro/ecommerce/ecommerce.dart';
import 'package:pramodpro/web_view/web_view..dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Home'),
          onTap: () {},
        ),
        ListTile(
            leading: const Icon(Icons.public),
            title: const Text('Webpage'),
            onTap: () {
              Navigator.push<void>(
                  context, MaterialPageRoute(builder: (_) => WebPageViewer()));
            }),
        ListTile(
          leading: const Icon(Icons.shopping_cart),
          title: const Text('Ecommerce'),
          onTap: () => Navigator.push<void>(
              context, MaterialPageRoute(builder: (_) => const Ecommerce())),
        ),
        ListTile(
          leading: Icon(Icons.library_books),
          title: Text('My Courses'),
          onTap: () => Navigator.push<void>(
              context, MaterialPageRoute(builder: (_) => CoursesOverview())),
        ),
      ],
    );
  }
}

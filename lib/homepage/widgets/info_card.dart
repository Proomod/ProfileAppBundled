import 'package:flutter/material.dart';
import 'package:pramodpro/homepage/widgets/profile_text.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    required this.icon,
    required this.information,
    Key? key,
  }) : super(key: key);
  final Icon icon;
  final String information;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade400,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            icon,
            const SizedBox(
              width: 10.0,
            ),
            ProfileText(text: information),
          ],
        ),
      ),
    );
  }
}

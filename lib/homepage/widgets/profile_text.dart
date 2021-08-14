import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileText extends StatelessWidget {
  const ProfileText({
    required this.text,
    Key? key,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text,
          style: GoogleFonts.nunito(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0))),
    );
  }
}

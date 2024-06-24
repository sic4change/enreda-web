
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:flutter/material.dart';

class HeaderLanguageButton extends StatelessWidget {
  final String text;
  final void Function() onTap;

  HeaderLanguageButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: GoogleFonts.inter(
            letterSpacing: .4,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black
        ),
      ),
    );
  }
}

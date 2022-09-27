import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final Function(String)? onChanged;

  CustomTextField({Key? key, required this.hint, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        hintStyle: GoogleFonts.manrope(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderSide:
          const BorderSide(color: Color(0xFF4F69D7), width: 2.0),
          borderRadius: BorderRadius.circular(11),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
        ),
      ),
    );
  }
}

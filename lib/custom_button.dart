import 'package:app/globals.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback onPressed;
  final ButtonStyle? buttonStyle;
  final Widget? centerChild;
  const CustomButton({
    super.key,
    this.text,
    required this.onPressed,
    this.buttonStyle,
    this.centerChild,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ButtonSize["width"],
      height: ButtonSize["height"],
      child: ElevatedButton(
        onPressed: onPressed,
        style: buttonStyle ??
            ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.zero,
              shadowColor: Colors.transparent,
            ),
        child: Center(
          child: centerChild ??
              Text(
                text ?? '',
                style: GoogleFonts.montserrat(
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(7, 7, 7, 1),
                ),
                textAlign: TextAlign.start,
              ),
        ),
      ),
    );
  }
}

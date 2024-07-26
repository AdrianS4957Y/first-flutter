import 'package:app/globals.dart';
import 'package:flutter/material.dart';

class IconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;

  const IconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ButtonSize["width"],
      height: ButtonSize["height"],
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}

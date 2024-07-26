import 'package:app/globals.dart';
import 'package:flutter/material.dart';

class PincodeState extends StatelessWidget {
  const PincodeState({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            maxLength,
            (int index) => Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: getColor(index) ?? colors["lightGrey"],
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

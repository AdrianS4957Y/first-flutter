import 'package:app/custom_button.dart';
import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final Function onPressed;
  final int? fromNumber;
  final int? toNumber;
  const CustomRow({
    required this.onPressed,
    super.key,
    this.fromNumber,
    this.toNumber,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        ((toNumber ?? 0) - (fromNumber ?? 0)),
        (int index) =>
            CustomButton(text: "$index", onPressed: () => onPressed("$index")),
      ),
    );
  }
}

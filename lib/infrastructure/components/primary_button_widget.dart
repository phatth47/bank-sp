import 'package:bank_sp/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const PrimaryButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        backgroundColor: ColorName.secondary,
        minimumSize: Size(width, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: ColorName.whiteText,
        ),
      ),
    );
  }
}

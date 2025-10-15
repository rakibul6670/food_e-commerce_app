import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final double? height;
  final double width;
  final String buttonName;
  final VoidCallback onpressed;

  const CustomTextButton({
    super.key,
    this.height,
    required this.width,
    required this.buttonName,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: height ?? 56,
      width: width,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: theme.primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onpressed,
        child: Text(buttonName),
      ),
    );
  }
}

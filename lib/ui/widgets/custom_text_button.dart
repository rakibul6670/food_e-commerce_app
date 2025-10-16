import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final double? height;
  final double width;
  final String buttonName;
  final VoidCallback onpressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final BorderSide? borderSide;

  const CustomTextButton({
    super.key,
    this.height,
    required this.width,
    required this.buttonName,
    required this.onpressed,
    this.backgroundColor,
    this.foregroundColor,
    this.borderSide,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: height ?? 56,
      width: width,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: backgroundColor ?? theme.primaryColor,
          foregroundColor: foregroundColor ?? Colors.white,
          shape: RoundedRectangleBorder(
            side: borderSide ?? BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onpressed,
        child: Text(buttonName),
      ),
    );
  }
}

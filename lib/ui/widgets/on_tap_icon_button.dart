import 'package:flutter/material.dart';

class OnTapIconButton extends StatelessWidget {
  final double? height;
  final double? width;
  final IconData iconData;
  final BoxBorder? border;
  final Color? color;
  final VoidCallback onTap;

  const OnTapIconButton({
    super.key,
    this.height,
    this.width,
    required this.iconData,
    this.border,
    this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 32,
        width: height ?? 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: border,
          color: color ?? Color(0xffFFF2E7),
        ),
        child: Icon(iconData, color: Theme.of(context).primaryColor),
      ),
    );
  }
}

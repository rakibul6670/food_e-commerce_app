import 'package:flutter/material.dart';

class IconLabelButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget icon;
  final double? height;
  final double? width;
  final String label;

  const IconLabelButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.height,
    required this.label,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: height ?? 41,
        width: width,
        child: Column(
          children: [
            icon,

            Text(
              label,
              style: TextStyle(fontSize: 10, color: Color(0xff27214D)),
            ),
          ],
        ),
      ),
    );
  }
}

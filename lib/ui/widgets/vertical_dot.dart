import 'package:flutter/material.dart';

class VerticalDot extends StatelessWidget {
  const VerticalDot({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(6, (index) {
        return Container(
          // margin: EdgeINsets,
          margin: EdgeInsets.only(bottom: 3, left: 30),
          height: 5,
          width: 3,
          decoration: BoxDecoration(
            color: theme.primaryColor,
            //shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}

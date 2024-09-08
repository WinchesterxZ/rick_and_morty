import 'package:flutter/material.dart';

class TextForChracterItemWidget extends StatelessWidget {
  final String name;
  final FontWeight fontWeight;
  final double fontSize;
  final IconData icon;
  final Color iconColor;
  final double? iconSize;
  const TextForChracterItemWidget(
      {super.key,
      required this.name,
      required this.fontWeight,
      required this.fontSize,
      required this.icon,
      required this.iconColor,  this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          name,
          style: TextStyle(
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),
        ),
        Icon(
          icon,
          color: iconColor,
          size:iconSize,
        )
      ],
    );
  }
}

import 'package:enreda_app/presentation/widgets/spaces.dart';
import 'package:flutter/material.dart';

import '../../values/values.dart';
import '../layout/adaptive.dart';

class TextWithBullet extends StatelessWidget {
  TextWithBullet({
    required this.text,
    this.textStyle,
    this.spacing,
  });

  final String text;
  final TextStyle? textStyle;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double fontSize = responsiveSize(context, 14, 18, md: 15);
    return Row(
      children: [
        Bullet(),
        spacing == null ? SpaceW4() : SizedBox(width: spacing),
        Text(
          text,
          style: textStyle ??
              textTheme.bodyMedium?.copyWith(
                color: AppColors.darkViolet, fontSize: fontSize, height: 1.8
              ),
        ),
      ],
    );
  }
}

class Bullet extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final Color color;

  Bullet({
    this.width = 4.0,
    this.height = 4.0,
    this.borderRadius = 20,
    this.color = AppColors.blueMain,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
    );
  }
}

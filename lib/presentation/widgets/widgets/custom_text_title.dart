import 'package:flutter/material.dart';
import '../../../values/values.dart';
import '../../layout/adaptive.dart';

class CustomTextTitle extends StatelessWidget {

  CustomTextTitle({ required this.title });
  final String title;

  @override
  Widget build(BuildContext context) {
    double fontSize = responsiveSize(context, 12, 13, md: 13);
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Text(
        title,
        style: textTheme.bodyText1?.copyWith(
          color: AppColors.bluePurple,
          height: 1.5,
          fontWeight: FontWeight.w700,
          fontSize: fontSize,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}


class CustomTextBody extends StatelessWidget {

  CustomTextBody({ required this.text });
  final String text;

  @override
  Widget build(BuildContext context) {
    double fontSize = responsiveSize(context, 12, 13, md: 13);
    TextTheme textTheme = Theme.of(context).textTheme;
    return Text(
      text,
      style: textTheme.bodyText1?.copyWith(
        color: AppColors.greyDarkTxt,
        height: 1.5,
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../../../values/values.dart';
import '../../layout/adaptive.dart';

class CustomTextTitle extends StatelessWidget {

  CustomTextTitle({ required this.title, this.color = AppColors.greyViolet });
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Text(
        title,
        style: textTheme.bodySmall?.copyWith(
          color: color,
          height: 1.5,
          fontWeight: FontWeight.w600,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class CustomText extends StatelessWidget {

  CustomText({ required this.title, this.color = AppColors.greyAlt });
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    double fontSize = responsiveSize(context, 14, 15, md: 14);
    TextTheme textTheme = Theme.of(context).textTheme;
    return Text(
      title,
      style: textTheme.bodySmall?.copyWith(
        color: color,
        height: 1.5,
        fontSize: fontSize,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class CustomTextMediumBold extends StatelessWidget {

  const CustomTextMediumBold({required this.text, this.color = AppColors.textBlue });
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    double fontSize = responsiveSize(context, 15, 20, md: 16);
    TextTheme textTheme = Theme.of(context).textTheme;
    return Text(
      text,
      style: textTheme.titleMedium?.copyWith(
        color: color,
        height: 1.5,
        fontSize: fontSize,
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
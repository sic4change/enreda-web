import 'package:flutter/material.dart';

import '../../../values/values.dart';
import '../../layout/adaptive.dart';

Future showAlertDialog(
    BuildContext context, {
      required String title,
      required String content,
      required String defaultActionText,
      String? cancelActionText,
    }) {
  try {
    TextTheme textTheme = Theme.of(context).textTheme;
    double fontSize = responsiveSize(context, 14, 18, md: 15);
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title, style: textTheme.bodyText1?.copyWith(
          color: AppColors.greyTxtAlt,
          height: 1.5,
          fontWeight: FontWeight.w800,
          fontSize: fontSize + 2,
        )),
        content: Text(content, style: textTheme.bodyText1?.copyWith(
            color: AppColors.greyTxtAlt,
            height: 1.5,
            fontWeight: FontWeight.w400,
            fontSize: fontSize)),
        actions: <Widget>[
          ElevatedButton(
              onPressed: () => Navigator.of(context).pop((true)),
              style: TextButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(defaultActionText, style: textTheme.bodyText1?.copyWith(
                    color: AppColors.white,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                    fontSize: fontSize)),
              )
          ),
          if (cancelActionText != null)
          // ignore: deprecated_member_use
            ElevatedButton(
                onPressed: () => Navigator.of(context).pop((false)),
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(cancelActionText, style: textTheme.bodyText1?.copyWith(
                    color: AppColors.white,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                    fontSize: fontSize)),
                )),
        ],
      ),
    );
  } catch(e) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double fontSize = responsiveSize(context, 14, 18, md: 15);
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title, style: textTheme.bodyText1?.copyWith(
          color: AppColors.greyTxtAlt,
          height: 1.5,
          fontWeight: FontWeight.w800,
          fontSize: fontSize + 2,
        )),
        content: Text(content, style: textTheme.bodyText1?.copyWith(
          color: AppColors.greyTxtAlt,
          height: 1.5,
          fontWeight: FontWeight.w400,
          fontSize: fontSize,
        )),
        actions: <Widget>[
          ElevatedButton(
              onPressed: () => Navigator.of(context).pop((true)),
              style: TextButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(defaultActionText, style: textTheme.bodyText1?.copyWith(
                    color: AppColors.greyTxtAlt,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                    fontSize: fontSize)),
              )
          ),
          if (cancelActionText != null)
          // ignore: deprecated_member_use
            ElevatedButton(
                onPressed: () => Navigator.of(context).pop((false)),
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(cancelActionText, style: textTheme.bodyText1?.copyWith(
                      color: AppColors.white,
                      height: 1.5,
                      fontWeight: FontWeight.w400,
                      fontSize: fontSize)),
                )),
        ],
      ),
    );
  }


}
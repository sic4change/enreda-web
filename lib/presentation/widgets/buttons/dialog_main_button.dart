import 'package:enreda_app/presentation/layout/adaptive.dart';
import 'package:enreda_app/utils/const.dart';
import 'package:enreda_app/utils/responsive.dart';
import 'package:flutter/material.dart';

import '../../../values/values.dart';

class DialogMainButton extends StatelessWidget {
  const DialogMainButton({Key? key, required this.title, this.onPressed})
      : super(key: key);

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = widthOfScreen(context) < 1024;
    return TextButton(
      onPressed: onPressed,
      child: Padding(
          padding: Responsive.isTablet(context) || Responsive.isMobile(context) ?  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0) : const EdgeInsets.all(18.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: isSmallScreen? 12 : 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: Constants.white,
            ),
          ),
        ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.turquoiseDark),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ))),
    );
  }
}

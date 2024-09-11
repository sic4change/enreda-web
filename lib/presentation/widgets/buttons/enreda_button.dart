import 'package:enreda_app/presentation/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import '../../../values/values.dart';
import '../../layout/adaptive.dart';

class EnredaButton extends StatelessWidget {
  EnredaButton({
    required this.buttonTitle,
    this.width = Sizes.WIDTH_150,
    this.height = Sizes.HEIGHT_64,
    this.titleStyle,
    this.titleColor = AppColors.white,
    this.buttonColor = AppColors.primaryColor,
    this.onPressed,
    this.padding = const EdgeInsets.all(Sizes.PADDING_8),
    this.borderRadius = const BorderRadius.all(
      Radius.circular(Sizes.RADIUS_8),
    ),
    this.opensUrl = false,
    this.url = "",
    this.linkTarget = LinkTarget.blank,
  });

  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final String buttonTitle;
  final TextStyle? titleStyle;
  final Color titleColor;
  final Color buttonColor;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry padding;
  final String url;
  final LinkTarget linkTarget;
  final bool opensUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius!,
      child: MaterialButton(
        minWidth: width,
        height: height,
        onPressed: opensUrl ? () {} : onPressed,
        color: buttonColor,
        child: Padding(
          padding: padding,
          child: buildChild(context),
        ),
      ),
    );
  }

  Widget buildChild(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double textSize = responsiveSize(
      context,
      Sizes.TEXT_SIZE_14,
      Sizes.TEXT_SIZE_16,
      md: Sizes.TEXT_SIZE_15,
    );
    if (opensUrl) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Link(
          uri: Uri.parse(url),
          target: linkTarget,
          builder: (context, followLink) {
            return GestureDetector(
              onTap: followLink,
              child: Text(
                buttonTitle,
                style: titleStyle ??
                    textTheme.displayMedium?.copyWith(
                      color: titleColor,
                      fontSize: textSize,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            );
          },
        ),
      );
    } else {
      return Text(
        buttonTitle,
        style: titleStyle ??
            textTheme.displayMedium?.copyWith(
              color: titleColor,
              fontSize: textSize,
              letterSpacing: 1.1,
              fontWeight: FontWeight.bold,
            ),
      );
    }
  }
}

class EnredaButtonIcon extends StatelessWidget {
  const EnredaButtonIcon({
    this.buttonTitle = "",
    this.width = Sizes.WIDTH_150,
    this.height = Sizes.HEIGHT_60,
    this.titleStyle,
    this.titleColor = AppColors.white,
    this.buttonColor = AppColors.primaryColor,
    this.onPressed,
    this.padding = const EdgeInsets.only(top: Sizes.PADDING_8, bottom: Sizes.PADDING_8, left: Sizes.PADDING_16, right: 0),
    this.borderRadius = const BorderRadius.all(
      Radius.circular(Sizes.RADIUS_45),
    ),
    this.opensUrl = false,
    this.url = "",
    this.linkTarget = LinkTarget.blank,
    this.widget,
  });

  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final String buttonTitle;
  final TextStyle? titleStyle;
  final Color titleColor;
  final Color buttonColor;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry padding;
  final String url;
  final LinkTarget linkTarget;
  final bool opensUrl;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: MaterialButton(
        minWidth: width,
        height: height,
        onPressed: opensUrl ? () {} : onPressed,
        color: buttonColor,
        child: Padding(
          padding: padding,
          child: buildChild(context),
        ),
      ),
    );
  }

  Widget buildChild(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double? textSize = responsiveSize(
      context,
      Sizes.TEXT_SIZE_14,
      Sizes.TEXT_SIZE_16,
      md: Sizes.TEXT_SIZE_15,
    );
    return Row(
      children: [
        Text(
          buttonTitle,
          style: titleStyle ??
              textTheme.bodySmall?.copyWith(
                color: titleColor,
                fontSize: textSize,
                letterSpacing: 1.1,
                fontWeight: FontWeight.bold,
              ),
        ),
        if(buttonTitle != "") SizedBox(width: 10,),
        Container(
            height: 30,
            child: widget ?? Container()),
      ],
    );
    // }
  }
}

class EnredaButtonIconReverse extends StatelessWidget {
  const EnredaButtonIconReverse({
    this.buttonTitle = "",
    this.width = Sizes.WIDTH_150,
    this.height = Sizes.HEIGHT_60,
    this.titleStyle,
    this.titleColor = AppColors.white,
    this.buttonColor = AppColors.primaryColor,
    this.onPressed,
    this.padding = const EdgeInsets.only(top: Sizes.PADDING_8, bottom: Sizes.PADDING_8, left: Sizes.PADDING_16, right: 0),
    this.borderRadius = const BorderRadius.all(
      Radius.circular(Sizes.RADIUS_45),
    ),
    this.opensUrl = false,
    this.url = "",
    this.linkTarget = LinkTarget.blank,
    this.widget,
  });

  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final String buttonTitle;
  final TextStyle? titleStyle;
  final Color titleColor;
  final Color buttonColor;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry padding;
  final String url;
  final LinkTarget linkTarget;
  final bool opensUrl;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: MaterialButton(
        minWidth: width,
        height: height,
        onPressed: opensUrl ? () {} : onPressed,
        color: buttonColor,
        child: Padding(
          padding: padding,
          child: buildChild(context),
        ),
      ),
    );
  }

  Widget buildChild(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double? textSize = responsiveSize(
      context,
      Sizes.TEXT_SIZE_14,
      Sizes.TEXT_SIZE_16,
      md: Sizes.TEXT_SIZE_15,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 20,
            child: widget ?? Container()),
        SpaceW8(),
        Text(
          buttonTitle,
          style: titleStyle ??
              textTheme.bodySmall?.copyWith(
                color: titleColor,
                fontSize: textSize,
                letterSpacing: 1.1,
                fontWeight: FontWeight.bold,
              ),
        ),
        if(buttonTitle != "") SizedBox(width: 10,),
      ],
    );
    // }
  }
}

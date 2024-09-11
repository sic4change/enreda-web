import 'package:enreda_app/presentation/widgets/spaces.dart';
import 'package:enreda_app/presentation/widgets/widgets/precache_widgets.dart';
import 'package:flutter/material.dart';

import '../../utils/responsive.dart';
import '../../values/values.dart';
import 'circular_container.dart';

class SkillCardData {
  final String title;
  final String subtitle;
  final String description;
  final IconData iconData;
  final String imageString;

  SkillCardData({required this.title, required this.subtitle, required this.iconData, required this.description, required this.imageString});
}

class SkillCard extends StatefulWidget {
  SkillCard({
    this.title = "",
    this.subtitle = "",
    this.description = "",
    required this.imageString,
    this.titleStyle,
    this.subtitleStyle,
    this.descriptionStyle,
    this.width,
    this.height,
    this.iconSize = 40,
    this.elevation = Sizes.ELEVATION_4,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.backgroundColor = AppColors.white,
    this.iconData = Icons.phone,
    this.iconColor = AppColors.white,
    this.iconBackgroundColor = AppColors.black,
    this.child,
    this.onHoverChild,
  });

  final String title;
  final String subtitle;
  final String description;
  final String imageString;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final TextStyle? descriptionStyle;
  final double? width;
  final double? height;
  final double iconSize;
  final double elevation;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final Color iconColor;
  final Color iconBackgroundColor;
  final IconData iconData;
  final Widget? child;
  final Widget? onHoverChild;

  @override
  _SkillCardState createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(32)),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.greyAlt.withOpacity(0.6),
            spreadRadius: 0,
            blurRadius: 1,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: defaultChild(),
    );
  }

  Widget defaultChild() {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      key: Key("default"),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: widget.child ??
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                  child: AspectRatio(
                    aspectRatio: Responsive.isTablet(context) || Responsive.isDesktopS(context) || Responsive.isDesktopL(context) ? 1.9 : 1.29,
                    child:
                    PrecacheImageCard(imageUrl: widget.imageString)
                    //Image.asset(widget.imageString, fit: BoxFit.cover),
                  ),
                ),
                SpaceH12(),
                SelectableText(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: textTheme.titleSmall?.copyWith(height: 2.0, fontWeight: FontWeight.bold),
                ),
                SpaceH12(),
                SelectableText(
                  widget.subtitle,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium?.copyWith(height: 1.4, fontWeight: FontWeight.w700, color: AppColors.violetBlue.withOpacity(0.6)),
                ),
                SpaceH12(),
                SelectableText(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium?.copyWith(height: 1.6, fontWeight: FontWeight.w400, color: AppColors.greyBlue.withOpacity(0.5), letterSpacing: -0.2),
                ),
              ],
            ),
      ),
    );
  }

  Widget onHoverChild() {
    TextTheme textTheme = Theme.of(context).textTheme;
    return widget.onHoverChild ??
        Stack(
          children: [
            ClipRRect(
              borderRadius: widget.borderRadius,
              child: Opacity(
                opacity: 0.9,
                child: Image.asset(
                  ImagePath.ICON_BOX,
                  width: widget.width,
                  height: widget.height,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: widget.titleStyle ??
                        textTheme.titleMedium?.copyWith(
                          color: AppColors.white,
                        ),
                  ),
                  SpaceH8(),
                  Text(
                    widget.subtitle,
                    style: widget.descriptionStyle ??
                        textTheme.bodyMedium?.copyWith(
                          color: AppColors.primaryText1,
                        ),
                  ),
                  SpaceH8(),
                  Text(
                    widget.description,
                    style: widget.descriptionStyle ??
                        textTheme.bodyMedium?.copyWith(
                          color: AppColors.primaryText1,
                        ),
                  ),
                ],
              ),
            )
          ],
        );
    // Container(
    //   key: Key("onHover"),
    //   child: Stack(
    //     children: [
    //       Image.asset(
    //         ImagePath.ICON_BOX,
    //         fit: BoxFit.fill,
    //       ),
    //     ],
    //   ),
    // );
  }
}

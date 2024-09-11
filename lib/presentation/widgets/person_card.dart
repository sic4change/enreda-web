import 'package:enreda_app/presentation/widgets/spaces.dart';
import 'package:flutter/material.dart';

import '../../utils/functions.dart';
import '../../values/values.dart';
import '../layout/adaptive.dart';
import 'animated_line_through.dart';
import 'buttons/social_button.dart';

class PersonCardData {
  final String name;
  final String position;
  final String buttonText;
  final String imageUrl;
  final String urlLinkedin;
  final String urlTwitter;

  PersonCardData({
    required this.name,
    required this.position,
    required this.buttonText,
    required this.imageUrl,
    required this.urlLinkedin,
    required this.urlTwitter,
  });
}

class PersonCard extends StatefulWidget {
  PersonCard({
    required this.person,
    required this.position,
    required this.buttonText,
    required this.imageUrl,
    required this.urlLinkedin,
    required this.urlTwitter,
    this.titleStyle,
    this.categoryStyle,
    this.buttonTextStyle,
    this.width,
    this.imageWidth,
    this.imageHeight,
    this.buttonColor = AppColors.primaryColor,
    this.buttonIcon = Icons.chevron_right,
    this.onPressed,
  });

  final String person;
  final String position;
  final String buttonText;
  final String imageUrl;
  final String urlLinkedin;
  final String urlTwitter;
  final double? width;
  final double? imageWidth;
  final double? imageHeight;
  final TextStyle? titleStyle;
  final TextStyle? categoryStyle;
  final TextStyle? buttonTextStyle;
  final IconData buttonIcon;
  final Color buttonColor;
  final VoidCallback? onPressed;

  @override
  _PersonCardState createState() => _PersonCardState();
}

class _PersonCardState extends State<PersonCard> {
  bool _isHoveringOnImage = false;

  Color startValue = Colors.black.withOpacity(0.5);
  Color targetValue = Colors.black.withOpacity(0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      width: 200,
      //color: Colors.lightGreen,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
              color: AppColors.darkViolet,
              boxShadow: [
                BoxShadow(
                  color: AppColors.white.withOpacity(0.48),
                  spreadRadius: 0,
                  blurRadius: 20,
                  offset: Offset(-10, -10), // changes position of shadow
                ),
                BoxShadow(
                  color: AppColors.black.withOpacity(0.07),
                  spreadRadius: 0,
                  blurRadius: 20,
                  offset: Offset(10.0444, 10.0444), // changes position of shadow
                ),
              ],
            ),
            margin: const EdgeInsets.all(Sizes.MARGIN_16),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.white.withOpacity(0.48),
                      spreadRadius: 0,
                      blurRadius: 11.6814,
                      offset: Offset(-5.84071, -5.84071), // changes position of shadow
                    ),
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.07),
                      spreadRadius: 0,
                      blurRadius: 11.6814,
                      offset: Offset(5.86667, 5.86667), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(Sizes.RADIUS_150),
                  ),
                  child: Image.asset(
                    widget.imageUrl,
                    height: heightOfImage(),
                    width: widthOfImage(),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
          Container(
            //color: Colors.orange,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(color: AppColors.greyBorder)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                  child: Text(
                    widget.person,
                    style: widget.categoryStyle ??
                        textTheme.bodyMedium?.copyWith(
                          fontSize: Sizes.TEXT_SIZE_15,
                          color: AppColors.greyAlt,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                SpaceH8(),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0, left: 30.0),
                  child: Text(
                    widget.position,
                    textAlign: TextAlign.center,
                    style: widget.titleStyle ?? textTheme.titleMedium?.copyWith(
                      fontSize: Sizes.TEXT_SIZE_12,
                    ),
                  ),
                ),
                SpaceH8(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SpaceW12(),
                    ..._buildSocialIcons(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSocialIcons() {
    List<Widget> items = [];
    if (widget.urlLinkedin != "") {
      items.add(SocialButton(
        tag: widget.urlLinkedin,
        iconData: Data.socialDataTeam[0].iconData,

        onPressed: () => openUrlLink(widget.urlLinkedin),
      ));
      items.add(SpaceW12());
    }
    if (widget.urlTwitter != "") {
      items.add(SocialButton(
        tag: widget.urlTwitter,
        iconData: Data.socialDataTeam[1].iconData,

        onPressed: () => openUrlLink(widget.urlTwitter),
      ));
      items.add(SpaceW12());
    }
    return items;
  }

  void _onImageHover(bool hovering) {
    setState(() {
      _isHoveringOnImage = hovering;
    });
  }

  double heightOfImage() {
    return widget.imageHeight ?? assignHeight(context, 0.25);
  }

  double widthOfImage() {
    return widget.imageWidth ?? widthOfScreen(context);
  }
}

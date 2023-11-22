import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/on_hover.dart';
import '../../values/values.dart';

class CompanyCardData {
  final String title;
  final String url;
  final String imageUrl;
  final String imageUrlBn;

  CompanyCardData({required this.title, required this.url, required this.imageUrl, required this.imageUrlBn});
}

class CompanyCard extends StatefulWidget {
  CompanyCard({
    this.title = "",
    this.url = "",
    this.titleStyle,
    this.subtitleStyle,
    this.descriptionStyle,
    this.width,
    this.height,
    this.iconSize = 40,
    this.elevation = Sizes.ELEVATION_4,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.backgroundColor = AppColors.white,
    this.imageUrl = "",
    this.imageUrlBn = "",
    this.iconColor = AppColors.white,
    this.iconBackgroundColor = AppColors.black,
    this.child,
    this.onHoverChild,
  });

  final String title;
  final String url;
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
  final String imageUrl;
  final String imageUrlBn;
  final Widget? child;
  final Widget? onHoverChild;

  @override
  _CompanyCardState createState() => _CompanyCardState();
}

class _CompanyCardState extends State<CompanyCard> {

  late Image colorImage;
  late Image bnImage;

  @override
  void initState() {
    super.initState();
    colorImage = Image.asset(widget.imageUrl, width: widget.width! * 1.2, height: widget.height! * 1.2, fit: BoxFit.contain);
    bnImage = Image.asset(widget.imageUrlBn, width: widget.width, height: widget.height, fit: BoxFit.contain);
  }

  @override
  void didChangeDependencies() {
    precacheImage(colorImage.image, context);
    precacheImage(bnImage.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {_launchURL(widget.url)},
      child: Container(
        width: widget.width,
        height: widget.height,
        child: defaultChild(),
      ),
    );
  }

  Widget defaultChild() {
    return OnHoverEffect(builder: (isHovered){
      final hoverCard = isHovered ? true : false;
      return Container(
        key: Key("default"),
        child: widget.child ??
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                hoverCard ? colorImage : bnImage
              ],
            ),
      );
  });
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, enableJavaScript: true, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }


  Widget onHoverChild() {
    TextTheme textTheme = Theme.of(context).textTheme;
    return MouseRegion(
      child: Stack(
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
                            textTheme.subtitle1?.copyWith(
                              color: AppColors.white,
                            ),
                      ),
                    ],
                  ),
                )
              ],

      ),
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

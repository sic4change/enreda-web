import 'package:flutter/material.dart';

import '../../../../../utils/functions.dart';
import '../../../../../utils/responsive.dart';
import '../../../../../values/values.dart';
import '../../../../layout/adaptive.dart';
import '../../../../widgets/buttons/social_button.dart';
import '../../../../widgets/circular_container.dart';
import '../../../../widgets/enreda_card.dart';
import '../../../../widgets/enreda_link.dart';
import '../../../../widgets/spaces.dart';
import '../../../../widgets/widgets/precache_widgets.dart';

class HeaderImage extends StatefulWidget {
  const HeaderImage({
    Key? key,
    required this.controller,
    this.globeSize = 150,
    required this.imagePath,
    this.imageHeight,
    this.imageWidth,
    this.fit,
  }) : super(key: key);

  final double? globeSize;
  final String imagePath;
  final double? imageWidth;
  final double? imageHeight;
  final BoxFit? fit;
  final AnimationController controller;

  @override
  _HeaderImageState createState() => _HeaderImageState();
}

class _HeaderImageState extends State<HeaderImage> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PrecacheCarrouselImage(
          imageUrl: widget.imagePath,
          imageHeight: widget.imageHeight!,
        ),
      ],
    );
  }
}

List<Widget> buildSocialIcons(List<SocialButtonData> socialItems) {
  List<Widget> items = [];
  return items;
}

List<Widget> buildCardRow({
  required BuildContext context,
  required List<EnredaCardData> data,
  required double width,
  bool isHorizontal = true,
  bool isWrap = false,
  bool hasAnimation = true,
}) {
  TextTheme textTheme = Theme.of(context).textTheme;
  List<Widget> items = [];

  for (int index = 0; index < data.length; index++) {
    items.add(
      Padding(
        padding: Responsive.isMobile(context) ? EdgeInsets.all(0) : EdgeInsets.all(10.0),
        child: EnredaCard(
          height: responsiveSize(
              context,
              80,
              107,
              md: 90
          ),
          width: responsiveSize(
            context,
            300,
            373,
            md: 320
          ),
          hasAnimation: hasAnimation,
          title: Flexible(
            child: Text(
              data[index].title,
              style: textTheme.subtitle1?.copyWith(
                fontSize: responsiveSize(
                  context,
                  Sizes.TEXT_SIZE_16,
                  Sizes.TEXT_SIZE_18,
                ),
              ),
            ),
          ),
          subtitle: Flexible(
            child: Text(
              data[index].subtitle,
              style: textTheme.bodyText1?.copyWith(
                  fontSize: responsiveSize(
                context,
                Sizes.TEXT_SIZE_12,
                Sizes.TEXT_SIZE_14,
              )),
            ),
          ),
          onTapCard: data[index].onTapCard,
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          imageString: data[index].imageString,
        ),
      ),
    );
    //run this only on mobile devices and laptops but not on tablets.
    // We use `Wrap` to make the validating_form_controls wrap on the tablet view
    if (!isWrap) {
      if (isHorizontal) {
        items.add(SpaceW36());
      } else {
        items.add(SpaceH30());
      }
    }
  }

  return items;
}

double computeHeight(double offset, double sizeOfGlobe, double sizeOfBlob) {
  double sum = (offset + sizeOfGlobe) - sizeOfBlob;
  if (sum < 0) {
    return sizeOfBlob;
  } else {
    return sum + sizeOfBlob;
  }
}


Widget BuildStoresButtons(double buttonWidth, double buttonHeight) {
  return Wrap(
    children: [
      InkWell(
        onTap: () => openUrlLink(StringConst.URL_APPSTORE),
        child: Image.network(
          ImagePath.APP_STORE,
          width: buttonWidth,
          height: buttonHeight,
          fit: BoxFit.fill,
        ),
      ),
      InkWell(
        onTap: () => openUrlLink(StringConst.URL_GOOGLE_PLAY),
        child: Image.network(
          ImagePath.PLAY_STORE,
          width: buttonWidth,
          height: buttonHeight,
          fit: BoxFit.fill,
        ),
      ),
    ],
  );
}

import 'package:enreda_app/presentation/pages/home/sections/header_section/widgets.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/responsive.dart';
import '../../../../../values/values.dart';
import '../../../../layout/adaptive.dart';
import '../../../../widgets/spaces.dart';

const double sidePadding = Sizes.PADDING_20;

class CardsSectionMobile extends StatefulWidget {
  const CardsSectionMobile(
      { Key? key }) : super(key: key);

  @override
  _CardsSectionMobileState createState() => _CardsSectionMobileState();
}

class _CardsSectionMobileState extends State<CardsSectionMobile> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context) - (sidePadding * 2);
    double contentAreaWidth = screenWidth;

    return Column(
      children: [
        SpaceH30(),
        Responsive.isMobile(context) ? Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: buildCardRow(
              context: context,
              data: Data.enredaCardData,
              width: contentAreaWidth,
              isHorizontal: false,
              hasAnimation: false,
            ),
          ),
        ) :
        Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: sidePadding),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: buildCardRow(
                context: context,
                data: Data.enredaCardData,
                width: contentAreaWidth,
                isHorizontal: false,
                hasAnimation: false,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

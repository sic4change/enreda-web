import 'package:enreda_app/presentation/pages/home/sections/header_section/widgets.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../../../values/values.dart';
import '../../../../layout/adaptive.dart';
import '../../../../widgets/spaces.dart';

class CardsSectionWeb extends StatefulWidget {
  const CardsSectionWeb(
      { Key? key}) : super(key: key);

  @override
  _CardsSectionWebState createState() => _CardsSectionWebState();
}

class _CardsSectionWebState extends State<CardsSectionWeb> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context);
    double contentAreaWidth = screenWidth;

    List<Widget> cardsForTabletView = buildCardRow(
      context: context,
      data: Data.enredaCardData,
      width: contentAreaWidth * 0.4,
      isWrap: true,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 120),
        Container(
          child: ResponsiveBuilder(
            refinedBreakpoints: RefinedBreakpoints(),
            builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;
              if (screenWidth < RefinedBreakpoints().tabletNormal) {
                return Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: buildCardRow(
                      context: context,
                      data: Data.enredaCardData,
                      width: contentAreaWidth,
                      isHorizontal: false,
                      hasAnimation: false,
                    ),
                  ),
                );
              } else if (screenWidth >= RefinedBreakpoints().tabletNormal &&
                  screenWidth <= 1024) {
                return Wrap(
                  runSpacing: 24,
                  children: [
                    SizedBox(width: contentAreaWidth * 0.03),
                    Center(child: cardsForTabletView[0]),
                    SpaceW40(),
                    Center(child: cardsForTabletView[1]),
                    SizedBox(width: contentAreaWidth * 0.03),
                    Center(child: cardsForTabletView[2],),
                  ],
                );
              } else if (screenWidth > 1024 && screenWidth <= 1350 ) {
                return Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: contentAreaWidth * 0.03),
                          Center(child: cardsForTabletView[0]),
                          SpaceW40(),
                          Center(child: cardsForTabletView[1]),
                          SizedBox(width: contentAreaWidth * 0.03),
                        ],
                      ),
                      Column(
                        children: [
                          SpaceH50(),
                          Center(child: cardsForTabletView[2],),
                        ],
                      )
                    ],
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...buildCardRow(
                        context: context,
                        data: Data.enredaCardData,
                        width: contentAreaWidth / 3.8,
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }

}

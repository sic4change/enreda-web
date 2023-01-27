import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../values/values.dart';
import '../../../layout/adaptive.dart';
import '../../../widgets/content_area.dart';
import '../../../widgets/skill_card.dart';
import '../../../widgets/skill_level.dart';
import '../../../widgets/spaces.dart';

const double kRunSpacing = 20.0;
const double kMainAxisSpacing = 30.0;
const double kCrossAxisSpacing = 30.0;


class SkillsSection extends StatefulWidget {
  SkillsSection({Key? key});
  @override
  _SkillsSectionState createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    // _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context) - (getSidePadding(context) * 2);
    double screenHeight = heightOfScreen(context);
    double contentAreaWidthLg = screenWidth;
    double contentAreaWidthSm = screenWidth;
    double contentAreaHeight = responsiveSize(
      context,
      screenHeight * 1.6,
      screenHeight * 0.8,
      md: screenHeight * 0.8,
      sm: screenHeight * 1.6,
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: getSidePadding(context)),
      child: ResponsiveBuilder(
        refinedBreakpoints: RefinedBreakpoints(),
        builder: (context, sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;
          if (screenWidth <= RefinedBreakpoints().tabletSmall) {
            return VisibilityDetector(
              key: Key('skills-section-sm'),
              onVisibilityChanged: (visibilityInfo) {
                double visiblePercentage = visibilityInfo.visibleFraction * 100;
                if (visiblePercentage > 20) {
                  _controller.forward();
                }
              },
              child: Container(
                child: Column(
                  children: [
                    ContentArea(
                      width: contentAreaWidthSm,
                      child: Center(
                        child: Column(
                          children: _buildBoxesSm(Data.skillCardData),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (screenWidth > RefinedBreakpoints().tabletSmall &&
              screenWidth <= 1320) {
            return VisibilityDetector(
              key: Key('skills-section-md'),
              onVisibilityChanged: (visibilityInfo) {
                double visiblePercentage = visibilityInfo.visibleFraction * 100;
                if (visiblePercentage > 25) {
                  _controller.forward();
                }
              },
              child: Container(
                child: Column(
                  children: [
                    SpaceH40(),
                    ContentArea(
                      width: contentAreaWidthSm,
                      child: Center(
                        child: _buildSkillBoxes(boxHeight: 550),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return VisibilityDetector(
              key: Key('skills-section-lg'),
              onVisibilityChanged: (visibilityInfo) {
                double visiblePercentage = visibilityInfo.visibleFraction * 100;
                if (visiblePercentage > 50) {
                  _controller.forward();
                }
              },
              child: Container(
                child: Row(
                  children: [
                    ContentArea(
                      width: contentAreaWidthLg,
                      height: contentAreaHeight,
                      padding:
                          EdgeInsets.symmetric(horizontal: Sizes.HEIGHT_48),
                      child: Center(
                        child: _buildSkillBoxes(
                          boxHeight: 600,
                          crossAxisCount: 4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  List<Widget> _buildSkillSection(
    List<SkillLevelData> skillLevels,
    double width,
  ) {
    List<Widget> items = [];
    for (int index = 0; index < skillLevels.length; index++) {
      items.add(
        SkillLevel(
          skillLevelWidth: width,
          controller: _controller,
          skill: skillLevels[index].skill,
          
          level: skillLevels[index].level,
        ),
      );
    }
    return items;
  }

  Widget _buildSkillBoxes({
    required double boxHeight,
    int crossAxisCount = 2,
    double? boxWidth,
  }) {

    return Container(
      child: StaggeredGridView.countBuilder(
        crossAxisCount: crossAxisCount,
        itemCount: Data.skillCardData.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
            return SkillCard(
              width: boxWidth,
              title: Data.skillCardData[index].title,
              subtitle: Data.skillCardData[index].subtitle,
              description: Data.skillCardData[index].description,
              iconData: Data.skillCardData[index].iconData,
              imageString: Data.skillCardData[index].imageString,
            );
          //}
        },
        staggeredTileBuilder: (int index) {
          return StaggeredTile.extent(1, boxHeight);
        },
        mainAxisSpacing: kMainAxisSpacing,
        crossAxisSpacing: kCrossAxisSpacing,
      ),
    );
  }

  List<Widget> _buildBoxesSm(List<SkillCardData> skill) {
    List<Widget> items = [];
    for (int index = 0; index < skill.length; index++) {
      if (index != 1 && index != 5) {
        items.add(
          SkillCard(
            width: widthOfScreen(context),
            height: 600,
            title: skill[index].title,
            subtitle: skill[index].subtitle,
            description: skill[index].description,
            iconData: skill[index].iconData,
            imageString: skill[index].imageString,
          ),
        );
        items.add(SpaceH30());
      }
    }
    return items;
  }



}

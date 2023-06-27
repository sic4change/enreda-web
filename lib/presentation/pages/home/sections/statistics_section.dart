
import 'package:enreda_app/models/filterResource.dart';
import 'package:enreda_app/models/organization.dart';
import 'package:enreda_app/models/resource.dart';
import 'package:enreda_app/models/userEnreda.dart';
import 'package:enreda_app/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../services/database.dart';
import '../../../../utils/responsive.dart';
import '../../../../values/values.dart';
import '../../../layout/adaptive.dart';
import '../../../widgets/spaces.dart';


class StatItemData {
  final int? value;
  final String subtitle;
  final Color titleColor;
  final Color subtitleColor;
  final double fontSizeTitle;
  final FontWeight? fontWeightTitle;

  StatItemData({required this.value, required this.subtitle, required this.titleColor, required this.subtitleColor, required this.fontSizeTitle, this.fontWeightTitle });
}

class StatisticsSection extends StatefulWidget {
  StatisticsSection({Key? key});
  @override
  _StatisticsSectionState createState() => _StatisticsSectionState();
}

class _StatisticsSectionState extends State<StatisticsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  FilterResource filterResource = FilterResource("", [],);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double contentAreaWidth = widthOfScreen(context);
    final database = Provider.of<Database>(context, listen: false);
    double fontSizeTitle = responsiveSize(context, 30, 65, md: 50);
    double fontSizeTitle1 = responsiveSize(context, 40, 83, md: 70);
    double fontSizeTitle2 = responsiveSize(context, 20, 51, md: 40);
    double fontSizeTitle3 = responsiveSize(context, 45, 87, md: 75);
    double sidePadding = responsiveSize(context, Sizes.PADDING_10, Sizes.PADDING_80, md: Sizes.PADDING_20);

    return StreamBuilder<List<Resource?>>(
      stream: database.filteredResourcesCategoryStream(filterResource),
      builder: (context, snapshotResources) {
        int? resources = (snapshotResources.data?.length != null) ? snapshotResources.data?.length : 0;
        return StreamBuilder<List<UserEnreda>>(
            stream: database.youngsStream(),
            builder: (context, snapshotYoungs) {
              List<UserEnreda>? users = (snapshotYoungs.data?.where((i) => i.role == "Desempleado").toList());
              int? youngs = users != null ? users.length : 0;
              return StreamBuilder<List<Organization>>(
                stream: database.organizationsStream(),
                builder: (context, snapshotCompanies) {
                  int? companies = (snapshotCompanies.data?.length != null) ? snapshotCompanies.data?.length : 0;
                  return VisibilityDetector(
                    key: Key('statistics-section'),
                    onVisibilityChanged: (visibilityInfo) {
                      double visiblePercentage = visibilityInfo.visibleFraction * 100;
                      if (visiblePercentage > 30) {
                        _controller.forward();
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.greyStats,
                        borderRadius: BorderRadius.only(
                          topLeft: Responsive.isTablet(context) || Responsive.isMobile(context) ? Radius.circular(50) : Radius.circular(0),
                          topRight: Responsive.isTablet(context) || Responsive.isMobile(context) ? Radius.circular(50) : Radius.circular(0),
                        ),
                      ),
                      child: ResponsiveBuilder(
                        refinedBreakpoints: RefinedBreakpoints(),
                        builder: (context, sizingInformation) {
                          double screenWidth = sizingInformation.screenSize.width;
                          if (screenWidth < (RefinedBreakpoints().tabletSmall)) {
                            return Container(
                              width: contentAreaWidth,
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  SpaceH30(),
                                  ..._buildItems([
                                    StatItemData(
                                        value: daysBetween(DateTime.parse("2020-06-28 23:00:00.299871"), DateTime.now()),
                                        subtitle: StringConst.DAYS_CHANGIN,
                                        titleColor: AppColors.turquoise,
                                        subtitleColor: AppColors.turquoise,
                                        fontSizeTitle: fontSizeTitle,
                                        fontWeightTitle: FontWeight.w800,
                                    ),
                                    StatItemData(
                                        value: resources,
                                        subtitle: StringConst.RESOURCES_CREATED,
                                        titleColor: AppColors.turquoiseLight,
                                        subtitleColor: AppColors.turquoiseLight,
                                        fontSizeTitle: fontSizeTitle1,
                                        fontWeightTitle: FontWeight.w100,
                                    ),
                                    StatItemData(
                                        value: youngs,
                                        subtitle: StringConst.YOUNG_PARTICIPANTS,
                                        titleColor: AppColors.darkViolet,
                                        subtitleColor: AppColors.darkViolet,
                                        fontSizeTitle: fontSizeTitle2,
                                        fontWeightTitle: FontWeight.w800,
                                    ),
                                    StatItemData(
                                        value: companies,
                                        subtitle: StringConst.COMPANY_PARTICIPANTS,
                                        titleColor: AppColors.turquoise,
                                        subtitleColor: AppColors.turquoise,
                                        fontSizeTitle: fontSizeTitle3,
                                        fontWeightTitle: FontWeight.w100
                                    ),
                                  ]),
                                  SpaceH30(),
                                ],
                              ),
                            );
                          } else {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: Sizes.PADDING_40, horizontal: sidePadding ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Spacer(),
                                  ..._buildItems([
                                    StatItemData(
                                        value: daysBetween(DateTime.parse("2020-06-28 23:00:00.299871"), DateTime.now()),
                                        subtitle: StringConst.DAYS_CHANGIN,
                                        titleColor: AppColors.turquoise,
                                        subtitleColor: AppColors.turquoise,
                                        fontSizeTitle: fontSizeTitle,
                                        fontWeightTitle: FontWeight.w800,
                                    ),
                                    StatItemData(
                                        value: resources,
                                        subtitle: StringConst.RESOURCES_CREATED,
                                        titleColor: AppColors.turquoiseLight,
                                        subtitleColor: AppColors.turquoiseLight,
                                        fontSizeTitle: fontSizeTitle1,
                                        fontWeightTitle: FontWeight.w100,
                                    ),
                                    StatItemData(
                                        value: youngs,
                                        subtitle: StringConst.YOUNG_PARTICIPANTS,
                                        titleColor: AppColors.darkViolet,
                                        subtitleColor: AppColors.darkViolet,
                                        fontSizeTitle: fontSizeTitle2,
                                        fontWeightTitle: FontWeight.w800,
                                    ),
                                    StatItemData(
                                        value: companies,
                                        subtitle: StringConst.COMPANY_PARTICIPANTS,
                                        titleColor: AppColors.turquoise,
                                        subtitleColor: AppColors.turquoise,
                                        fontSizeTitle: fontSizeTitle3,
                                        fontWeightTitle: FontWeight.w100,
                                    ),
                                  ],
                                      isHorizontal: true),
                                  Spacer(),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  );
                },
              );
            });
      },
    );
  }

  List<Widget> _buildItems(
    List<StatItemData> data, {
    bool isHorizontal = false,
  }) {
    List<Widget> items = [];
    for (int index = 0; index < data.length; index++) {
      items.add(
        StatItem(
          title: data[index].value,
          subtitle: data[index].subtitle,
          controller: _controller,
          titleColor: data[index].titleColor,
          subtitleColor: data[index].subtitleColor,
          fontSizeTitle: data[index].fontSizeTitle,
          fontWeightTitle: data[index].fontWeightTitle,
        ),
      );

      if (index < data.length - 1) {
        if (isHorizontal) {
          items.add(Spacer(flex: 2));
        } else {
          items.add(SpaceH40());
        }
      }
    }
    return items;
  }
}

class StatItem extends StatelessWidget {
  StatItem({
    required this.title,
    required this.subtitle,
    required this.controller,
    required this.titleColor,
    required this.subtitleColor,
    required this.fontSizeTitle,
    this.fontWeightTitle,
    this.titleStyle,
    this.subtitleStyle,
    this.curve = Curves.easeIn,
  });

  final int? title;
  final String subtitle;
  final Color titleColor;
  final double fontSizeTitle;
  final FontWeight? fontWeightTitle;
  final Color subtitleColor;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final AnimationController controller;
  final Curve curve;

  late Animation<int> animation = IntTween(begin: 0, end: title).animate(
    CurvedAnimation(
      parent: controller,
      curve: curve,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return _buildChild(
          context: context,
          value: animation.value,
        );
      },
    );
  }

  Widget _buildChild({
    required BuildContext context,
    required int value,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          "$value",
          style: titleStyle ??
              textTheme.bodyText2?.copyWith(
                color: titleColor, fontSize: fontSizeTitle, fontWeight: fontWeightTitle,
              ),
        ),
        Container(
          width: 160,
          child: Text(
            subtitle.toUpperCase(),
            textAlign: TextAlign.center,
            style: subtitleStyle ??
                textTheme.bodyText1?.copyWith(
                  color: subtitleColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
          ),
        ),
      ],
    );
  }
}

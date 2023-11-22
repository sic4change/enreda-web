import 'package:auto_route/auto_route.dart';
import 'package:enreda_app/presentation/pages/resources/resources_page.dart';
import 'package:enreda_app/presentation/routes/router.gr.dart';
import 'package:enreda_app/presentation/widgets/dialogs/show_login_menu.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../../utils/functions.dart';
import '../../../../../values/values.dart';
import '../../../../layout/adaptive.dart';
import '../../../../widgets/buttons/enreda_button.dart';
import '../../../../widgets/buttons/social_button.dart';
import '../../../../widgets/empty.dart';
import '../../../../widgets/nav_item.dart';
import '../../../../widgets/enreda_vertical_divider.dart';
import '../../../../widgets/spaces.dart';

const double logoSpaceLeftSm = 10.0;
const double logoSpaceLeftMd = 15.0;
const double logoSpaceLeftLg = 40.0;

const double logoSpaceRightSm = 10.0;
const double logoSpaceRightMd = 15.0;
const double logoSpaceRightLg = 40.0;

const double contactButtonSpaceLeftSm = 10.0;
const double contactButtonSpaceLeftMd = 15.0;
const double contactButtonSpaceLeftLg = 40.0;

const double contactButtonSpaceRightSm = 10.0;
const double contactButtonSpaceRightMd = 15.0;
const double contactButtonSpaceRightLg = 40.0;

const double contactBtnWidthSm = 100.0;
const double contactBtnWidthMd = 110.0;
const double contactBtnWidthLg = 150.0;

const int menuSpacerRightLg = 4;
const int menuSpacerRightMd = 3;
const int menuSpacerRightSm = 2;

class NavSectionWeb extends StatefulWidget {
  NavSectionWeb(
      {required this.navItems,
      required this.switchIsShowingResources,
      required this.isShowingResources});

  final List<NavItemData> navItems;
  final VoidCallback switchIsShowingResources;
  final bool isShowingResources;

  @override
  _NavSectionWebState createState() => _NavSectionWebState();
}

class _NavSectionWebState extends State<NavSectionWeb> {
  late StackRouter router;

  @override
  Widget build(BuildContext context) {
    router = AutoRouter.of(context);
    double logoSpaceLeft =
        responsiveSize(context, logoSpaceLeftSm, logoSpaceLeftLg, sm:logoSpaceLeftSm, md: logoSpaceLeftMd, xl:logoSpaceLeftLg);

    double logoSpaceRight =
        responsiveSize(context, logoSpaceRightSm, logoSpaceRightLg, sm:logoSpaceRightSm, md: logoSpaceRightMd, xl:logoSpaceRightLg );
    double contactBtnSpaceLeft = responsiveSize(
      context,
      contactButtonSpaceLeftSm,
      contactButtonSpaceLeftLg,
      md: contactButtonSpaceLeftMd,
    );
    double contactBtnSpaceRight = responsiveSize(
      context,
      contactButtonSpaceRightSm,
      contactButtonSpaceRightLg,
    );
    double contactBtnWidth = responsiveSize(
      context,
      contactBtnWidthSm,
      contactBtnWidthLg,
      md: contactBtnWidthMd,
    );
    int menuSpacerRight = responsiveSizeInt(
      context,
      menuSpacerRightSm,
      menuSpacerRightLg,
      md: menuSpacerRightMd,
    );

    return Container(
      height: Sizes.HEIGHT_100,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          Shadows.elevationShadow,
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            SizedBox(width: logoSpaceLeft),
            InkWell(
              onTap: () => router.push(HomeRoute()),
              child: Image.asset(
                ImagePath.LOGO_DARK,
                height: Sizes.HEIGHT_52,
              ),
            ),
            SizedBox(width: logoSpaceRight),
            EnredaVerticalDivider(),
            Spacer(flex: 1),
            ..._buildNavItems(widget.navItems),
            Spacer(flex: menuSpacerRight),
            ResponsiveBuilder(
              refinedBreakpoints: RefinedBreakpoints(),
              builder: (context, sizingInformation) {
                double screenWidth = sizingInformation.screenSize.width;
                if (screenWidth < (RefinedBreakpoints().desktopSmall + 450)) {
                  return Empty();
                } else {
                  return Row(
                    children: [
                      ..._buildSocialIcons(Data.socialData),
                      SpaceW20(),
                    ],
                  );
                }
              },
            ),
            EnredaVerticalDivider(),
            SizedBox(width: contactBtnSpaceLeft),
            EnredaButton(
              buttonTitle: StringConst.ACCESS.toUpperCase(),
              buttonColor: AppColors.bluePurple,
              width: contactBtnWidth,
              onPressed: () => showLoginMenu(
                  context,
                  relativePosition: RelativeRect.fromLTRB(double.infinity, 90, 40, 0)
              )
            ),
            SizedBox(width: contactBtnSpaceRight),
          ],
        ),
      ),
    );
  }

  _onTapNavItem({
    required GlobalKey context,
    required String navItemName,
  }) {
    for (int index = 0; index < widget.navItems.length; index++) {
      if (navItemName == widget.navItems[index].name) {
        setState(() {
          widget.navItems[index].isSelected = true;
        });
      } else {
        widget.navItems[index].isSelected = false;
      }
    }

    if (navItemName == StringConst.RESOURCES && !widget.isShowingResources) {
      widget.switchIsShowingResources();
      setState(() {
        ResourcesPage.selectedIndex.value = 0;
      });
    } else if (navItemName != StringConst.RESOURCES &&
        widget.isShowingResources) {
      widget.switchIsShowingResources();
      Future.delayed(Duration(milliseconds: 500))
          .whenComplete(() => scrollToSection(context.currentContext!));
    } else if (navItemName != StringConst.RESOURCES) {
      scrollToSection(context.currentContext!);
    }
  }

  List<Widget> _buildNavItems(List<NavItemData> navItems) {
    List<Widget> items = [];
    for (int index = 0; index < navItems.length; index++) {
      items.add(
        NavItem(
          title: navItems[index].name,
          isSelected: navItems[index].isSelected,
          onTap: () => _onTapNavItem(
            context: navItems[index].key,
            navItemName: navItems[index].name,
          ),
        ),
      );
      items.add(Spacer());
    }
    return items;
  }

  List<Widget> _buildSocialIcons(List<SocialButtonData> socialItems) {
    List<Widget> items = [];
    for (int index = 0; index < socialItems.length; index++) {
      items.add(
        SocialButton(
          tag: socialItems[index].tag,
          iconData: socialItems[index].iconData,
          onPressed: () => openUrlLink(socialItems[index].url),
        ),
      );
      items.add(SpaceW16());
    }
    return items;
  }
}

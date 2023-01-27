import 'package:auto_route/auto_route.dart';
import 'package:enreda_app/presentation/routes/router.gr.dart';
import 'package:enreda_app/presentation/widgets/buttons/enreda_button.dart';
import 'package:enreda_app/presentation/widgets/spaces.dart';
import 'package:enreda_app/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/functions.dart';
import '../../utils/responsive.dart';
import '../../values/values.dart';
import '../layout/adaptive.dart';
import 'nav_item.dart';

const kSpacing20 = Sizes.SIZE_20;

class AppDrawer extends StatefulWidget {
  const AppDrawer({
    this.color = AppColors.white,
    this.width,
    required this.menuList,
    this.onClose,
    required this.switchIsShowingResources,
    required this.isShowingResources,
  });

  final Color color;
  final double? width;
  final List<NavItemData> menuList;
  final GestureTapCallback? onClose;
  final VoidCallback switchIsShowingResources;
  final bool isShowingResources;

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  late StackRouter router;

  @override
  Widget build(BuildContext context) {
    router = AutoRouter.of(context);
    double defaultWidthOfDrawer = responsiveSize(
      context,
      assignWidth(context, 0.85),
      assignWidth(context, 0.60),
      md: assignWidth(context, 0.60),
    );
    return Container(
      width: widget.width ?? defaultWidthOfDrawer,
      child: Drawer(
        child: Container(
          color: widget.color,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(Sizes.PADDING_24),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        ImagePath.LOGO_LIGHT,
                        height: Sizes.HEIGHT_60,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: widget.onClose ?? () => _closeDrawer(),
                      child: Icon(
                        Icons.close,
                        size: Sizes.ICON_SIZE_30,
                        color: AppColors.black400,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  ..._buildMenuList(
                    context: context,
                    menuList: widget.menuList,
                  ),
                ],
              ),
              SpaceH16(),
              InkWell(
                onTap: () {
                  _closeDrawer();
                  AutoRouter.of(context).push(AccessRoute());
                },
                child: Container(
                  color: AppColors.turquoiseUltraLight,
                  padding: EdgeInsets.symmetric(
                    horizontal: Responsive.isMobile(context) ? Sizes.PADDING_28 :Sizes.PADDING_32,
                    vertical: Responsive.isMobile(context) ? Sizes.PADDING_16 :Sizes.PADDING_32,
                  ),
                  child: Row(
                    children: [
                      Text(
                        StringConst.ACCESS_ORG.toUpperCase(),
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: AppColors.greyViolet,
                          fontSize: Sizes.TEXT_SIZE_15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _closeDrawer();
                  openUrlLink(StringConst.WEB_APP_URL);
                },
                child: Container(
                  color: AppColors.bluePurple,
                  padding: EdgeInsets.symmetric(
                    horizontal: Responsive.isMobile(context) ? Sizes.PADDING_28 :Sizes.PADDING_32,
                    vertical: Responsive.isMobile(context) ? Sizes.PADDING_16 :Sizes.PADDING_32,
                  ),
                  child: Row(
                    children: [
                      Text(
                        StringConst.ACCESS.toUpperCase(),
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: AppColors.white,
                              fontSize: Sizes.TEXT_SIZE_15,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(Sizes.PADDING_24),
                child: Column(
                  children: [
                    _buildFooterText(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildMenuList({
    required BuildContext context,
    required List<NavItemData> menuList,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    List<Widget> menuItems = [];
    for (var i = 0; i < menuList.length; i++) {
      menuItems.add(
        NavItem(
          onTap: () => _onTapNavItem(
            context: menuList[i].key,
            navItemName: menuList[i].name,
          ),
          title: menuList[i].name,
          isMobile: true,
          isSelected: menuList[i].isSelected,
          titleStyle: textTheme.bodyText1?.copyWith(
            color:
                menuList[i].isSelected ? AppColors.darkViolet : AppColors.greyDark,
            fontSize: Sizes.TEXT_SIZE_15,
            fontWeight:
                menuList[i].isSelected ? FontWeight.bold : FontWeight.bold,
          ),
        ),
      );
      menuItems.add(SpaceH4());
    }
    return menuItems;
  }

  _onTapNavItem({
    required GlobalKey context,
    required String navItemName,
  }) {
    for (int index = 0; index < widget.menuList.length; index++) {
      if (navItemName == widget.menuList[index].name) {
        setState(() {
          widget.menuList[index].isSelected = true;
        });
      } else {
        widget.menuList[index].isSelected = false;
      }
    }

    if (navItemName == StringConst.RESOURCES && !widget.isShowingResources) {
      widget.switchIsShowingResources();
      _closeDrawer();
    } else if (navItemName != StringConst.RESOURCES &&
        widget.isShowingResources) {
      widget.switchIsShowingResources();
      _closeDrawer();
      Future.delayed(Duration(milliseconds: 500))
          .whenComplete(() => scrollToSection(context.currentContext!));
    } else {
      if (navItemName != StringConst.RESOURCES)
        scrollToSection(context.currentContext!);
      _closeDrawer();
    }
  }

  _closeDrawer() {
    context.router.pop();
  }

  Widget _buildFooterText() {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? footerTextStyle = textTheme.caption?.copyWith(
      color: AppColors.primaryText2,
      fontWeight: FontWeight.bold,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SpaceH4(),
        Center(
          child: InkWell(
            onTap: () => openUrlLink(StringConst.PRIVACITY_URL),
            child: RichText(
              text: TextSpan(
                text: StringConst.RIGHTS_RESERVED + " ",
                style: footerTextStyle,
                children: [
                  TextSpan(text: StringConst.DESIGNED_BY + " "),
                  TextSpan(
                    text: " ",
                    style: footerTextStyle?.copyWith(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w900,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SpaceH4(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: InkWell(
                  onTap: () => openUrlLink(StringConst.USE_CONDITIONS_URL),
                  child: RichText(
                    text: TextSpan(
                      text: StringConst.BUILT_BY + " ",
                      style: footerTextStyle,
                      children: [],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SpaceH4(),
        SpaceH4(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(StringConst.MADE_BY, style: footerTextStyle),
            SpaceW4(),
            Icon(
              FontAwesomeIcons.solidHeart,
              color: AppColors.turquoise,
              size: Sizes.ICON_SIZE_12,
            ),
            SpaceW4(),
            Text(StringConst.WITH_LOVE, style: footerTextStyle),
            SpaceW4(),
            InkWell(
              onTap: () => openUrlLink(StringConst.WEB_SIC4Change),
              child: RichText(
                text: TextSpan(
                  text: " ",
                  style: footerTextStyle,
                  children: [
                    TextSpan(
                      text: StringConst.SIC4CHANGE,
                      style: footerTextStyle?.copyWith(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w900,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

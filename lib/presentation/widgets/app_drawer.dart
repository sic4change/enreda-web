import 'package:auto_route/auto_route.dart';
import 'package:enreda_app/presentation/routes/router.gr.dart';
import 'package:enreda_app/presentation/widgets/buttons/enreda_button.dart';
import 'package:enreda_app/presentation/widgets/dialogs/show_login_menu.dart';
import 'package:enreda_app/presentation/widgets/spaces.dart';
import 'package:enreda_app/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/functions.dart';
import '../../utils/responsive.dart';
import '../../values/values.dart';
import '../layout/adaptive.dart';
import 'nav_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final textTheme = Theme.of(context).textTheme;
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        child: Container(
          color: widget.color,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(Sizes.PADDING_24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
              SpaceH12(),
              Padding(
                padding: const EdgeInsets.only(left: Sizes.PADDING_24, right: 150),
                child: EnredaButtonIconReverse(
                  buttonTitle: AppLocalizations.of(context)!.myAccount.toUpperCase(),
                  widget: Image.asset(ImagePath.LOGIN_PERSON),
                  buttonColor: AppColors.textBlue,
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  titleStyle: textTheme.titleLarge!.copyWith(
                    fontFamily: GoogleFonts.outfit().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                  onPressed: (){
                    _closeDrawer();
                    openUrlLink(StringConst.WEB_APP_URL);
                  }
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Sizes.PADDING_24, left: Sizes.PADDING_24),
                child: Text(
                  'Descárgate la app'.toUpperCase(),
                  style: textTheme.bodyMedium?.copyWith(
                    fontFamily: GoogleFonts.outfit().fontFamily,
                    color: AppColors.black,
                    fontSize: Sizes.TEXT_SIZE_12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: Sizes.PADDING_24, top: 10),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => openUrlLink(StringConst.URL_GOOGLE_PLAY),
                      child: Container(
                          height: 50,
                          width: 130,
                          child: Image.asset(ImagePath.PLAY_STORE)
                      ),
                    ),
                    SpaceW16(),
                    InkWell(
                      onTap: () => openUrlLink(StringConst.URL_APPSTORE),
                      hoverColor: Colors.transparent,
                      child: Container(
                          height: 50,
                          width: 130,
                          child: Image.asset(ImagePath.APP_STORE)
                      ),
                    ),
                  ],
                ),
              ),
              SpaceH40(),
              Padding(
                padding: EdgeInsets.only(top: Sizes.PADDING_24, left: Sizes.PADDING_24),
                child: Text(
                  'Cuenta profesional'.toUpperCase(),
                  style: textTheme.bodyMedium?.copyWith(
                    fontFamily: GoogleFonts.outfit().fontFamily,
                    color: AppColors.textBlue,
                    fontSize: Sizes.TEXT_SIZE_12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                _closeDrawer();
                openUrlLink(StringConst.SOCIAL_ENTITY_URL);
                },
                child: Padding(
                  padding: EdgeInsets.only(top: Sizes.PADDING_24, left: Sizes.PADDING_24),
                  child: Text(
                    'Soy entidad'.toUpperCase(),
                    style: textTheme.bodyMedium?.copyWith(
                      fontFamily: GoogleFonts.outfit().fontFamily,
                      color: AppColors.textBlue,
                      fontSize: Sizes.TEXT_SIZE_12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){

                },
                child: Padding(
                  padding: EdgeInsets.only(top: Sizes.PADDING_24, left: Sizes.PADDING_24),
                  child: Text(
                    'Soy empresa'.toUpperCase(),
                    style: textTheme.bodyMedium?.copyWith(
                      fontFamily: GoogleFonts.outfit().fontFamily,
                      color: AppColors.textBlue,
                      fontSize: Sizes.TEXT_SIZE_12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
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
          titleStyle: textTheme.bodyMedium?.copyWith(
            fontFamily: GoogleFonts.outfit().fontFamily,
            color: menuList[i].isSelected ? AppColors.primary500 : AppColors.greyTxtAlt,
            fontSize: Sizes.TEXT_SIZE_16,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
      menuItems.add(SpaceH44());
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
    widget.switchIsShowingResources();
    _closeDrawer();
  }

  _closeDrawer() {
    context.router.pop();
  }

}

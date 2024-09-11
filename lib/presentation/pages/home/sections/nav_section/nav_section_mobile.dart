import 'package:auto_route/auto_route.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import '../../../../../values/values.dart';
import '../../../../routes/router.gr.dart';
import '../../../../widgets/spaces.dart';

class NavSectionMobile extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const NavSectionMobile({required this.scaffoldKey});

  @override
  State<NavSectionMobile> createState() => _NavSectionMobileState();
}

class _NavSectionMobileState extends State<NavSectionMobile> {
  late StackRouter router;

  @override
  Widget build(BuildContext context) {
    router = AutoRouter.of(context);
    return Container(
      height: Sizes.HEIGHT_90,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SpaceW30(),
          InkWell(
            onTap: () => router.push(HomeRoute()),
            child: Image.asset(
              ImagePath.LOGO_ENREDA_LONG,
              height: Sizes.HEIGHT_48,
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              FeatherIcons.menu,
              color: AppColors.black400,
              size: Sizes.ICON_SIZE_26,
            ),
            onPressed: () {
              if (widget.scaffoldKey.currentState!.isEndDrawerOpen) {
                widget.scaffoldKey.currentState?.openEndDrawer();
              } else {
                widget.scaffoldKey.currentState?.openEndDrawer();
              }
            },
          ),
          SpaceW30(),
        ],
      ),
    );
  }
}

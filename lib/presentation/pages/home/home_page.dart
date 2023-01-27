import 'package:enreda_app/presentation/pages/home/sections/about_me_section.dart';
import 'package:enreda_app/presentation/pages/home/sections/header_section/carrusel_page.dart';
import 'package:enreda_app/presentation/pages/home/sections/message_section.dart';
import 'package:enreda_app/presentation/pages/home/sections/team_section.dart';
import 'package:enreda_app/presentation/pages/home/sections/brand_section.dart';
import 'package:enreda_app/presentation/pages/home/sections/footer_section.dart';
import 'package:enreda_app/presentation/pages/home/sections/nav_section/nav_section_mobile.dart';
import 'package:enreda_app/presentation/pages/home/sections/nav_section/nav_section_web.dart';
import 'package:enreda_app/presentation/pages/home/sections/skills_section.dart';
import 'package:enreda_app/presentation/pages/home/sections/statistics_section.dart';
import 'package:enreda_app/presentation/pages/resources/resources_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../utils/functions.dart';
import '../../../values/values.dart';
import '../../layout/adaptive.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/nav_item.dart';
import '../../widgets/spaces.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );

  // bool isFabVisible = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final ScrollController _scrollController = ScrollController();

  final List<NavItemData> navItems = [
    NavItemData(name: StringConst.HOME, key: GlobalKey(), isSelected: true),
    NavItemData(name: StringConst.EMPTY, key: GlobalKey()),
    NavItemData(name: StringConst.RESOURCES, key: GlobalKey()),
    NavItemData(name: StringConst.EMPTY, key: GlobalKey()),
    NavItemData(name: StringConst.WHO, key: GlobalKey()),
    NavItemData(name: StringConst.EMPTY, key: GlobalKey()),
    NavItemData(name: StringConst.CONTACT, key: GlobalKey()),
  ];

  var _isShowingResources = false;
  late Widget _scaffoldBody;

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels < 100) {
        _controller.reverse();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = heightOfScreen(context);
    double spacerHeight = screenHeight * 0.10;

    if (_isShowingResources) {
      _scaffoldBody = ResourcesPage();
    } else {
      _scaffoldBody = _buildScaffoldBody(spacerHeight, context);
    }

    return Scaffold(
      key: _scaffoldKey,
      drawer: ResponsiveBuilder(
        refinedBreakpoints: RefinedBreakpoints(),
        builder: (context, sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;
          if (screenWidth < RefinedBreakpoints().desktopSmall) {
            return AppDrawer(
              menuList: navItems,
              switchIsShowingResources: _switchIsShowingResources,
              isShowingResources: _isShowingResources,
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: ScaleTransition(
        scale: _animation,
        child: FloatingActionButton(
          backgroundColor: AppColors.darkViolet,
          onPressed: () {
            // Scroll to header section
            scrollToSection(navItems[0].key.currentContext!);
          },
          child: Icon(
            FontAwesomeIcons.arrowUp,
            size: Sizes.ICON_SIZE_18,
            color: AppColors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          ResponsiveBuilder(
            refinedBreakpoints: RefinedBreakpoints(),
            builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;
              if (screenWidth < RefinedBreakpoints().desktopSmall) {
                return NavSectionMobile(scaffoldKey: _scaffoldKey);
              } else {
                return NavSectionWeb(
                  navItems: navItems,
                  switchIsShowingResources: _switchIsShowingResources,
                  isShowingResources: _isShowingResources,
                );
              }
            },
          ),
          Expanded(
            child: _scaffoldBody,
          ),
        ],
      ),
    );
  }

  Widget _buildScaffoldBody(double spacerHeight, BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  CarruselSection(
                      key: navItems[0].key,
                      switchIsShowingResources: _switchIsShowingResources,
                      isShowingResources: _isShowingResources,
                  ),
                  SizedBox(height: spacerHeight),
                  VisibilityDetector(
                    key: Key("about"),
                    onVisibilityChanged: (visibilityInfo) {
                      double visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      if (visiblePercentage > 10) {
                        _controller.forward();
                      }
                    },
                    child: Column(children: [
                      AboutEnredaSection(),
                      SizedBox(height: spacerHeight),
                      SkillsSection(),
                      SizedBox(height: spacerHeight),
                      MessageSection(),
                      SizedBox(height: spacerHeight),
                      StatisticsSection(),
                      SizedBox(height: spacerHeight),
                      Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                key: navItems[4].key,
                                child: TeamSection(),
                              ),
                              SpaceH60(),
                              Container(
                                key: navItems[5].key,
                                child: CompaniesSection(),
                              ),
                              SpaceH40(),
                              //FooterSection(),
                              Container(
                                key: navItems[6].key,
                                child: FooterSection(),
                              ),
                            ],
                          )
                        ],
                      ),
                    ]),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  void _switchIsShowingResources() {
    setState(() {
      _isShowingResources = !_isShowingResources;
    });
  }
}
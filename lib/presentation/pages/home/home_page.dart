import 'package:enreda_app/presentation/pages/home/sections/about_me_section.dart';
import 'package:enreda_app/presentation/pages/home/sections/collaboration_panel.dart';
import 'package:enreda_app/presentation/pages/home/sections/header_section/carrusel_page.dart';
import 'package:enreda_app/presentation/pages/home/sections/message_section.dart';
import 'package:enreda_app/presentation/pages/home/sections/presentation_panel.dart';
import 'package:enreda_app/presentation/pages/home/sections/rebuild_panel.dart';
import 'package:enreda_app/presentation/pages/home/sections/rediscover_panel.dart';
import 'package:enreda_app/presentation/pages/home/sections/sponsors_panel.dart';
import 'package:enreda_app/presentation/pages/home/sections/team_section.dart';
import 'package:enreda_app/presentation/pages/home/sections/brand_section.dart';
import 'package:enreda_app/presentation/pages/home/sections/footer_section.dart';
import 'package:enreda_app/presentation/pages/home/sections/nav_section/nav_section_mobile.dart';
import 'package:enreda_app/presentation/pages/home/sections/nav_section/nav_section_web.dart';
import 'package:enreda_app/presentation/pages/home/sections/skills_section.dart';
import 'package:enreda_app/presentation/pages/home/sections/statistics_section.dart';
import 'package:enreda_app/presentation/pages/jobSearch/job_search_page.dart';
import 'package:enreda_app/presentation/pages/resources/resources_page.dart';
import 'package:enreda_app/presentation/pages/socialEntity/social_entity_page.dart';
import 'package:enreda_app/presentation/pages/talentSearch/talent_search_page.dart';
import 'package:enreda_app/presentation/widgets/enreda_info_section.dart';
import 'package:enreda_app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../utils/functions.dart';
import '../../../values/values.dart';
import '../../layout/adaptive.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/nav_item.dart';
import '../../widgets/spaces.dart';

class HomePage extends StatefulWidget {

  late String? pageSelected;

  HomePage({Key? key, this.pageSelected}) : super(key: key);

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
//    NavItemData(name: StringConst.HOME, key: GlobalKey(), isSelected: true),
//    NavItemData(name: StringConst.EMPTY, key: GlobalKey()),
    NavItemData(name: StringConst.RESOURCES, key: GlobalKey()),
//    NavItemData(name: StringConst.EMPTY, key: GlobalKey()),
//    NavItemData(name: StringConst.WHO, key: GlobalKey()),
//    NavItemData(name: StringConst.EMPTY, key: GlobalKey()),
//    NavItemData(name: StringConst.CONTACT, key: GlobalKey()),
    NavItemData(name: StringConst.JOB_SEARCH, key: GlobalKey()),
    NavItemData(name: StringConst.SOCIAL_ENTITY, key: GlobalKey()),
    NavItemData(name: StringConst.TALENT_SEARCH, key: GlobalKey()),
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
    if(widget.pageSelected != null){
      navItems.firstWhere((element) => element.name == widget.pageSelected).isSelected = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = heightOfScreen(context);
    double spacerHeight = screenHeight * 0.10;


    if (navItems.firstWhere((element) => element.name == StringConst.RESOURCES).isSelected) {
      _scaffoldBody = ResourcesPage();
    } else {
      if(navItems.firstWhere((element) => element.name == StringConst.SOCIAL_ENTITY).isSelected){
        _scaffoldBody = SocialEntityPage();
      } else
      if(navItems.firstWhere((element) => element.name == StringConst.JOB_SEARCH).isSelected){
        _scaffoldBody = JobSearchPage();
      } else
      if(navItems.firstWhere((element) => element.name == StringConst.TALENT_SEARCH).isSelected){
        _scaffoldBody = TalentSearchPage();
      } else
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
                  PresentationPanel(),
                  /*CarruselSection(
                      key: navItems[0].key,
                      switchIsShowingResources: _switchIsShowingResources,
                      isShowingResources: _isShowingResources,
                  ),*/
                  RediscoverPanel(),
                  RebuildPanel(),
                  CollaborationPanel(),
                  SponsorsPanel(),
                  Responsive.isMobile(context) ?
                    _buildFooterMobile(context) :
                    _buildFooter(context),
                  /*VisibilityDetector(
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
                                //key: navItems[4].key,
                                child: TeamSection(),
                              ),
                              SpaceH60(),
                              Container(
                                //key: navItems[5].key,
                                child: CompaniesSection(),
                              ),
                              SpaceH40(),
                              //FooterSection(),
                              Container(
                                //key: navItems[6].key,
                                child: FooterSection(),
                              ),
                            ],
                          )
                        ],
                      ),
                    ]),
                  ),*/
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(top:412.0),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                color: AppColors.skyBlue,
                height: 600,
                width: widthOfScreen(context),
                child: Padding(
                  padding: EdgeInsets.only(right: 100, left: 100, top: 200, bottom: 89),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Image.asset(ImagePath.LOGO_ENREDA_VERTICAL, height: 450),
                            //Menu options
                            Padding(
                              padding: const EdgeInsets.only(left: 100.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildSubMenuItem('Menú', true),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => HomePage(pageSelected: StringConst.RESOURCES,)),
                                      );
                                    },
                                      child: _buildSubMenuItem('Recursos', false)
                                  ),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => HomePage(pageSelected: StringConst.JOB_SEARCH,)),
                                      );
                                    },
                                      child: _buildSubMenuItem('Busco empleo', false)
                                  ),
                                  InkWell(
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => HomePage(pageSelected: StringConst.SOCIAL_ENTITY,)),
                                        );
                                      },
                                      child: _buildSubMenuItem('Entidades', false)
                                  ),
                                  InkWell(
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => HomePage(pageSelected: StringConst.TALENT_SEARCH,)),
                                        );
                                      },
                                      child: _buildSubMenuItem('Busco talento', false)
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Enreda icon

                      //Text and buttons
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Sé parte del cambio,\n¡Enrédate!',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: GoogleFonts.outfit().fontFamily,
                              color: AppColors.textBlue,
                              fontSize: 36,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 260,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: AppColors.textBlue,
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                      onPrimary: AppColors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(33),
                                      ),
                                      textStyle: TextStyle(
                                        fontFamily: GoogleFonts.outfit().fontFamily,
                                        fontSize: 15,
                                        letterSpacing: 1.8,
                                      ),
                                    ),
                                    onPressed: () {
                                      sendEmail(StringConst.DEV_EMAIL);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(22.0),
                                      child:
                                      Center(child: Text('Contacta ahora'.toUpperCase())),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () => openUrlLink(StringConst.LINKED_IN_URL),
                                child: Image.asset(ImagePath.ICON_LINKEDIN, height: 36)
                              ),
                              SpaceW16(),
                              InkWell(
                                onTap: () => openUrlLink(StringConst.INSTAGRAM_URL),
                                child: Image.asset(ImagePath.ICON_INSTAGRAM, height: 36)
                              ),
                              SpaceW16(),
                              InkWell(
                                onTap: () => openUrlLink(StringConst.TWITTER_URL),
                                child: Image.asset(ImagePath.ICON_TWITTER, height: 36)
                              ),
                              SpaceW16(),
                              InkWell(
                                onTap: () => openUrlLink(StringConst.FACEBOOK_URL),
                                child: Image.asset(ImagePath.ICON_FACEBOOK, height: 36)
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                child: _buildJoinCommunityPanel(context),
                top: -400,
              ),
            ],
          ),
          Container(
            color: AppColors.textBlue,
            width: widthOfScreen(context),
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '©SIC4Change',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: GoogleFonts.lato().fontFamily,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => openUrlLink(StringConst.USE_CONDITIONS_URL),
                        child: Text(
                          StringConst.BUILT_BY,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: GoogleFonts.lato().fontFamily,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SpaceW16(),
                      InkWell(
                        onTap: () => openUrlLink(StringConst.PRIVACITY_URL),
                        child: Text(
                          StringConst.RIGHTS_RESERVED,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: GoogleFonts.lato().fontFamily,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFooterMobile(BuildContext context){
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              color: AppColors.skyBlue,
              width: widthOfScreen(context),
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                color: AppColors.textBlue,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    children: [
                      SpaceH80(),
                      Text(
                        'Únete a Enreda y\nconstruye tu futuro\ncon nosotras/os'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          fontFamily: GoogleFonts.outfit().fontFamily,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SpaceH20(),
                      Text(
                        'Descubre cómo transformamos el camino hacia\nel empleo, escuchando y colaborando con\nel ecosistema para crear oportunidades en red.',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          fontFamily: GoogleFonts.lato().fontFamily,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SpaceH30(),
                      _buildEmailFieldYellow(context),
                      SpaceH30(),
                      Container(
                        height: 60,
                        width: 320,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.turquoiseDark,
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                            onPrimary: AppColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(33),
                            ),
                            textStyle: TextStyle(
                              fontFamily: GoogleFonts.outfit().fontFamily,
                              fontSize: 15,
                              letterSpacing: 1.8,
                            ),
                          ),
                          onPressed: () => openUrlLink(StringConst.WEB_APP_URL),
                          child: Padding(
                            padding: EdgeInsets.all(22.0),
                            child:
                            Center(child: Text('Quiero inscribrime ahora'.toUpperCase())),
                          ),
                        ),
                      ),
                      SpaceH36()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          color: AppColors.skyBlue,
          width: widthOfScreen(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpaceH40(),
                Container(
                  width: 50,
                  child: Image.asset(ImagePath.LOGO_ENREDA_BLACK),
                ),
                SpaceH16(),
                _buildSubMenuItem('Menú', true),
                Padding(
                  padding: const EdgeInsets.only(right: 150.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage(pageSelected: StringConst.RESOURCES,)),
                            );
                          },
                          child: _buildSubMenuItem('Recursos', false)
                      ),
                      InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage(pageSelected: StringConst.JOB_SEARCH,)),
                            );
                          },
                          child: _buildSubMenuItem('Busco empleo', false)
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 150.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage(pageSelected: StringConst.SOCIAL_ENTITY,)),
                            );
                          },
                          child: _buildSubMenuItem('Entidades', false)
                      ),
                      InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage(pageSelected: StringConst.TALENT_SEARCH,)),
                            );
                          },
                          child: _buildSubMenuItem('Busco talento', false)
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: AppColors.textBlue,
                ),
                SpaceH20(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Sé parte del cambio,\n¡Enrédate!',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: GoogleFonts.outfit().fontFamily,
                        color: AppColors.textBlue,
                        fontSize: 36,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Container(
                        height: 60,
                        width: 260,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.textBlue,
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                            onPrimary: AppColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(33),
                            ),
                            textStyle: TextStyle(
                              fontFamily: GoogleFonts.outfit().fontFamily,
                              fontSize: 15,
                              letterSpacing: 1.8,
                            ),
                          ),
                          onPressed: () {
                            sendEmail(StringConst.DEV_EMAIL);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(22.0),
                            child:
                            Center(child: Text('Contacta ahora'.toUpperCase())),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () => openUrlLink(StringConst.LINKED_IN_URL),
                              child: Image.asset(ImagePath.ICON_LINKEDIN, height: 36)
                          ),
                          SpaceW16(),
                          InkWell(
                              onTap: () => openUrlLink(StringConst.INSTAGRAM_URL),
                              child: Image.asset(ImagePath.ICON_INSTAGRAM, height: 36)
                          ),
                          SpaceW16(),
                          InkWell(
                              onTap: () => openUrlLink(StringConst.TWITTER_URL),
                              child: Image.asset(ImagePath.ICON_TWITTER, height: 36)
                          ),
                          SpaceW16(),
                          InkWell(
                              onTap: () => openUrlLink(StringConst.FACEBOOK_URL),
                              child: Image.asset(ImagePath.ICON_FACEBOOK, height: 36)
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          color: AppColors.textBlue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => openUrlLink(StringConst.USE_CONDITIONS_URL),
                      child: Text(
                        StringConst.BUILT_BY,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: GoogleFonts.lato().fontFamily,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SpaceW16(),
                    InkWell(
                      onTap: () => openUrlLink(StringConst.PRIVACITY_URL),
                      child: Text(
                        StringConst.RIGHTS_RESERVED,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: GoogleFonts.lato().fontFamily,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 40,
                    child: Image.asset(ImagePath.LOGO_SIC4CHANGE),
                  ),
                ),
              )
            ],
          ),

        )
      ],
    );
  }

  Widget _buildEmailFieldYellow(BuildContext context){
    TextEditingController emailController = TextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Introduce tu email y súmate',
          style: TextStyle(
            color: AppColors.skyBlue,
            fontFamily: GoogleFonts.lato().fontFamily,
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
        Container(
          width: 250,
          child: TextFormField(
            controller: emailController,
            cursorColor: Colors.white,
            decoration: InputDecoration(
                border: InputBorder.none, // Sin borde visible
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                hintText: 'ejemplo@gmail.com',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: GoogleFonts.lato().fontFamily,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                )
            ),
            style: TextStyle(
              color: Colors.white,
              fontFamily: GoogleFonts.lato().fontFamily,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
        ),
        Row(
          children: [
            Container(
              width: Responsive.isMobile(context) ? 200 : 300,
              height: 7.0,
              decoration: BoxDecoration(
                color: AppColors.yellowDark,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
            ),
            SizedBox(width: 5,),
            Container(
              width: 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _buildSubMenuItem(String name, bool isTitle){
    return Padding(
      padding: EdgeInsets.only(bottom: isTitle ? 14 : 6),
      child: Text(
        name,
        style: TextStyle(
          fontFamily: GoogleFonts.lato().fontFamily,
          fontSize: isTitle ? 20 : 14,
          fontWeight: isTitle ? FontWeight.w600 : FontWeight.w400,
          color: AppColors.textBlue,
        ),
      ),
    );
  }

  Widget _buildJoinCommunityPanel(BuildContext context) {
    return Container(
      color: AppColors.textBlue,
      //margin: EdgeInsets.symmetric(horizontal: 100),
      width: widthOfScreen(context)-200,
      height: 550,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.centerLeft,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Únete a Enreda y\nconstruye tu futuro\ncon nosotras/os'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        fontFamily: GoogleFonts.outfit().fontFamily,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,

                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0, bottom: 20),
                      child: _buildEmailFieldYellow(context),
                    ),
                    Container(
                      height: 60,
                      width: 320,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.turquoiseDark,
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                          onPrimary: AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(33),
                          ),
                          textStyle: TextStyle(
                            fontFamily: GoogleFonts.outfit().fontFamily,
                            fontSize: 15,
                            letterSpacing: 1.8,
                          ),
                        ),
                        onPressed: () => openUrlLink(StringConst.WEB_APP_URL),
                        child: Padding(
                          padding: EdgeInsets.all(22.0),
                          child:
                          Center(child: Text('Quiero inscribrime ahora'.toUpperCase())),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Text(
                      'Descubre cómo transformamos el camino hacia\nel empleo, escuchando y colaborando con\nel ecosistema para crear oportunidades en red.',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: GoogleFonts.lato().fontFamily,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              )
            ],
          ),
          Positioned(
            right: 30,
            bottom: -60,
            child: Image.asset(ImagePath.JOIN_GIRL, height: 500),
          ),
        ],
      ),
    );
  }

  void _switchIsShowingResources() {
    setState(() {
     // _isShowingResources = !_isShowingResources;
    });
  }
}
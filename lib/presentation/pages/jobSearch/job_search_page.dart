import 'package:enreda_app/presentation/layout/adaptive.dart';
import 'package:enreda_app/presentation/pages/home/home_page.dart';
import 'package:enreda_app/presentation/widgets/spaces.dart';
import 'package:enreda_app/utils/functions.dart';
import 'package:enreda_app/utils/responsive.dart';
import 'package:enreda_app/values/values.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JobSearchPage extends StatefulWidget {
  @override
  State<JobSearchPage> createState() => _JobSearchPageState();

  static ValueNotifier<int> selectedIndex = ValueNotifier(0);
}

class _JobSearchPageState extends State<JobSearchPage> {

  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context) ?
      _buildJobSearchPageMobile(context) :
      _buildJobSearchPageWeb(context);
  }


  Widget _buildJobSearchPageWeb(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: widthOfScreen(context),
                  //height: 550,
                  child: Image.asset(ImagePath.JOB_SEARCH_PRESENTATION_IMAGE),
                ),
                Positioned(
                  bottom: -widthOfScreen(context)/15,
                  width: widthOfScreen(context)/1.3,
                  child: Image.asset(ImagePath.JOB_SEARCH_PRESENTATION_TEXT),
                )
              ],
            ),
            SpaceH180(),
            Container(
              height: 1000,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 550,
                    child: Container(
                      color: AppColors.textBlue,
                      width: widthOfScreen(context),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 90.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 100.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildBigItemCard(context, ImagePath.ICON_ROCKET_JOB, AppLocalizations.of(context)!.rediscover, AppLocalizations.of(context)!.rediscoverText),
                              _buildBigItemCard(context, ImagePath.ICON_ASTRONAUT, AppLocalizations.of(context)!.reimagine, AppLocalizations.of(context)!.reimagineText),
                              _buildBigItemCard(context, ImagePath.ICON_PUZZLE, AppLocalizations.of(context)!.rebuild, AppLocalizations.of(context)!.rebuildText),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Image.asset(ImagePath.ENTITY_YELLOW_LINE_1),
                    width: widthOfScreen(context),
                    //bottom: widthOfScreen(context) > 1435 ? 800 : 900,
                    bottom: 350,
                  ),
                  Positioned(
                    top: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: widthOfScreen(context)/2.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.jobTitle,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontFamily: GoogleFonts.outfit().fontFamily,
                                    fontSize: 40,
                                    color: AppColors.textBlue,
                                  ),
                                ),
                                SpaceH50(),
                                Text(
                                  AppLocalizations.of(context)!.jobParagraph1,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontSize: 14,
                                    color: AppColors.greyTxtAlt,
                                  ),
                                ),
                                SpaceH12(),
                                Text(
                                  AppLocalizations.of(context)!.jobParagraph2,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontSize: 14,
                                    color: AppColors.greyTxtAlt,
                                  ),
                                ),
                                SpaceH12(),
                                Text(
                                  AppLocalizations.of(context)!.jobParagraph3,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontSize: 14,
                                    color: AppColors.greyTxtAlt,
                                  ),
                                ),
                                SpaceH30(),
                                Container(
                                  height: 60,
                                  width: 400,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: AppColors.buttonBlue,
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                      onPrimary: AppColors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(33),
                                      ),
                                      textStyle: TextStyle(
                                        fontFamily: GoogleFonts.outfit().fontFamily,
                                        fontSize: 16,
                                        letterSpacing: 1.8,
                                      ),
                                    ),
                                    onPressed: () {
                                      openUrlLink(StringConst.WEB_APP_URL);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(22.0),
                                      child:
                                      Center(child: Text(AppLocalizations.of(context)!.joinNow)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SpaceW40(),
                          Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(),
                            width: widthOfScreen(context)/2.5,
                            child: Image.asset(ImagePath.JOB_SEARCH_EXAMPLE_IMAGE)
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 140,
            ),
            Container(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      AppLocalizations.of(context)!.jobItemsTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: GoogleFonts.outfit().fontFamily,
                        fontSize: 45,
                        color: AppColors.textBlue,
                      ),
                    ),
                  ),
                  SpaceH80(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100.0),
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      spacing: 30,
                      runSpacing: 30,
                      children: [
                        _buildSmallItemCard(context, ImagePath.ICON_CHAT, AppLocalizations.of(context)!.chatbot, AppLocalizations.of(context)!.chatbotText),
                        _buildSmallItemCard(context, ImagePath.ICON_COMPETENCIES, AppLocalizations.of(context)!.competencies, AppLocalizations.of(context)!.competenciesText),
                        _buildSmallItemCard(context, ImagePath.ICON_GAMIFICATION, AppLocalizations.of(context)!.gamification, AppLocalizations.of(context)!.gamificationText),
                        _buildSmallItemCard(context, ImagePath.ICON_CV_CREATION, AppLocalizations.of(context)!.cvCreation, AppLocalizations.of(context)!.cvCreationText),
                        _buildSmallItemCard(context, ImagePath.ICON_RESOURCE_ACCESS, AppLocalizations.of(context)!.resourcesAccess, AppLocalizations.of(context)!.resourcesAccessText),
                        _buildSmallItemCard(context, ImagePath.ICON_ENREDA_APP, AppLocalizations.of(context)!.enredaApp, AppLocalizations.of(context)!.enredaAppText),],
                    ),
                  ),
                ],
              ),
            ),
            SpaceH100(),
            _buildFooter(context),
          ],
        )
      );
  }

  Widget _buildJobSearchPageMobile(BuildContext context) {
    double fontSizeTitle = responsiveSize(context, 30, 40);
    double fontSizeBody = responsiveSize(context, 13, 14);
    return SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: widthOfScreen(context),
                  //height: 550,
                  child: Image.asset(ImagePath.JOB_SEARCH_PRESENTATION_IMAGE),
                ),
                Positioned(
                  bottom: -widthOfScreen(context)/15,
                  width: widthOfScreen(context)/1.3,
                  child: Image.asset(ImagePath.JOB_SEARCH_PRESENTATION_TEXT),
                )
              ],
            ),
            SpaceH30(),
            Container(
              height: 1000,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 700,
                    child: Container(
                      color: AppColors.textBlue,
                      width: widthOfScreen(context),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _buildBigItemCardMobile(context, ImagePath.ICON_ROCKET_JOB, AppLocalizations.of(context)!.rediscover, AppLocalizations.of(context)!.rediscoverText),
                              _buildBigItemCardMobile(context, ImagePath.ICON_ASTRONAUT, AppLocalizations.of(context)!.reimagine, AppLocalizations.of(context)!.reimagineText),
                              _buildBigItemCardMobile(context, ImagePath.ICON_PUZZLE, AppLocalizations.of(context)!.rebuild, AppLocalizations.of(context)!.rebuildText),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: widthOfScreen(context),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.jobTitle,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontFamily: GoogleFonts.outfit().fontFamily,
                                    fontSize: fontSizeTitle,
                                    color: AppColors.textBlue,
                                  ),
                                ),
                                SpaceH20(),
                                Text(
                                  AppLocalizations.of(context)!.jobParagraph1,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontSize: fontSizeBody,
                                    color: AppColors.greyTxtAlt,
                                  ),
                                ),
                                SpaceH12(),
                                Text(
                                  AppLocalizations.of(context)!.jobParagraph2,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontSize: fontSizeBody,
                                    color: AppColors.greyTxtAlt,
                                  ),
                                ),
                                SpaceH12(),
                                Text(
                                  AppLocalizations.of(context)!.jobParagraph3,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontSize: fontSizeBody,
                                    color: AppColors.greyTxtAlt,
                                  ),
                                ),
                                SpaceH30(),
                                Container(
                                  height: 60,
                                  width: widthOfScreen(context)*0.6,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: AppColors.buttonBlue,
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                      onPrimary: AppColors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(33),
                                      ),
                                      textStyle: TextStyle(
                                        fontFamily: GoogleFonts.outfit().fontFamily,
                                        fontSize: 16,
                                        letterSpacing: 1.8,
                                      ),
                                    ),
                                    onPressed: () {
                                      openUrlLink(StringConst.WEB_APP_URL);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(22.0),
                                      child:
                                      Center(child: Text(AppLocalizations.of(context)!.joinNow)),
                                    ),
                                  ),
                                ),
                                SpaceH30(),
                                Container(
                                    clipBehavior: Clip.none,
                                    decoration: BoxDecoration(),
                                    width: widthOfScreen(context),
                                    child: Image.asset(ImagePath.JOB_SEARCH_EXAMPLE_IMAGE)
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    child: Image.asset(ImagePath.ENTITY_YELLOW_LINE_1),
                    width: widthOfScreen(context),
                    //bottom: widthOfScreen(context) > 1435 ? 800 : 900,
                    bottom: 300,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1000,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text(
                        AppLocalizations.of(context)!.jobItemsTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontFamily: GoogleFonts.outfit().fontFamily,
                          fontSize: fontSizeTitle,
                          color: AppColors.textBlue,
                        ),
                      ),
                    ),
                    SpaceH30(),
                    Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        _buildSmallItemCardMobile(context, ImagePath.ICON_CHAT, AppLocalizations.of(context)!.chatbot, AppLocalizations.of(context)!.chatbotText),
                        _buildSmallItemCardMobile(context, ImagePath.ICON_COMPETENCIES, AppLocalizations.of(context)!.competencies, AppLocalizations.of(context)!.competenciesText),
                        _buildSmallItemCardMobile(context, ImagePath.ICON_GAMIFICATION, AppLocalizations.of(context)!.gamification, AppLocalizations.of(context)!.gamificationText),
                        _buildSmallItemCardMobile(context, ImagePath.ICON_CV_CREATION, AppLocalizations.of(context)!.cvCreation, AppLocalizations.of(context)!.cvCreationText),
                        _buildSmallItemCardMobile(context, ImagePath.ICON_RESOURCE_ACCESS, AppLocalizations.of(context)!.resourcesAccess, AppLocalizations.of(context)!.resourcesAccessText),
                        _buildSmallItemCardMobile(context, ImagePath.ICON_ENREDA_APP, AppLocalizations.of(context)!.enredaApp, AppLocalizations.of(context)!.enredaAppText),],
                    ),
                  ],
                ),
              ),
            ),
            SpaceH100(),
            _buildFooterMobile(context),
          ],
        )
    );
  }

  Widget _buildBigItemCard(BuildContext context, String icon, String title, String text){
    return Container(
      width: widthOfScreen(context)/5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 180,
            width: 180,
            child: Image.asset(icon),
          ),
          SpaceH30(),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontFamily: GoogleFonts.outfit().fontFamily,
              fontSize: 38,
              color: AppColors.lightBlue,
            ),
          ),
          SpaceH30(),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: GoogleFonts.lato().fontFamily,
              fontSize: 14,
              color: AppColors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBigItemCardMobile(BuildContext context, String icon, String title, String text){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Container(
        width: widthOfScreen(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 180,
              width: 180,
              child: Image.asset(icon),
            ),
            SpaceH30(),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontFamily: GoogleFonts.outfit().fontFamily,
                fontSize: 38,
                color: AppColors.lightBlue,
              ),
            ),
            SpaceH30(),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: GoogleFonts.lato().fontFamily,
                fontSize: 14,
                color: AppColors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallItemCard(BuildContext context, String icon, String title, String text){
    return Container(
      width: widthOfScreen(context)/4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 70,
            width: 70,
            child: Image.asset(icon),
          ),
          SpaceH8(),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontFamily: GoogleFonts.outfit().fontFamily,
              fontSize: 20,
              color: AppColors.textBlue,
            ),
          ),
          SpaceH8(),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.lato().fontFamily,
              fontSize: 12,
              color: AppColors.greyTxtAlt,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }

  Widget _buildSmallItemCardMobile(BuildContext context, String icon, String title, String text){
    return Container(
      width: widthOfScreen(context)/3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 70,
            width: 70,
            child: Image.asset(icon),
          ),
          SpaceH8(),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontFamily: GoogleFonts.outfit().fontFamily,
              fontSize: 20,
              color: AppColors.textBlue,
            ),
          ),
          SpaceH8(),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.lato().fontFamily,
              fontSize: 12,
              color: AppColors.greyTxtAlt,
            ),
            textAlign: TextAlign.start,
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

}


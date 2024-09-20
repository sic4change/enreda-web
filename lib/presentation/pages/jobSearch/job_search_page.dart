import 'package:enreda_app/localization/LocaleProvider.dart';
import 'package:enreda_app/models/trainingPill.dart';
import 'package:enreda_app/presentation/layout/adaptive.dart';
import 'package:enreda_app/presentation/pages/home/home_page.dart';
import 'package:enreda_app/presentation/pages/home/sections/footer_new.dart';
import 'package:enreda_app/presentation/widgets/spaces.dart';
import 'package:enreda_app/services/database.dart';
import 'package:enreda_app/utils/functions.dart';
import 'package:enreda_app/utils/responsive.dart';
import 'package:enreda_app/values/values.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class JobSearchPage extends StatefulWidget {
  @override
  State<JobSearchPage> createState() => _JobSearchPageState();

  static ValueNotifier<int> selectedIndex = ValueNotifier(0);
}

class _JobSearchPageState extends State<JobSearchPage> {
  bool _isVideoVisible = false;
  bool _hoverGooglePlay = false;
  bool _hoverAppStore = false;
  late YoutubePlayerController _controller;

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
    final database = Provider.of<Database>(context, listen: false);
    final localeProvider = Provider.of<LocaleProvider>(context, listen: true);
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
                  bottom: localeProvider.locale == Locale('es') ? -widthOfScreen(context)/15 : -widthOfScreen(context)/18,
                  width: widthOfScreen(context)/1.3,
                  child: localeProvider.locale == Locale('es') ? Image.asset(ImagePath.JOB_SEARCH_PRESENTATION_TEXT) : Image.asset(ImagePath.JOB_SEARCH_PRESENTATION_TEXT_EN),
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
                                      backgroundColor: AppColors.buttonBlue,
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                      foregroundColor: AppColors.white,
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
                            child: StreamBuilder<TrainingPill>(
                              stream: database.trainingPillStreamById('RSZTAJ8gzW2ZV4JRAzz9'),
                              builder: (context, snapshot) {
                                TrainingPill? trainingPill = snapshot.data;
                                if(snapshot.hasData)
                                  return playAreaDesktop(trainingPill!);
                                else{
                                  return Image.asset(ImagePath.JOB_SEARCH_EXAMPLE_IMAGE);
                                }
                              }
                            )
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
                  _buildDownloadSectionWeb(context),
                  SpaceH80(),
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
                  SpaceH40(),
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
            FooterNew(),
          ],
        )
      );
  }

  Widget _buildJobSearchPageMobile(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    final localeProvider = Provider.of<LocaleProvider>(context, listen: true);
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
                  bottom: localeProvider.locale == Locale('es') ? -widthOfScreen(context)/15 : -widthOfScreen(context)/19,
                  width: widthOfScreen(context)/1.3,
                  child: localeProvider.locale == Locale('es') ? Image.asset(ImagePath.JOB_SEARCH_PRESENTATION_TEXT) : Image.asset(ImagePath.JOB_SEARCH_PRESENTATION_TEXT_EN),
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
                    child: Image.asset(ImagePath.ENTITY_YELLOW_LINE_1),
                    width: widthOfScreen(context),
                    //bottom: widthOfScreen(context) > 1435 ? 800 : 900,
                    bottom: 300,
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
                                      backgroundColor: AppColors.buttonBlue,
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                      foregroundColor: AppColors.white,
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
                                    child: StreamBuilder<TrainingPill>(
                                        stream: database.trainingPillStreamById('RSZTAJ8gzW2ZV4JRAzz9'),
                                        builder: (context, snapshot) {
                                          TrainingPill? trainingPill = snapshot.data;
                                          if(snapshot.hasData)
                                            return playAreaDesktop(trainingPill!);
                                          else{
                                            return Image.asset(ImagePath.JOB_SEARCH_EXAMPLE_IMAGE);
                                          }
                                        }
                                    )
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1000,
            ),
            _buildDownloadSectionMobile(context),
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
            FooterNew(),
          ],
        )
    );
  }
  
  Widget _buildDownloadSectionWeb(BuildContext context){
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          bottom: -85,
          child: Container(
            width: widthOfScreen(context),
            child: Image.asset(ImagePath.BLUE_LINE_DOWNLOAD),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 180.0),
          child: Row(
            children: [
              Container(
                width: widthOfScreen(context)*0.25,
                child: Image.asset(ImagePath.DOWNLOAD_SECTION_IMAGE)
              ),
              SpaceW60(),
              Container(
                width: widthOfScreen(context)*0.45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.downloadTitle,
                      style: TextStyle(
                        height: 1.2,
                        fontWeight: FontWeight.w900,
                        fontFamily: GoogleFonts.outfit().fontFamily,
                        fontSize: 45,
                        color: AppColors.textBlue,
                      ),
                    ),
                    SpaceH8(),
                    Text(
                      AppLocalizations.of(context)!.downloadText1,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: GoogleFonts.lato().fontFamily,
                        fontSize: 12,
                        color: AppColors.greyTxtAlt,
                      ),
                    ),
                    SpaceH16(),
                    Text(
                      AppLocalizations.of(context)!.downloadText2,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: GoogleFonts.lato().fontFamily,
                        fontSize: 12,
                        color: AppColors.greyTxtAlt,
                      ),
                    ),
                    SpaceH30(),
                    Row(
                      children: [
                        InkWell(
                          onTap: () => openUrlLink(StringConst.URL_GOOGLE_PLAY),
                          onHover: (value){
                            setState(() {
                              _hoverGooglePlay = value;
                            });
                          },
                          hoverColor: Colors.transparent,
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.bounceOut,
                            height: _hoverGooglePlay ? 80 : 65,
                            width: _hoverGooglePlay ? 300 : 260,
                            child: Image.asset(ImagePath.PLAY_STORE)
                          ),
                        ),
                        InkWell(
                          onTap: () => openUrlLink(StringConst.URL_APPSTORE),
                          onHover: (value){
                            setState(() {
                              _hoverAppStore = value;
                            });
                          },
                          hoverColor: Colors.transparent,
                          child: AnimatedContainer(
                              curve: Curves.bounceOut,
                            duration: Duration(seconds: 1),
                            height: _hoverAppStore ? 80 : 65,
                            width: _hoverAppStore ? 300 : 260,
                            child: Image.asset(ImagePath.APP_STORE)
                          ),
                        ),
                      ],
                    ),
                    SpaceH100(),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDownloadSectionMobile(BuildContext context){
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: 250,
          child: Container(
            width: widthOfScreen(context),
            child: Image.asset(ImagePath.BLUE_LINE_DOWNLOAD),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            children: [
              Container(
                  width: widthOfScreen(context)*0.8,
                  child: Image.asset(ImagePath.DOWNLOAD_SECTION_IMAGE)
              ),
              SpaceW60(),
              Container(
                width: widthOfScreen(context)*0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.downloadTitle,
                      style: TextStyle(
                        height: 1.2,
                        fontWeight: FontWeight.w900,
                        fontFamily: GoogleFonts.outfit().fontFamily,
                        fontSize: 40,
                        color: AppColors.textBlue,
                      ),
                    ),
                    SpaceH8(),
                    Text(
                      AppLocalizations.of(context)!.downloadText1,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: GoogleFonts.lato().fontFamily,
                        fontSize: 12,
                        color: AppColors.greyTxtAlt,
                      ),
                    ),
                    SpaceH16(),
                    Text(
                      AppLocalizations.of(context)!.downloadText2,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: GoogleFonts.lato().fontFamily,
                        fontSize: 12,
                        color: AppColors.greyTxtAlt,
                      ),
                    ),
                    SpaceH30(),
                    Column(
                      children: [
                        InkWell(
                          onTap: () => openUrlLink(StringConst.URL_GOOGLE_PLAY),
                          child: Container(
                              height: 65,
                              width: 260,
                              child: Image.asset(ImagePath.PLAY_STORE)
                          ),
                        ),
                        SpaceH20(),
                        InkWell(
                          onTap: () => openUrlLink(StringConst.URL_APPSTORE),
                          hoverColor: Colors.transparent,
                          child: Container(
                              height: 65,
                              width: 260,
                              child: Image.asset(ImagePath.APP_STORE)
                          ),
                        ),
                      ],
                    ),
                    SpaceH30(),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
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

  Widget playAreaDesktop(TrainingPill trainingPill) {
    String urlYoutubeVideo = trainingPill.urlVideo;
    String idYoutubeVideo =
    urlYoutubeVideo.substring(urlYoutubeVideo.length - 11);
    if (!_isVideoVisible)
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: InkWell(
          onTap: () async {
            setState(() {
              setState(() {
                _isVideoVisible = !_isVideoVisible;
                _initializeVideo(idYoutubeVideo);
              });
            });
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.textBlue),
                  image: DecorationImage(
                    image: NetworkImage(
                      YoutubePlayerController.getThumbnail(
                        videoId: idYoutubeVideo,
                        quality: ThumbnailQuality.max,
                      ),
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                  borderRadius: Responsive.isMobile(context)
                      ? BorderRadius.circular(10)
                      : BorderRadius.all(Radius.circular(10)),
                ),
              ),
              Center(
                child: Icon(
                  Icons.play_circle_rounded,
                  color: AppColors.textBlue.withOpacity(0.5),
                  size: 70,
                ),
              ),
            ],
          ),
        ),
      );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      child: YoutubePlayerControllerProvider(
        // Provides controller to all the widget below it.
          controller: _controller,
          child: YoutubePlayer(
            controller: _controller,
            aspectRatio: 16 / 9,
          )),
    );
  }

  _initializeVideo(String id) {
    // Generate a new controller and set as global _controller
    final controller = YoutubePlayerController.fromVideoId(
      videoId: id,
      autoPlay: true,
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
      ),
    );
    setState(() {
      _controller = controller;
      if (_isVideoVisible == false) {
        _isVideoVisible = true;
      }
    });
    if (!kIsWeb) {
      _controller..setFullScreenListener(
            (_) async {
          final videoData = await _controller.videoData;
          final startSeconds = await _controller.currentTime;
          final currentTime =
          await FullscreenYoutubePlayer.launch(
            context,
            videoId: videoData.videoId,
            startSeconds: startSeconds,
          );
          if (currentTime != null) {
            _controller.seekTo(seconds: currentTime);
          }
          _controller.seekTo(seconds: currentTime!);
        },
      );
    }
  }


}


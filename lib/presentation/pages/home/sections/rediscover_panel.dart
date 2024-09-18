import 'package:enreda_app/presentation/pages/home/home_page.dart';
import 'package:enreda_app/presentation/widgets/buttons/enreda_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../utils/functions.dart';
import '../../../../utils/responsive.dart';
import '../../../../values/values.dart';
import '../../../layout/adaptive.dart';
import '../../../widgets/buttons/social_button_2.dart';
import '../../../widgets/content_area.dart';
import '../../../widgets/enreda_info_section.dart';
import '../../../widgets/spaces.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const double kSpacingSm = 40.0;
const double kRunSpacingSm = 24.0;
const double kSpacingLg = 24.0;
const double kRunSpacingLg = 16.0;

class RediscoverPanel extends StatefulWidget {
  RediscoverPanel({Key? key});
  @override
  _RediscoverPanelState createState() => _RediscoverPanelState();
}

class _RediscoverPanelState extends State<RediscoverPanel> {

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
    double screenWidth = widthOfScreen(context) - getSidePadding(context);
    double screenHeight = heightOfScreen(context);
    double contentAreaWidthSm = screenWidth * 1.0;
    double contentAreaHeightSm = screenHeight * 0.7;
    double contentAreaWidthLg = screenWidth * 0.5;
    return Container(
      //height: Responsive.isMobile(context) ? screenHeight : contentAreaHeightSm,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
        child:
        Responsive.isMobile(context) ?
        _buildMobilePage(context) :
        _buildWebPage(context),

      );
  }


  Widget _buildWebPage(BuildContext context){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 70),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: widthOfScreen(context)/2.5,
                child: Text(
                  AppLocalizations.of(context)!.techText,
                  style: TextStyle(
                    fontFamily: GoogleFonts.outfit().fontFamily,
                    fontSize: 46,
                    color: AppColors.textBlue,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Container(
                width: widthOfScreen(context)/2.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.techParagraph1,
                      style: TextStyle(
                        fontFamily: GoogleFonts.lato().fontFamily,
                        fontSize: 16,
                        color: AppColors.greyTxtAlt,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SpaceH20(),
                    Text(
                      AppLocalizations.of(context)!.techParagraph2,
                      style: TextStyle(
                        fontFamily: GoogleFonts.lato().fontFamily,
                        fontSize: 16,
                        color: AppColors.greyTxtAlt,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SpaceH20(),
                    Text(
                      AppLocalizations.of(context)!.techParagraph3,
                      style: TextStyle(
                        fontFamily: GoogleFonts.lato().fontFamily,
                        fontSize: 16,
                        color: AppColors.greyTxtAlt,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SpaceH20(),
                    Text(
                      AppLocalizations.of(context)!.techParagraph4,
                      style: TextStyle(
                        fontFamily: GoogleFonts.lato().fontFamily,
                        fontSize: 16,
                        color: AppColors.greyTxtAlt,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              color: Colors.transparent,
            ),
            Positioned(
              child: Container(
                color: AppColors.textBlue,
                width: widthOfScreen(context),
                //height: heightOfScreen(context)+100,
                child: Padding(
                    padding: EdgeInsets.only(top: widthOfScreen(context)/6),
                    child: Container(
                      color: AppColors.textBlue,
                      height: 150,
                    )
                ),
              ),
              bottom: -200,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: Image.asset(
                ImagePath.REDISCOVER_IMAGE,
              ),
            ),
            Positioned(
              child: Image.asset(ImagePath.REDISCOVER_TEXT),
              width: widthOfScreen(context)/1.1,
              bottom: -widthOfScreen(context)/15,
            ),
          ],
        ),
        Container(
          color: Colors.transparent,
          height: 140,
        ),
        Container(
          color: AppColors.textBlue,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                optionsCard(
                    AppColors.brightBlue,
                    ImagePath.REDISCOVER_PARTICIPANT_ICON,
                    AppLocalizations.of(context)!.participant,
                    AppLocalizations.of(context)!.participantSubtitle.toUpperCase(),
                    AppLocalizations.of(context)!.participantText,
                        (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage(pageSelected: StringConst.JOB_SEARCH)),
                      );
                    }
                ),
                optionsCard(
                    AppColors.yellowDark,
                    ImagePath.REDISCOVER_SOCIAL_ENTITY_ICON,
                    AppLocalizations.of(context)!.socialEntities,
                    AppLocalizations.of(context)!.socialEntitiesSubtitle.toUpperCase(),
                    AppLocalizations.of(context)!.socialEntitiesText,
                        (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage(pageSelected: StringConst.SOCIAL_ENTITY)),
                      );
                    }
                ),
                optionsCard(
                    AppColors.lightBlue,
                    ImagePath.REDISCOVER_COMPANY_ICON,
                    AppLocalizations.of(context)!.companies,
                    AppLocalizations.of(context)!.companiesSubtitle.toUpperCase(),
                    AppLocalizations.of(context)!.companiesText,
                        (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage(pageSelected: StringConst.TALENT_SEARCH)),
                      );
                    }
                ),
              ]
          ),
        ),
        SpaceH20(),
        Padding(
          padding: const EdgeInsets.only( left: 100, right: 100),
          child: Container(
            width: widthOfScreen(context),
            height: heightOfScreen(context)*0.8,
            child: Container(
                height: 430,
                child: Image.asset(ImagePath.REIMAGINE_TITLE_IMAGE)),
          ),
        ),
      ],
    );
  }

  Widget _buildMobilePage(BuildContext context){
    double fontSizeTitle = responsiveSize(context, 30, 46);
    double fontSizeBody = responsiveSize(context, 13, 16);
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  //width: widthOfScreen(context)/2.5,
                  child: Text(
                    AppLocalizations.of(context)!.techText,
                    style: TextStyle(
                      fontFamily: GoogleFonts.outfit().fontFamily,
                      fontSize: fontSizeTitle,
                      color: AppColors.textBlue,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Container(
                  //width: widthOfScreen(context)/2.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.techParagraph1,
                        style: TextStyle(
                          fontFamily: GoogleFonts.lato().fontFamily,
                          fontSize: fontSizeBody,
                          color: AppColors.greyTxtAlt,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SpaceH20(),
                      Text(
                        AppLocalizations.of(context)!.techParagraph2,
                        style: TextStyle(
                          fontFamily: GoogleFonts.lato().fontFamily,
                          fontSize: fontSizeBody,
                          color: AppColors.greyTxtAlt,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SpaceH20(),
                      Text(
                        AppLocalizations.of(context)!.techParagraph3,
                        style: TextStyle(
                          fontFamily: GoogleFonts.lato().fontFamily,
                          fontSize: fontSizeBody,
                          color: AppColors.greyTxtAlt,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SpaceH20(),
                      Text(
                        AppLocalizations.of(context)!.techParagraph4,
                        style: TextStyle(
                          fontFamily: GoogleFonts.lato().fontFamily,
                          fontSize: fontSizeBody,
                          color: AppColors.greyTxtAlt,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                color: Colors.transparent,
              ),
              Positioned(
                child: Container(
                  color: AppColors.textBlue,
                  width: widthOfScreen(context),
                  //height: heightOfScreen(context)+100,
                  child: Padding(
                      padding: EdgeInsets.only(top: widthOfScreen(context)/6),
                      child: Container(
                        color: AppColors.textBlue,
                        height: 150,
                      )
                  ),
                ),
                bottom: -200,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Image.asset(
                  ImagePath.REDISCOVER_IMAGE,
                ),
              ),
              Positioned(
                child: Image.asset(ImagePath.REDISCOVER_TEXT),
                width: widthOfScreen(context)/1.1,
                bottom: -widthOfScreen(context)/15,
              ),
            ],
          ),
          Container(
            color: Colors.transparent,
            height: 50,
          ),
          Container(
            color: AppColors.textBlue,
            width: widthOfScreen(context),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  optionsCard(
                      AppColors.brightBlue,
                      ImagePath.REDISCOVER_PARTICIPANT_ICON,
                      AppLocalizations.of(context)!.participant,
                      AppLocalizations.of(context)!.participantSubtitle.toUpperCase(),
                      AppLocalizations.of(context)!.participantText,
                          (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage(pageSelected: StringConst.JOB_SEARCH)),
                        );
                      }
                  ),
                  optionsCard(
                      AppColors.yellowDark,
                      ImagePath.REDISCOVER_SOCIAL_ENTITY_ICON,
                      AppLocalizations.of(context)!.socialEntities,
                      AppLocalizations.of(context)!.socialEntitiesSubtitle.toUpperCase(),
                      AppLocalizations.of(context)!.socialEntitiesText,
                          (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage(pageSelected: StringConst.SOCIAL_ENTITY)),
                        );
                      }
                  ),
                  optionsCard(
                      AppColors.lightBlue,
                      ImagePath.REDISCOVER_COMPANY_ICON,
                      AppLocalizations.of(context)!.companies,
                      AppLocalizations.of(context)!.companiesSubtitle.toUpperCase(),
                      AppLocalizations.of(context)!.companiesText,
                          (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage(pageSelected: StringConst.TALENT_SEARCH)),
                        );
                      }
                  ),
                ]
            ),
          ),
          //SpaceH20(),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 50),
            child: Container(
              width: widthOfScreen(context),
              //height: heightOfScreen(context)*0.8,
              child: Container(
                  //height: 430,
                  child: Image.asset(ImagePath.REIMAGINE_TITLE_IMAGE)),
            ),
          ),
        ],
      );
  }

  Widget optionsCard(Color color, String icon, String title, String subtitle, String text, Function onTap){
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0, top:30),
      child: Container(
        //height: 650,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white
                ),
                child: Image.asset(
                  icon,
                  width: 90,
                  height: 90,
                ),
              ),
              SpaceH20(),
              Text(
                title,
                style: TextStyle(
                  fontFamily: GoogleFonts.outfit().fontFamily,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: AppColors.textBlue
                ),
              ),
              SpaceH12(),
              Text(
                subtitle,
                style: TextStyle(
                  fontFamily: GoogleFonts.outfit().fontFamily,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: AppColors.greyTxtAlt,
                ),
              ),
              SpaceH12(),
              Text(
                text,
                style: TextStyle(
                    fontFamily: GoogleFonts.lato().fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.textBlue,
                    height: 1.4
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: EnredaButton(
                    buttonTitle: AppLocalizations.of(context)!.viewMore.toUpperCase(),
                    buttonColor: AppColors.turquoise,
                    titleColor: AppColors.white,
                    opensUrl: false,
                    onPressed: () {
                      onTap();
                    },
                    borderRadius: BorderRadius.all(Radius.circular(33)),
                    width: 260,
                    height: 65,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

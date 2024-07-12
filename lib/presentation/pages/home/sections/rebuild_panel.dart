import 'package:enreda_app/presentation/pages/home/sections/statistics_section.dart';
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

class RebuildPanel extends StatefulWidget {
  RebuildPanel({Key? key});
  @override
  _RebuildPanelState createState() => _RebuildPanelState();
}

class _RebuildPanelState extends State<RebuildPanel> {

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
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                Container(
                  width: widthOfScreen(context),
                  color: AppColors.lightBlue,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        width: widthOfScreen(context)*0.8,
                        child: Image.asset(ImagePath.REBUILD_MAP)
                    ),
                  ),
                ),
                Container(
                  width: widthOfScreen(context),
                  height: 600,
                  color: AppColors.textBlue,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50.0, top:100),
                    child: StatisticsSection(),
                  ),
                ),
              ],
            ),
            Positioned(
              right: widthOfScreen(context)*0.1,
              top:100,
              bottom: 700,
              child: Container(
                  width: widthOfScreen(context)*0.2,
                  child: Image.asset(ImagePath.REBUILD_CARD_ITEM)
              ),
            ),
            Positioned(
              bottom: 500,
              child: Container(
                  width: widthOfScreen(context)-200,
                  child: Image.asset(ImagePath.REBUILD_TITLE_IMAGE)
              ),
            ),

          ],
        ),
      ],
    );
  }

  Widget _buildMobilePage(BuildContext context){
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                Container(
                  width: widthOfScreen(context),
                  color: AppColors.lightBlue,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        width: widthOfScreen(context)*0.95,
                        child: Image.asset(ImagePath.REBUILD_MAP)
                    ),
                  ),
                ),
                Container(
                  width: widthOfScreen(context),
                  height: 1250,
                  color: AppColors.textBlue,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: StatisticsSection()
                    /*Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SpaceH30(),
                        numberCountTileMobile(856, AppLocalizations.of(context)!.daysTransforming, AppColors.brightBlueNumber),
                        numberCountTileMobile(350, AppLocalizations.of(context)!.participant, AppColors.white),
                        numberCountTileMobile(30, AppLocalizations.of(context)!.institutionsAndCompanies, AppColors.brightBlueNumber),
                        numberCountTileMobile(2401, AppLocalizations.of(context)!.resourcesEnabled, AppColors.white),
                      ],
                    ),*/
                  ),
                ),
              ],
            ),
            Positioned(
              left: 260,
              top: 30,
              bottom: 1300,
              child: Container(
                  width: 200,
                  //height: 300,
                  child: Image.asset(ImagePath.REBUILD_CARD_ITEM)
              ),
            ),
            Positioned(
              bottom: 1230,
              child: Container(
                  width: widthOfScreen(context)-60,
                  child: Image.asset(ImagePath.REBUILD_TITLE_IMAGE)
              ),
            ),

          ],
        ),
      ],
    );
  }

  Widget numberCountTile(int num, String text, Color color){
    return Container(
      height: 380,
      width: widthOfScreen(context)/5,
      decoration:  BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          const Radius.circular(60.0),
        ),
        border: Border.all(
          color: color,
          width: 2,
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              num.toString(),
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.w700,
                fontFamily: GoogleFonts.outfit().fontFamily,
                color: color,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                fontFamily: GoogleFonts.outfit().fontFamily,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget numberCountTileMobile(int num, String text, Color color){
    double fontSizeTitle = responsiveSize(context, 50, 80);
    double fontSizeBody = responsiveSize(context, 20, 26);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
      child: Container(
        height: 250,
        width: widthOfScreen(context)-120,
        decoration:  BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
              const Radius.circular(60.0),
            ),
            border: Border.all(
              color: color,
              width: 2,
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                num.toString(),
                style: TextStyle(
                  fontSize: fontSizeTitle,
                  fontWeight: FontWeight.w700,
                  fontFamily: GoogleFonts.outfit().fontFamily,
                  color: color,
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: fontSizeBody,
                  fontWeight: FontWeight.w700,
                  fontFamily: GoogleFonts.outfit().fontFamily,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

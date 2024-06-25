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
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              //margin: const EdgeInsets.all(30.0),
              child: ContentArea(
                width: contentAreaWidthSm,
                child: _buildAboutMe(
                  width: contentAreaWidthSm,
                  height: contentAreaHeightSm,
                ),
              ),
            ),

            ContentArea(
              width: widthOfScreen(context),
              child: _buildImage(
                width: widthOfScreen(context),
                //height: contentAreaHeightSm * 0.6,
              ),
            ),
          ],
        ) :
        Column(
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
                        padding: const EdgeInsets.only(bottom: 50.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            numberCountTile(856, AppLocalizations.of(context)!.daysTransforming, AppColors.brightBlueNumber),
                            numberCountTile(350, AppLocalizations.of(context)!.participant, AppColors.white),
                            numberCountTile(30, AppLocalizations.of(context)!.institutionsAndCompanies, AppColors.brightBlueNumber),
                            numberCountTile(2401, AppLocalizations.of(context)!.resourcesEnabled, AppColors.white),
                          ],
                        ),
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
                  bottom: widthOfScreen(context)*0.36,
                  child: Container(
                      width: widthOfScreen(context)-200,
                      child: Image.asset(ImagePath.REBUILD_TITLE_IMAGE)
                  ),
                ),

              ],
            ),
          ],
        ),

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


  Widget _buildImage({width, height}) {

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Image.asset(
            ImagePath.REDISCOVER_IMAGE,
            width: width,
            height: height,
          ),
        ),
      ],
    );
  }

  Widget _buildAboutMe({
    required double width,
    required double height,
  }) {
    return ResponsiveBuilder(
      refinedBreakpoints: RefinedBreakpoints(),
      builder: (context, sizingInformation) {
        double screenWidth = sizingInformation.screenSize.width;
        if (screenWidth < (RefinedBreakpoints().tabletNormal)) {
          return enredaInfoSectionSm(width: width, height: height);
        } else {
          //This container takes 85% of the space and leave 15% as spacing
          //between the blob and the content
          return Container(
            width: width * 0.75,
            height: height,
            child: enredaInfoSectionLg(),
          );
        }
      },
    );
  }


  Widget enredaInfoSectionLg() {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        EnredaInfoSection6(
          title1: 'Tu futuro está lleno de oportunidades. ¡Atrévete a avanzar y alcanzar tus metas!',
          buttonTitle: 'Prueba de boton',
        ),
      ],
    );
  }

  Widget enredaInfoSectionSm({required double width, required double height}) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: height,
      child: EnredaInfoSection6(
        title1: 'Tu futuro está lleno de oportunidades. ¡Atrévete a avanzar y alcanzar tus metas!',
        buttonTitle: 'Prueba de boton',
      ),
    );
  }
}

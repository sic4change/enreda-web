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

class SponsorsPanel extends StatefulWidget {
  SponsorsPanel({Key? key});
  @override
  _SponsorsPanelState createState() => _SponsorsPanelState();
}

class _SponsorsPanelState extends State<SponsorsPanel> {

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
              child: Container(),
            ),
          ],
        ) :
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 90),
          child: Container(
            width: widthOfScreen(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    AppLocalizations.of(context)!.byHand,
                    style: TextStyle(
                      color: AppColors.textBlue,
                      fontFamily: GoogleFonts.outfit().fontFamily,
                      fontWeight: FontWeight.w800,
                      fontSize: 46,
                    ),
                  ),
                ),
                SpaceH20(),
                Text(
                  AppLocalizations.of(context)!.enredadas,
                  style: TextStyle(
                    color: AppColors.textBlue,
                    fontFamily: GoogleFonts.outfit().fontFamily,
                    fontWeight: FontWeight.w100,
                    fontSize: 46,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: widthOfScreen(context)/8,
                        child: Image.asset(ImagePath.FINANCIER_1)),
                    Container(
                        width: widthOfScreen(context)/8,
                        child: Image.asset(ImagePath.FINANCIER_1)),
                    Container(
                        width: widthOfScreen(context)/8,
                        child: Image.asset(ImagePath.FINANCIER_1)),
                    Container(
                        width: widthOfScreen(context)/8,
                        child: Image.asset(ImagePath.FINANCIER_1)),
                    Container(
                        width: widthOfScreen(context)/8,
                        child: Image.asset(ImagePath.FINANCIER_1)),
                    Container(
                        width: widthOfScreen(context)/8,
                        child: Image.asset(ImagePath.FINANCIER_1)),
                  ],
                ),
                SpaceH20(),
                Text(
                  AppLocalizations.of(context)!.funders,
                  style: TextStyle(
                    color: AppColors.textBlue,
                    fontFamily: GoogleFonts.outfit().fontFamily,
                    fontWeight: FontWeight.w100,
                    fontSize: 40,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: widthOfScreen(context)/8,
                        child: Image.asset(ImagePath.FINANCIER_1)),
                    Container(
                        width: widthOfScreen(context)/8,
                        child: Image.asset(ImagePath.FINANCIER_1)),
                    Container(
                        width: widthOfScreen(context)/8,
                        child: Image.asset(ImagePath.FINANCIER_1)),
                    Container(
                        width: widthOfScreen(context)/8,
                        child: Image.asset(ImagePath.FINANCIER_1)),
                    Container(
                        width: widthOfScreen(context)/8,
                        child: Image.asset(ImagePath.FINANCIER_1)),
                    Container(
                        width: widthOfScreen(context)/8,
                        child: Image.asset(ImagePath.FINANCIER_1)),
                  ],
                ),
              ],
            ),
          ),
        ),

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

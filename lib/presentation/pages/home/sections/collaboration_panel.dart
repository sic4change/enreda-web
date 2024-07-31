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

class CollaborationPanel extends StatefulWidget {
  CollaborationPanel({Key? key});
  @override
  _CollaborationPanelState createState() => _CollaborationPanelState();
}

class _CollaborationPanelState extends State<CollaborationPanel> {

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 200.0, vertical: 90),
      child: Container(
        width: widthOfScreen(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Impulsado por...',
              style: TextStyle(
                color: AppColors.textBlue,
                fontFamily: GoogleFonts.outfit().fontFamily,
                fontWeight: FontWeight.w800,
                fontSize: 46,
              ),
            ),
            SpaceH12(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: widthOfScreen(context)/4,
                  child: Text(
                    'Enreda nace de la colaboración entre Sic4Change y Proyecto Kieu, con el objetivo de impulsar el talento y fomentar el empleo. Juntos, proponemos un un cambio de paradigma basado en competencias y enfoque territorial.',
                    style: TextStyle(
                      color: AppColors.textBlue,
                      fontFamily: GoogleFonts.lato().fontFamily,
                      fontWeight: FontWeight.w400,
                      fontSize: 28,
                    ),
                  ),
                ),
                Container(
                  width: widthOfScreen(context)/6,
                  child: Image.asset(ImagePath.LOGO_SIC_4_CHANGE),
                ),
                Container(
                  width: widthOfScreen(context)/6,
                  child: Image.asset(ImagePath.LOGO_PROYECTO_KIEU),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobilePage(BuildContext context){
    double fontSizeTitle = responsiveSize(context, 30, 46);
    double fontSizeBody = responsiveSize(context, 20, 30);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
      child: Container(
        width: widthOfScreen(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Impulsado por...',
              style: TextStyle(
                color: AppColors.textBlue,
                fontFamily: GoogleFonts.outfit().fontFamily,
                fontWeight: FontWeight.w800,
                fontSize: fontSizeTitle,
              ),
            ),
            SpaceH12(),
            Container(
              child: Text(
                'Enreda nace de la colaboración entre Sic4Change y Proyecto Kieu, con el objetivo de impulsar el talento y fomentar el empleo. Juntos, proponemos un un cambio de paradigma basado en competencias y enfoque territorial.',
                style: TextStyle(
                  color: AppColors.textBlue,
                  fontFamily: GoogleFonts.lato().fontFamily,
                  fontWeight: FontWeight.w400,
                  fontSize: fontSizeBody,
                ),
              ),
            ),
            SpaceH20(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: widthOfScreen(context)/3,
                  child: Image.asset(ImagePath.LOGO_SIC_4_CHANGE),
                ),
                Container(
                  width: widthOfScreen(context)/3,
                  child: Image.asset(ImagePath.LOGO_PROYECTO_KIEU),
                ),
              ],
            ),
          ],
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

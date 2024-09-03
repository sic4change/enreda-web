import 'package:carousel_slider/carousel_slider.dart';
import 'package:enreda_app/presentation/pages/home/sections/ourTeamCard.dart';
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

class OurTeamPanel extends StatefulWidget {
  OurTeamPanel({Key? key});
  @override
  _OurTeamPanelState createState() => _OurTeamPanelState();
}

class _OurTeamPanelState extends State<OurTeamPanel> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool hoverPerson1 = false;


  @override
  Widget build(BuildContext context) {
    return Container(
        width: widthOfScreen(context),
        decoration: BoxDecoration(
        color: AppColors.textBlue,
      ),
        child:
        Responsive.isMobile(context) ?
        _buildMobilePage(context) :
        _buildWebPage(context),

      );
  }

  Widget _buildWebPage(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.personTitle,
            style: TextStyle(
              color: AppColors.white,
              fontFamily: GoogleFonts.outfit().fontFamily,
              fontWeight: FontWeight.w800,
              fontSize: 46,
            ),
          ),
          SpaceH40(),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: [
              OurTeamCard(name: "Beatriz", image: ImagePath.PERSON_BEA, text: AppLocalizations.of(context)!.personTextBea, position: AppLocalizations.of(context)!.positionBea),
              OurTeamCard(name: "María", image: ImagePath.PERSON_MARIA, text: AppLocalizations.of(context)!.personTextMaria, position: AppLocalizations.of(context)!.positionMaria),
              OurTeamCard(name: "Laura", image: ImagePath.PERSON_LAURA, text: AppLocalizations.of(context)!.personTextLaura, position: AppLocalizations.of(context)!.positionLaura),
              OurTeamCard(name: "Valeria", image: ImagePath.PERSON_VALERIA, text: AppLocalizations.of(context)!.personTextValeria, position: AppLocalizations.of(context)!.positionValeria),
              OurTeamCard(name: "Aidira", image: ImagePath.PERSON_AIDIRA, text: AppLocalizations.of(context)!.personTextAidira, position: AppLocalizations.of(context)!.positionAidira),
              OurTeamCard(name: "Ana", image: ImagePath.PERSON_ANA, text: AppLocalizations.of(context)!.personTextAna, position: AppLocalizations.of(context)!.positionAna),
              OurTeamCard(name: "Marisol", image: ImagePath.PERSON_MARISOL, text: AppLocalizations.of(context)!.personTextMarisol, position: AppLocalizations.of(context)!.positionMarisol),
              OurTeamCard(name: "Morelia", image: ImagePath.PERSON_MORELIA, text: AppLocalizations.of(context)!.personTextMorelia, position: AppLocalizations.of(context)!.positionMorelia),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMobilePage(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.personTitle,
            style: TextStyle(
              color: AppColors.white,
              fontFamily: GoogleFonts.outfit().fontFamily,
              fontWeight: FontWeight.w800,
              fontSize: 34,
            ),
          ),
          SpaceH30(),
          Column(
            children: [
              OurTeamCard(name: "Beatriz", image: ImagePath.PERSON_BEA, text: AppLocalizations.of(context)!.personTextBea, position: AppLocalizations.of(context)!.positionBea),
              OurTeamCard(name: "María", image: ImagePath.PERSON_MARIA, text: AppLocalizations.of(context)!.personTextMaria, position: AppLocalizations.of(context)!.positionMaria),
              OurTeamCard(name: "Laura", image: ImagePath.PERSON_LAURA, text: AppLocalizations.of(context)!.personTextLaura, position: AppLocalizations.of(context)!.positionLaura),
              OurTeamCard(name: "Valeria", image: ImagePath.PERSON_VALERIA, text: AppLocalizations.of(context)!.personTextValeria, position: AppLocalizations.of(context)!.positionValeria),
              OurTeamCard(name: "Aidira", image: ImagePath.PERSON_AIDIRA, text: AppLocalizations.of(context)!.personTextAidira, position: AppLocalizations.of(context)!.positionAidira),
              OurTeamCard(name: "Ana", image: ImagePath.PERSON_ANA, text: AppLocalizations.of(context)!.personTextAna, position: AppLocalizations.of(context)!.positionAna),
              OurTeamCard(name: "Marisol", image: ImagePath.PERSON_MARISOL, text: AppLocalizations.of(context)!.personTextMarisol, position: AppLocalizations.of(context)!.positionMarisol),
              OurTeamCard(name: "Morelia", image: ImagePath.PERSON_MORELIA, text: AppLocalizations.of(context)!.personTextMorelia, position: AppLocalizations.of(context)!.positionMorelia),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String name, String image, String text, String position){
    return MouseRegion(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Container(
          height: 520,
          width: Responsive.isMobile(context) ? widthOfScreen(context) : widthOfScreen(context)/5,
          decoration: BoxDecoration(
            color: AppColors.cardWhite,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 30, right: 30, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontFamily: GoogleFonts.outfit().fontFamily,
                        fontSize: 30,
                        color: AppColors.textBlue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Positioned(
                      child: Center(
                        child: Container(
                          height: 210,
                          width: 180,
                          child: Image.asset(image),
                        ),
                      ),
                    ),
                  ],
                ),
                SpaceH12(),
                Text(
                  text,
                  style: TextStyle(
                    fontFamily: GoogleFonts.lato().fontFamily,
                    fontSize: 14,
                    color: AppColors.greyTxtAlt,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        position,
                        style: TextStyle(
                          fontFamily: GoogleFonts.lato().fontFamily,
                          fontSize: 14,
                          color: hoverPerson1 ? AppColors.red : AppColors.buttonBlue,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

import 'package:carousel_slider/carousel_slider.dart';
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
              _buildCard(context, "Beatriz", ImagePath.PERSON_BEA, AppLocalizations.of(context)!.personTextBea, AppLocalizations.of(context)!.personPosition),
              _buildCard(context, "María", ImagePath.PERSON_MARIA, AppLocalizations.of(context)!.personTextMaria, AppLocalizations.of(context)!.personPosition),
              _buildCard(context, "Laura", ImagePath.PERSON_LAURA, AppLocalizations.of(context)!.personTextLaura, AppLocalizations.of(context)!.personPosition),
              _buildCard(context, "Valeria", ImagePath.PERSON_VALERIA, AppLocalizations.of(context)!.personTextValeria, AppLocalizations.of(context)!.personPosition),
              _buildCard(context, "Aidira", ImagePath.PERSON_AIDIRA, AppLocalizations.of(context)!.personTextAidira, AppLocalizations.of(context)!.personPosition),
              _buildCard(context, "Ana", ImagePath.PERSON_ANA, AppLocalizations.of(context)!.personTextAna, AppLocalizations.of(context)!.personPosition),
              _buildCard(context, "Marisol", ImagePath.PERSON_MARISOL, AppLocalizations.of(context)!.personTextMarisol, AppLocalizations.of(context)!.personPosition),
              _buildCard(context, "Morelia", ImagePath.PERSON_MORELIA, AppLocalizations.of(context)!.personTextMorelia, AppLocalizations.of(context)!.personPosition),
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
              _buildCard(context, "Beatriz", ImagePath.PERSON_BEA, AppLocalizations.of(context)!.personTextBea, AppLocalizations.of(context)!.personPosition),
              _buildCard(context, "María", ImagePath.PERSON_MARIA, AppLocalizations.of(context)!.personTextMaria, AppLocalizations.of(context)!.personPosition),
              _buildCard(context, "Laura", ImagePath.PERSON_LAURA, AppLocalizations.of(context)!.personTextLaura, AppLocalizations.of(context)!.personPosition),
              _buildCard(context, "Valeria", ImagePath.PERSON_VALERIA, AppLocalizations.of(context)!.personTextValeria, AppLocalizations.of(context)!.personPosition),
              _buildCard(context, "Aidira", ImagePath.PERSON_AIDIRA, AppLocalizations.of(context)!.personTextAidira, AppLocalizations.of(context)!.personPosition),
              _buildCard(context, "Ana", ImagePath.PERSON_ANA, AppLocalizations.of(context)!.personTextAna, AppLocalizations.of(context)!.personPosition),
              _buildCard(context, "Marisol", ImagePath.PERSON_MARISOL, AppLocalizations.of(context)!.personTextMarisol, AppLocalizations.of(context)!.personPosition),
              _buildCard(context, "Morelia", ImagePath.PERSON_MORELIA, AppLocalizations.of(context)!.personTextMorelia, AppLocalizations.of(context)!.personPosition),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String name, String image, String text, String position){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Container(
        height: 480,
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
              SpaceH20(),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  position,
                  style: TextStyle(
                    fontFamily: GoogleFonts.lato().fontFamily,
                    fontSize: 14,
                    color: AppColors.buttonBlue,
                    fontWeight: FontWeight.w800,
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

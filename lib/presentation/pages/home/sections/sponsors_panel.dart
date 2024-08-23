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
        _buildMobilePage(context) :
        _buildWebPage(context),

      );
  }

  Widget _buildWebPage(BuildContext context){
    var textTheme = Theme.of(context).textTheme;
    return Padding(
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
                style: textTheme.titleLarge!.copyWith(
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
              style: textTheme.titleMedium!.copyWith(
                color: AppColors.textBlue,
                fontWeight: FontWeight.w100,
                fontSize: 40,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: widthOfScreen(context)/8,
                    child: Image.asset(ImagePath.ENREDADA_1)),
                Container(
                    width: widthOfScreen(context)/8,
                    child: Image.asset(ImagePath.ENREDADA_2)),
                Container(
                    width: widthOfScreen(context)/8,
                    child: Image.asset(ImagePath.ENREDADA_3)),
                Container(
                    width: widthOfScreen(context)/8,
                    child: Image.asset(ImagePath.ENREDADA_4)),
                Container(
                    width: widthOfScreen(context)/8,
                    child: Image.asset(ImagePath.ENREDADA_5)),
                Container(
                    width: widthOfScreen(context)/8,
                    child: Image.asset(ImagePath.ENREDADA_6)),
              ],
            ),
            SpaceH20(),
            Text(
              AppLocalizations.of(context)!.funders,
              style: textTheme.titleMedium!.copyWith(
                color: AppColors.textBlue,
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
                    child: Image.asset(ImagePath.FINANCIER_2)),
                Container(
                    width: widthOfScreen(context)/8,
                    child: Image.asset(ImagePath.FINANCIER_3)),
                Container(
                    width: widthOfScreen(context)/8,
                    child: Image.asset(ImagePath.FINANCIER_4)),
                Container(
                    width: widthOfScreen(context)/8,
                    child: Image.asset(ImagePath.FINANCIER_5)),
                Container(
                    width: widthOfScreen(context)/8,
                    child: Image.asset(ImagePath.FINANCIER_6)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobilePage(BuildContext context){
    double fontSizeTitle = responsiveSize(context, 30, 46);
    double fontSizeBody = responsiveSize(context, 26, 40);
    List<String> enredadasImages = [ImagePath.ENREDADA_1, ImagePath.ENREDADA_2, ImagePath.ENREDADA_3, ImagePath.ENREDADA_4, ImagePath.ENREDADA_5, ImagePath.ENREDADA_6];
    List<String> financiersImages = [ImagePath.FINANCIER_1, ImagePath.FINANCIER_2, ImagePath.FINANCIER_3, ImagePath.FINANCIER_4, ImagePath.FINANCIER_5, ImagePath.FINANCIER_6];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
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
                  fontSize: fontSizeTitle,
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
                fontSize: fontSizeBody,
              ),
            ),
            CarouselSlider.builder(
              itemCount: enredadasImages.length,
              itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
              Container(
                child: Container(
                  height: 150,
                  child: Image.asset(enredadasImages[itemIndex]),
                )
              ),
              options: CarouselOptions(
                height: 180,
                autoPlay: true,
              ),
            ),
            SpaceH20(),
            Text(
              AppLocalizations.of(context)!.funders,
              style: TextStyle(
                color: AppColors.textBlue,
                fontFamily: GoogleFonts.outfit().fontFamily,
                fontWeight: FontWeight.w100,
                fontSize: fontSizeBody,
              ),
            ),
            CarouselSlider.builder(
              itemCount: financiersImages.length,
              itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Container(
                      child: Container(
                        height: 150,
                        child: Image.asset(financiersImages[itemIndex]),
                      )
                  ),
              options: CarouselOptions(
                height: 180,
                autoPlay: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

}

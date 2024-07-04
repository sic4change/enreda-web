import 'package:enreda_app/localization/LocaleProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import '../../../../utils/functions.dart';
import '../../../../utils/responsive.dart';
import '../../../../values/values.dart';
import '../../../layout/adaptive.dart';
import '../../../widgets/buttons/social_button_2.dart';
import '../../../widgets/content_area.dart';
import '../../../widgets/enreda_info_section.dart';
import '../../../widgets/spaces.dart';

const double kSpacingSm = 40.0;
const double kRunSpacingSm = 24.0;
const double kSpacingLg = 24.0;
const double kRunSpacingLg = 16.0;

class PresentationPanel extends StatefulWidget {
  PresentationPanel({Key? key});
  @override
  _PresentationPanelState createState() => _PresentationPanelState();
}

class _PresentationPanelState extends State<PresentationPanel> {

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
        color: AppColors.lightBlue,
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _buildAboutMe(
                width: contentAreaWidthLg,
                height: contentAreaHeightSm,
              ),
            ),
            _buildImage(
              //width: Responsive.isTablet(context) ? contentAreaWidthLg * 0.8 : contentAreaWidthLg,
              height: contentAreaHeightSm,
            ),
          ],
        ),
      );
  }


  Widget _buildImage({width, height}) {

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Image.asset(
            ImagePath.PANEL_PRESENTATION,
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
    final localeProvider = Provider.of<LocaleProvider>(context);
    return Column(
      children: [
        EnredaInfoSection6(
          title1: AppLocalizations.of(context)!.futureText,
          buttonTitle: AppLocalizations.of(context)!.jobSearch,
        ),
      ],
    );
  }

  Widget enredaInfoSectionSm({required double width, required double height}) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: height,
      child: EnredaInfoSection6(
        title1: AppLocalizations.of(context)!.techText,
        buttonTitle: AppLocalizations.of(context)!.jobSearch,
      ),
    );
  }
}

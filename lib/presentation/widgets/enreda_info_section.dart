import 'package:enreda_app/presentation/pages/home/home_page.dart';
import 'package:enreda_app/presentation/pages/jobSearch/job_search_page.dart';
import 'package:enreda_app/presentation/widgets/buttons/enreda_button.dart';
import 'package:enreda_app/presentation/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/responsive.dart';
import '../../values/values.dart';
import '../layout/adaptive.dart';
import 'empty.dart';

class EnredaInfoSection1 extends StatelessWidget {
  final String sectionTitle;
  final String title1;
  final String title2;
  final bool hasTitle2;
  final String body;
  final TextStyle? sectionTitleStyle;
  final TextStyle? title1Style;
  final TextStyle? title2Style;
  final TextStyle? bodyStyle;
  final Color dividerColor;
  final double? thickness;
  final int quarterTurns;
  final double dividerHeight;
  final Widget? child;

  EnredaInfoSection1({
    required this.sectionTitle,
    required this.title1,
    required this.body,
    this.title2 = "",
    this.sectionTitleStyle,
    this.title1Style,
    this.hasTitle2 = true,
    this.title2Style,
    this.bodyStyle,
    this.thickness = 1.15,
    this.quarterTurns = 3,
    this.dividerColor = AppColors.grey350,
    this.dividerHeight = Sizes.HEIGHT_40,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? titleStyle = textTheme.headline3?.copyWith(
      fontSize: responsiveSize(context, 26, 36, md: 32),
    );
    double fontSize = responsiveSize(context, 16, 18);
    double fontSizeSection = responsiveSize(context, 20, 30);
    return Container(
      child: IntrinsicHeight(
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RotatedBox(
                  quarterTurns: quarterTurns,
                  child: Text(
                    sectionTitle,
                    style: textTheme.bodyText2?.copyWith(
                      fontSize: fontSizeSection,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey250,
                    ),
                  ),
                ),
                SpaceH16(),
                Container(
                  height: dividerHeight,
                  child: VerticalDivider(
                    color: dividerColor,
                    thickness: thickness,
                  ),
                ),
              ],
            ),
            SpaceW16(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title1,
                    style: title1Style ?? titleStyle,
                  ),
                  hasTitle2
                      ? SizedBox(
                          height: responsiveSize(
                            context,
                            Sizes.HEIGHT_4,
                            Sizes.HEIGHT_16,
                            md: Sizes.HEIGHT_8,
                          ),
                        )
                      : Empty(),
                  hasTitle2
                      ? Text(
                          title2,
                          style: title2Style ?? titleStyle,
                        )
                      : Empty(),
                  SpaceH20(),
                  Text(
                    body,
                    style: textTheme.bodyText1
                        ?.copyWith(fontSize: fontSize, height: 1.8),
                  ),
                  child != null ? SpaceH30() : Empty(),
                  child ?? Empty(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EnredaInfoSection2 extends StatelessWidget {
  final String? sectionTitle;
  final String? title1;
  final String? title2;
  final String? body;
  final bool hasSectionTitle;
  final bool hasTitle1;
  final bool hasTitle2;
  final bool hasBody;
  final TextStyle? sectionTitleStyle;
  final TextStyle? title1Style;
  final TextStyle? title2Style;
  final TextStyle? bodyStyle;
  final Color dividerColor;
  final double? thickness;
  final double dividerWidth;
  final Widget? child;

  EnredaInfoSection2({
    this.sectionTitle,
    this.title1,
    this.body,
    this.title2 = "",
    this.sectionTitleStyle,
    this.title1Style,
    required this.hasSectionTitle,
    required this.hasTitle1,
    required this.hasTitle2,
    required this.hasBody,
    this.title2Style,
    this.bodyStyle,
    this.thickness = 1.15,
    this.dividerColor = AppColors.grey350,
    this.dividerWidth = Sizes.HEIGHT_64,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? titleStyle = textTheme.headline3?.copyWith(
      fontSize: responsiveSize(context, 25, 45, md: 30),
      color: AppColors.greyDark,
    );
    double fontSize = responsiveSize(context, 14, 18, md: 15);
    double fontSizeSection = responsiveSize(context, 20, 30);
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          hasSectionTitle
              ? SizedBox(
            height: responsiveSize(
              context,
              Sizes.HEIGHT_4,
              Sizes.HEIGHT_16,
              md: Sizes.HEIGHT_8,
            ),
          )
              : Empty(),
          hasSectionTitle ?
            Column(
              children: [
                Text(
                  sectionTitle!,
                  style: textTheme.bodyText2?.copyWith(
                  fontSize: fontSizeSection,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyDark,
                  ),
                  ),
                SpaceH12(),
              ],
            )
              : Empty(),
          hasTitle1
              ? SizedBox(
            height: responsiveSize(
              context,
              Sizes.HEIGHT_4,
              Sizes.HEIGHT_16,
              md: Sizes.HEIGHT_8,
            ),
          )
              : Empty(),
          hasTitle1 ?
          Column(
            children: [
              Text(
                title1!,
                textAlign: TextAlign.center,
                style: title1Style ?? titleStyle,
              ),
              SpaceH12(),
            ],
          )
              : Empty(),
          hasTitle2
              ? SizedBox(
            height: responsiveSize(
              context,
              Sizes.HEIGHT_4,
              Sizes.HEIGHT_16,
              md: Sizes.HEIGHT_8,
            ),
          )
              : Empty(),
          hasTitle2 ?
          Column(
            children: [
              Text(
                title2!,
                style: title1Style ?? titleStyle,
              ),
              SpaceH12(),
            ],
          )
              : Empty(),
          hasBody
              ? SizedBox(
            height: responsiveSize(
              context,
              Sizes.HEIGHT_4,
              Sizes.HEIGHT_16,
              md: Sizes.HEIGHT_8,
            ),
          )
              : Empty(),
          hasBody ?
          Column(
            children: [
              Text(
                body!,
                textAlign: TextAlign.center,
                style: textTheme.bodyText1
                    ?.copyWith(fontSize: fontSize, height: 1.8),
              ),
            ],
          )
              : Empty(),
          child != null ? SpaceH30() : Empty(),
          child ?? Empty(),
        ],
      ),
    );
  }
}

class EnredaInfoSection3 extends StatelessWidget {
  final String sectionTitle;
  final TextStyle? sectionTitleStyle;

  EnredaInfoSection3({
    required this.sectionTitle,
    this.sectionTitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double fontSizeSection = responsiveSize(context, 20, 30);
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Text(
            sectionTitle,
            style: textTheme.bodyText2?.copyWith(
              fontSize: fontSizeSection,
              fontWeight: FontWeight.w400,
              color: AppColors.greyDark,
            ),
          ),
        ],
      ),
    );
  }
}

class EnredaInfoSection4 extends StatelessWidget {
  final String title1;
  final String? title2;
  final String? title3;
  final TextStyle? title1Style;

  EnredaInfoSection4({
    required this.title1,
    this.title2,
    this.title3,
    this.title1Style,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? titleStyle = textTheme.headline3?.copyWith(
      fontSize: responsiveSize(context, 25, 45, md: 30),
      color: AppColors.greyDark,
    );
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title1,
            style: title1Style ?? titleStyle,
          ),
          title2 != null ?
          Text(
            title2!,
            style: title1Style ?? titleStyle,
          ) :  Empty(),
          title3 != null ?
          Text(
            title3!,
            style: title1Style ?? titleStyle,
          ) : Empty(),
        ],
      ),
    );
  }
}


class EnredaInfoSection5 extends StatelessWidget {
  final String? sectionTitle;
  final String? title1;
  final bool hasSectionTitle;
  final bool hasTitle1;
  final TextStyle? sectionTitleStyle;
  final TextStyle? title1Style;

  EnredaInfoSection5({
    this.sectionTitle,
    this.title1,
    this.sectionTitleStyle,
    this.title1Style,
    required this.hasSectionTitle,
    required this.hasTitle1,

  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? titleStyle = textTheme.headline3?.copyWith(
      fontSize: responsiveSize(context, 25, 45, md: 30),
      color: AppColors.greyDark,
    );
    double fontSize = responsiveSize(context, 25, 40, md: 20);
    double fontSizeSection = responsiveSize(context, 40, 60, md: 40);
    return Padding(
      padding: EdgeInsets.only(right: Responsive.isTablet(context) ? 0 : 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          hasSectionTitle
              ? SizedBox(
            height: responsiveSize(
              context,
              Sizes.HEIGHT_4,
              Sizes.HEIGHT_16,
              md: Sizes.HEIGHT_8,
            ),
          )
              : Empty(),
          hasSectionTitle ?
          Column(
            children: [
              Text(
                sectionTitle!,
                style: textTheme.headline2?.copyWith(
                  fontSize: fontSizeSection,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyLightTxt,
                ),
              ),
              SpaceH12(),
            ],
          )
              : Empty(),
          hasTitle1
              ? SizedBox(
            height: responsiveSize(
              context,
              Sizes.HEIGHT_4,
              Sizes.HEIGHT_16,
              md: Sizes.HEIGHT_8,
            ),
          )
              : Empty(),
          hasTitle1 ?
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Text(
                  title1!,
                  textAlign: TextAlign.start,
                  style: textTheme.headline2?.copyWith(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
              ),
              SpaceH12(),
            ],
          )
              : Empty(),
        ],
      ),
    );
  }
}

class EnredaInfoSection6 extends StatelessWidget {
  final String? title1;
  final TextStyle? title1Style;
  final String? buttonTitle;

  EnredaInfoSection6({
    this.title1,
    this.title1Style,
    this.buttonTitle,

  });

  @override
  Widget build(BuildContext context) {
    double fontSize = responsiveSize(context, 25, 40, md: 20);
    double fontSizeSection = responsiveSize(context, 30, 40, md: 30, xl: 55);
    return Padding(
      padding: EdgeInsets.only(right: Responsive.isTablet(context) ? 0 : 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50.0, top: 20),
                child: Text(
                  title1!,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: GoogleFonts.outfit().fontFamily,
                    fontWeight: FontWeight.w800,
                    fontSize: fontSizeSection,
                    color: AppColors.textBlue,
                  )
                ),
              ),
              Responsive.isMobile(context) ? SpaceH30() : SpaceH50(),
              Container(
                height: 60,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.turquoiseDark,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    onPrimary: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(33),
                    ),
                    textStyle: TextStyle(
                      fontFamily: GoogleFonts.outfit().fontFamily,
                      fontSize: 15,
                      letterSpacing: 1.8,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage(pageSelected: StringConst.JOB_SEARCH,)),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(22.0),
                    child:
                        Center(child: Text(buttonTitle!.toUpperCase())),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
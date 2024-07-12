import 'package:enreda_app/models/city.dart';
import 'package:enreda_app/models/country.dart';
import 'package:enreda_app/models/filterResource.dart';
import 'package:enreda_app/models/filterTrainingPills.dart';
import 'package:enreda_app/models/organization.dart';
import 'package:enreda_app/models/province.dart';
import 'package:enreda_app/models/resource.dart';
import 'package:enreda_app/models/resourceCategory.dart';
import 'package:enreda_app/models/resourcePicture.dart';
import 'package:enreda_app/models/socialEntity.dart';
import 'package:enreda_app/models/trainingPill.dart';
import 'package:enreda_app/models/userEnreda.dart';
import 'package:enreda_app/presentation/layout/adaptive.dart';
import 'package:enreda_app/presentation/pages/home/home_page.dart';
import 'package:enreda_app/presentation/pages/home/sections/footer_form_new.dart';
import 'package:enreda_app/presentation/pages/resources/sections/filter_text_field_row.dart';
import 'package:enreda_app/presentation/pages/resources/sections/resource_list_tile.dart';
import 'package:enreda_app/presentation/pages/resources/sections/show_resource_detail_dialog.dart';
import 'package:enreda_app/presentation/pages/trainingPills/training_list_tile.dart';
import 'package:enreda_app/presentation/pages/trainingPills/training_list_tile_mobile.dart';
import 'package:enreda_app/presentation/widgets/list_item_builder.dart';
import 'package:enreda_app/presentation/widgets/spaces.dart';
import 'package:enreda_app/presentation/widgets/list_item_grid_builder.dart';
import 'package:enreda_app/presentation/widgets/widgets/custom_person_pills_image.dart';
import 'package:enreda_app/presentation/widgets/widgets/list_item_grid_vertical.dart';
import 'package:enreda_app/services/database.dart';
import 'package:enreda_app/utils/functions.dart';
import 'package:enreda_app/utils/responsive.dart';
import 'package:enreda_app/values/values.dart';
import 'package:extended_wrap/extended_wrap.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SocialEntityPage extends StatefulWidget {
  @override
  State<SocialEntityPage> createState() => _SocialEntityPageState();

  static ValueNotifier<int> selectedIndex = ValueNotifier(0);
}

class _SocialEntityPageState extends State<SocialEntityPage> {

  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }

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
    return Responsive.isMobile(context) ?
      _buildSocialEntityPageMobile(context) :
      _buildSocialEntityPage(context);
  }


  Widget _buildSocialEntityPage(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: widthOfScreen(context),
                  //height: 550,
                  child: Image.asset(ImagePath.ENTITY_PRESENTATION_IMAGE),
                ),
                Positioned(
                  bottom: -widthOfScreen(context)/15,
                  width: widthOfScreen(context)/1.5,
                  child: Image.asset(ImagePath.ENTITY_PRESENTATION_TEXT),
                )
              ],
            ),
            SpaceH180(),
            Container(
              height: 1000,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 550,
                    child: Container(
                      color: AppColors.textBlue,
                      width: widthOfScreen(context),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 90.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 100.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildBigItemCard(context, ImagePath.ICON_ROCKET, AppLocalizations.of(context)!.rediscover, AppLocalizations.of(context)!.rediscoverEntity),
                              _buildBigItemCard(context, ImagePath.ICON_BULB, AppLocalizations.of(context)!.reimagine, AppLocalizations.of(context)!.reimagineEntity),
                              _buildBigItemCard(context, ImagePath.ICON_DART, AppLocalizations.of(context)!.rebuild, AppLocalizations.of(context)!.rebuildEntity),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Image.asset(ImagePath.ENTITY_YELLOW_LINE_1),
                    width: widthOfScreen(context),
                    //bottom: widthOfScreen(context) > 1435 ? 800 : 900,
                    bottom: 350,
                  ),
                  Positioned(
                    top: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: widthOfScreen(context)/2.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.entityTitle,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontFamily: GoogleFonts.outfit().fontFamily,
                                    fontSize: 40,
                                    color: AppColors.textBlue,
                                  ),
                                ),
                                SpaceH50(),
                                Text(
                                  AppLocalizations.of(context)!.entityParagraph1,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontSize: 14,
                                    color: AppColors.greyTxtAlt,
                                  ),
                                ),
                                SpaceH12(),
                                Text(
                                  AppLocalizations.of(context)!.entityParagraph2,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontSize: 14,
                                    color: AppColors.greyTxtAlt,
                                  ),
                                ),
                                SpaceH12(),
                                Text(
                                  AppLocalizations.of(context)!.entityParagraph3,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontSize: 14,
                                    color: AppColors.greyTxtAlt,
                                  ),
                                ),
                                SpaceH30(),
                                Container(
                                  height: 70,
                                  width: 400,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: AppColors.buttonBlue,
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                      onPrimary: AppColors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(33),
                                      ),
                                      textStyle: TextStyle(
                                        fontFamily: GoogleFonts.outfit().fontFamily,
                                        fontSize: 16,
                                        letterSpacing: 1.8,
                                      ),
                                    ),
                                    onPressed: () {
                                      openUrlLink(StringConst.SOCIAL_ENTITY_URL);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(22.0),
                                      child:
                                      Center(child: Text(AppLocalizations.of(context)!.bePartEnreda)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SpaceW40(),
                          Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(),
                              width: widthOfScreen(context)/2.5,
                              child: Image.asset(ImagePath.ENTITY_EXAMPLE_IMAGE)
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 140,
            ),
            Container(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      AppLocalizations.of(context)!.entityItemsTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: GoogleFonts.outfit().fontFamily,
                        fontSize: 45,
                        color: AppColors.textBlue,
                      ),
                    ),
                  ),
                  SpaceH80(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100.0),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 30,
                      runSpacing: 30,
                      children: [
                        _buildSmallItemCard(context, ImagePath.ICON_CANDIDATES, AppLocalizations.of(context)!.intervention, AppLocalizations.of(context)!.interventionText),
                        _buildSmallItemCard(context, ImagePath.ICON_METHODOLOGY, AppLocalizations.of(context)!.enredaMethodology, AppLocalizations.of(context)!.enredaMethodologyText),
                        _buildSmallItemCard(context, ImagePath.ICON_DESIGN, AppLocalizations.of(context)!.intervention, AppLocalizations.of(context)!.interventionText),
                        _buildSmallItemCard(context, ImagePath.ICON_RESOURCE_ACCESS, AppLocalizations.of(context)!.resourcesCreation, AppLocalizations.of(context)!.resourcesCreationText),
                        _buildSmallItemCard(context, ImagePath.ICON_DIRECTORY, AppLocalizations.of(context)!.entitiesDirectory, AppLocalizations.of(context)!.entitiesDirectoryText),
                      ]),
                  ),
                ],
              ),
            ),
            SpaceH100(),
            FooterFormNew(),
          ],
        )
    );
  }

  Widget _buildSocialEntityPageMobile(BuildContext context) {
    double fontSizeTitle = responsiveSize(context, 30, 40);
    double fontSizeBody = responsiveSize(context, 13, 14);
    return SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: widthOfScreen(context),
                  //height: 550,
                  child: Image.asset(ImagePath.ENTITY_PRESENTATION_IMAGE),
                ),
                Positioned(
                  bottom: -widthOfScreen(context)/15,
                  width: widthOfScreen(context)/1.3,
                  child: Image.asset(ImagePath.ENTITY_PRESENTATION_TEXT),
                )
              ],
            ),
            SpaceH30(),
            Container(
              height: 1150,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 850,
                    child: Container(
                      color: AppColors.textBlue,
                      width: widthOfScreen(context),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _buildBigItemCardMobile(context, ImagePath.ICON_ROCKET, AppLocalizations.of(context)!.rediscover, AppLocalizations.of(context)!.rediscoverEntity),
                              _buildBigItemCardMobile(context, ImagePath.ICON_BULB, AppLocalizations.of(context)!.reimagine, AppLocalizations.of(context)!.reimagineEntity),
                              _buildBigItemCardMobile(context, ImagePath.ICON_DART, AppLocalizations.of(context)!.rebuild, AppLocalizations.of(context)!.rebuildEntity),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: widthOfScreen(context),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.entityTitle,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontFamily: GoogleFonts.outfit().fontFamily,
                                    fontSize: fontSizeTitle,
                                    color: AppColors.textBlue,
                                  ),
                                ),
                                SpaceH20(),
                                Text(
                                  AppLocalizations.of(context)!.entityParagraph1,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontSize: fontSizeBody,
                                    color: AppColors.greyTxtAlt,
                                  ),
                                ),
                                SpaceH12(),
                                Text(
                                  AppLocalizations.of(context)!.entityParagraph2,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontSize: fontSizeBody,
                                    color: AppColors.greyTxtAlt,
                                  ),
                                ),
                                SpaceH12(),
                                Text(
                                  AppLocalizations.of(context)!.entityParagraph3,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontSize: fontSizeBody,
                                    color: AppColors.greyTxtAlt,
                                  ),
                                ),
                                SpaceH30(),
                                Container(
                                  height: 60,
                                  width: widthOfScreen(context)*0.7,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: AppColors.buttonBlue,
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                      onPrimary: AppColors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(33),
                                      ),
                                      textStyle: TextStyle(
                                        fontFamily: GoogleFonts.outfit().fontFamily,
                                        fontSize: 16,
                                        letterSpacing: 1.8,
                                      ),
                                    ),
                                    onPressed: () {
                                      openUrlLink(StringConst.SOCIAL_ENTITY_URL);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(22.0),
                                      child:
                                      Center(child: Text(AppLocalizations.of(context)!.bePartEnreda)),
                                    ),
                                  ),
                                ),
                                SpaceH30(),
                                Container(
                                    clipBehavior: Clip.none,
                                    decoration: BoxDecoration(),
                                    width: widthOfScreen(context),
                                    child: Image.asset(ImagePath.ENTITY_EXAMPLE_IMAGE)
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    child: Image.asset(ImagePath.ENTITY_YELLOW_LINE_1),
                    width: widthOfScreen(context),
                    //bottom: widthOfScreen(context) > 1435 ? 800 : 900,
                    bottom: 300,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text(
                        AppLocalizations.of(context)!.entityItemsTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontFamily: GoogleFonts.outfit().fontFamily,
                          fontSize: fontSizeTitle,
                          color: AppColors.textBlue,
                        ),
                      ),
                    ),
                    SpaceH30(),
                    Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        _buildSmallItemCardMobile(context, ImagePath.ICON_CANDIDATES, AppLocalizations.of(context)!.intervention, AppLocalizations.of(context)!.interventionText),
                        _buildSmallItemCardMobile(context, ImagePath.ICON_METHODOLOGY, AppLocalizations.of(context)!.enredaMethodology, AppLocalizations.of(context)!.enredaMethodologyText),
                        _buildSmallItemCardMobile(context, ImagePath.ICON_DESIGN, AppLocalizations.of(context)!.intervention, AppLocalizations.of(context)!.interventionText),
                        _buildSmallItemCardMobile(context, ImagePath.ICON_RESOURCE_ACCESS, AppLocalizations.of(context)!.resourcesCreation, AppLocalizations.of(context)!.resourcesCreationText),
                        _buildSmallItemCardMobile(context, ImagePath.ICON_DIRECTORY, AppLocalizations.of(context)!.entitiesDirectory, AppLocalizations.of(context)!.entitiesDirectoryText),
                      ]
                    ),
                  ],
                ),
              ),
            ),
            SpaceH100(),
            FooterFormNew(),
          ],
        )
    );
  }

  Widget _buildBigItemCard(BuildContext context, String icon, String title, String text){
    return Container(
      width: widthOfScreen(context)/5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 180,
            width: 180,
            child: Image.asset(icon),
          ),
          SpaceH30(),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontFamily: GoogleFonts.outfit().fontFamily,
              fontSize: 38,
              color: AppColors.lightBlue,
            ),
          ),
          SpaceH30(),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: GoogleFonts.lato().fontFamily,
              fontSize: 14,
              color: AppColors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSmallItemCard(BuildContext context, String icon, String title, String text){
    return Container(
      width: widthOfScreen(context)/4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 70,
            width: 70,
            child: Image.asset(icon),
          ),
          SpaceH8(),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontFamily: GoogleFonts.outfit().fontFamily,
              fontSize: 20,
              color: AppColors.textBlue,
            ),
          ),
          SpaceH8(),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.lato().fontFamily,
              fontSize: 12,
              color: AppColors.greyTxtAlt,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }

  Widget _buildSmallItemCardMobile(BuildContext context, String icon, String title, String text){
    return Container(
      width: widthOfScreen(context)/3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 70,
            width: 70,
            child: Image.asset(icon),
          ),
          SpaceH8(),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontFamily: GoogleFonts.outfit().fontFamily,
              fontSize: 20,
              color: AppColors.textBlue,
            ),
          ),
          SpaceH8(),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.lato().fontFamily,
              fontSize: 12,
              color: AppColors.greyTxtAlt,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }

  Widget _buildBigItemCardMobile(BuildContext context, String icon, String title, String text){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Container(
        width: widthOfScreen(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 180,
              width: 180,
              child: Image.asset(icon),
            ),
            SpaceH30(),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontFamily: GoogleFonts.outfit().fontFamily,
                fontSize: 38,
                color: AppColors.lightBlue,
              ),
            ),
            SpaceH30(),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: GoogleFonts.lato().fontFamily,
                fontSize: 14,
                color: AppColors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }


}


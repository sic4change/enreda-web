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


    return _buildSocialEntityPage(context);
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
            _buildFooter(context),
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

  Widget _buildFooter(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(top:412.0),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                color: AppColors.skyBlue,
                height: 600,
                width: widthOfScreen(context),
                child: Padding(
                  padding: EdgeInsets.only(right: 100, left: 100, top: 200, bottom: 89),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Image.asset(ImagePath.LOGO_ENREDA_VERTICAL, height: 450),
                            //Menu options
                            Padding(
                              padding: const EdgeInsets.only(left: 100.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildSubMenuItem('Menú', true),
                                  InkWell(
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => HomePage(pageSelected: StringConst.RESOURCES,)),
                                        );
                                      },
                                      child: _buildSubMenuItem('Recursos', false)
                                  ),
                                  InkWell(
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => HomePage(pageSelected: StringConst.JOB_SEARCH,)),
                                        );
                                      },
                                      child: _buildSubMenuItem('Busco empleo', false)
                                  ),
                                  InkWell(
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => HomePage(pageSelected: StringConst.SOCIAL_ENTITY,)),
                                        );
                                      },
                                      child: _buildSubMenuItem('Entidades', false)
                                  ),
                                  InkWell(
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => HomePage(pageSelected: StringConst.TALENT_SEARCH,)),
                                        );
                                      },
                                      child: _buildSubMenuItem('Busco talento', false)
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Enreda icon

                      //Text and buttons
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Sé parte del cambio,\n¡Enrédate!',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: GoogleFonts.outfit().fontFamily,
                              color: AppColors.textBlue,
                              fontSize: 36,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 260,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: AppColors.textBlue,
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
                                      sendEmail(StringConst.DEV_EMAIL);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(22.0),
                                      child:
                                      Center(child: Text('Contacta ahora'.toUpperCase())),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                  onTap: () => openUrlLink(StringConst.LINKED_IN_URL),
                                  child: Image.asset(ImagePath.ICON_LINKEDIN, height: 36)
                              ),
                              SpaceW16(),
                              InkWell(
                                  onTap: () => openUrlLink(StringConst.INSTAGRAM_URL),
                                  child: Image.asset(ImagePath.ICON_INSTAGRAM, height: 36)
                              ),
                              SpaceW16(),
                              InkWell(
                                  onTap: () => openUrlLink(StringConst.TWITTER_URL),
                                  child: Image.asset(ImagePath.ICON_TWITTER, height: 36)
                              ),
                              SpaceW16(),
                              InkWell(
                                  onTap: () => openUrlLink(StringConst.FACEBOOK_URL),
                                  child: Image.asset(ImagePath.ICON_FACEBOOK, height: 36)
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                child: _buildContactFormCommunityPanel(context),
                top: -500,
              ),
            ],
          ),
          Container(
            color: AppColors.textBlue,
            width: widthOfScreen(context),
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '©SIC4Change',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: GoogleFonts.lato().fontFamily,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => openUrlLink(StringConst.USE_CONDITIONS_URL),
                        child: Text(
                          StringConst.BUILT_BY,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: GoogleFonts.lato().fontFamily,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SpaceW16(),
                      InkWell(
                        onTap: () => openUrlLink(StringConst.PRIVACITY_URL),
                        child: Text(
                          StringConst.RIGHTS_RESERVED,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: GoogleFonts.lato().fontFamily,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSubMenuItem(String name, bool isTitle){
    return Padding(
      padding: EdgeInsets.only(bottom: isTitle ? 14 : 6),
      child: Text(
        name,
        style: TextStyle(
          fontFamily: GoogleFonts.lato().fontFamily,
          fontSize: isTitle ? 20 : 14,
          fontWeight: isTitle ? FontWeight.w600 : FontWeight.w400,
          color: AppColors.textBlue,
        ),
      ),
    );
  }

  Widget _buildContactFormCommunityPanel(BuildContext context) {
    return Container(
      color: AppColors.textBlue,
      //margin: EdgeInsets.symmetric(horizontal: 100),
      width: widthOfScreen(context)-200,
      height: 650,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.centerLeft,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:40.0),
                child: Container(
                  //width: widthOfScreen(context)/5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Formulario de contacto'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          fontFamily: GoogleFonts.outfit().fontFamily,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SpaceH8(),
                      Text(
                        'Transforma el futuro de tus participantes. Explícanos brevemente  tu proyecto y nos pondremos en contacto contigo.',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          fontFamily: GoogleFonts.lato().fontFamily,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:40.0, right: 100, left: 100),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        contactFormField('Nombre y apellidos'),
                        contactFormField('Nombre de la entidad'),
                        contactFormField('Correo electrónico'),
                        contactFormField('Número de télefono'),
                      ],
                    ),
                    SpaceW48(),
                    contactFormFieldBig("¿En qué podemos ayudarte?"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  height: 60,
                  width: 200,
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
                    },
                    child: Padding(
                      padding: EdgeInsets.all(22.0),
                      child:
                      Center(child: Text('Enviar'.toUpperCase())),
                    ),
                  ),
                ),
              ),


            ],
          ),
        ],
      ),
    );
  }

  Widget contactFormField(String title){
    return Container(
      width: widthOfScreen(context)/4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontFamily: GoogleFonts.lato().fontFamily,
                fontSize: 12,
              ),
            ),
            SpaceH2(),
            Container(
              height: 45,
              child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget contactFormFieldBig(String title){
    return Container(
      width: widthOfScreen(context)/2.5 ,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontFamily: GoogleFonts.lato().fontFamily,
                fontSize: 12,
              ),
            ),
            SpaceH2(),
            SizedBox(
              height: 286,
              child: TextFormField(
                maxLines: 30,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget _buildEmailFieldYellow(BuildContext context){
    TextEditingController emailController = TextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Introduce tu email y súmate',
          style: TextStyle(
            color: AppColors.skyBlue,
            fontFamily: GoogleFonts.lato().fontFamily,
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
        Container(
          width: 250,
          child: TextFormField(
            controller: emailController,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              border: InputBorder.none, // Sin borde visible
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              ),
              hintText: 'ejemplo@gmail.com',
              hintStyle: TextStyle(
                color: Colors.white,
                fontFamily: GoogleFonts.lato().fontFamily,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              )
            ),
            style: TextStyle(
              color: Colors.white,
              fontFamily: GoogleFonts.lato().fontFamily,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
        ),
        Row(
          children: [
            Container(
              width: 300.0,
              height: 7.0,
              decoration: BoxDecoration(
                color: AppColors.yellowDark,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
            ),
            SizedBox(width: 5,),
            Container(
              width: 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            )
          ],
        )
      ],
    );
  }

}


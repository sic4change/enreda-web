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
            Column(
              children: [
              ],
            ),
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
            Stack(
              children: [
                Positioned(
                  child: Image.asset(ImagePath.ENTITY_YELLOW_LINE_1),
                  width: widthOfScreen(context),
                  bottom: 650,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: widthOfScreen(context)/2.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Lorem Ipsumis simply dummy text of the printtry.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontFamily: GoogleFonts.outfit().fontFamily,
                                    fontSize: 40,
                                    color: AppColors.textBlue,
                                  ),
                                ),
                                SpaceH50(),
                                Text(
                                  'Enreda combina tecnología y acción comunitaria para activar y mejorar la empleabilidad juvenil; conecta a los actores y recursos del territorio vinculados con el empleo juvenil, al tiempo que dinamiza el desarrollo local. \n\n Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. I',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontSize: 14,
                                    color: AppColors.greyTxtAlt,
                                  ),
                                ),
                                SpaceH30(),
                                Container(
                                  height: 60,
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
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(22.0),
                                      child:
                                      Center(child: Text('INSCRÍBETE')),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: widthOfScreen(context)/2.5,
                            child: Image.asset(ImagePath.ENTITY_EXAMPLE_IMAGE)
                          ),
                        ],
                      ),
                      SpaceH60(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildBigItemCard(context, ImagePath.ICON_ROCKET, 'RE-DESCUBRE', 'La esencia de los desafíos sociales, sumergiéndonos en la realidad de las comunidades afectadas'),
                          _buildBigItemCard(context, ImagePath.ICON_BULB, 'RE-IMAGINA', 'Soluciones creativas que desafíen las convenciones y exploren nuevas posibilidades'),
                          _buildBigItemCard(context, ImagePath.ICON_PUZZLE, 'RE-CONSTRUYE', 'El futuro mediante la implementación de soluciones adaptando nuestro enfoque'),
                        ],
                      ),
                      SpaceH60(),
                      Container(
                        width: double.maxFinite,
                        child: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          spacing: 12,
                          runSpacing: 10,
                          children: [
                            _buildSmallItemCard(context, ImagePath.ICON_PUZZLE, 'Chatbot', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard d.'),
                            _buildSmallItemCard(context, ImagePath.ICON_PUZZLE, 'Competencias', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard d.'),
                            _buildSmallItemCard(context, ImagePath.ICON_PUZZLE, 'Gamificación', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard d.'),
                            _buildSmallItemCard(context, ImagePath.ICON_PUZZLE, 'Creación de CV', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard d.'),
                            _buildSmallItemCard(context, ImagePath.ICON_PUZZLE, 'Acceso a recursos', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard d.'),
                            _buildSmallItemCard(context, ImagePath.ICON_PUZZLE, 'Enreda App', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard d.'),],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SpaceH100(),
            _buildFooter(context),
          ],
        ));
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
              color: AppColors.textBlue,
            ),
          ),
          SpaceH30(),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: GoogleFonts.lato().fontFamily,
              fontSize: 14,
              color: AppColors.greyTxtAlt,
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
                                  _buildSubMenuItem('Sobre Enreda', false),
                                  _buildSubMenuItem('Recursos', false),
                                  _buildSubMenuItem('Participantes', false),
                                  _buildSubMenuItem('Empresas', false),
                                  _buildSubMenuItem('Entidades', false),
                                  _buildSubMenuItem('Transparencia', false),
                                  _buildSubMenuItem('Contacto', false),
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
                            'Atrévete a desafiar el\nstatus quo y contáctanos\npara ser parte del cambio',
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
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(22.0),
                                      child:
                                      Center(child: Text('Contacta ahora'.toUpperCase())),
                                    ),
                                  ),
                                ),
                                SpaceW24(),
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
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(22.0),
                                      child:
                                      Center(child: Text('Más información'.toUpperCase())),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(ImagePath.ICON_LINKEDIN, height: 36),
                              SpaceW16(),
                              Image.asset(ImagePath.ICON_INSTAGRAM, height: 36),
                              SpaceW16(),
                              Image.asset(ImagePath.ICON_TWITTER, height: 36),
                              SpaceW16(),
                              Image.asset(ImagePath.ICON_FACEBOOK, height: 36),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                child: _buildJoinCommunityPanel(context),
                top: -400,
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
                      Text(
                        'Aviso Legal',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: GoogleFonts.lato().fontFamily,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      SpaceW16(),
                      Text(
                        'Política de Privacidad',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: GoogleFonts.lato().fontFamily,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      SpaceW16(),
                      Text(
                        'Política de Cookies',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: GoogleFonts.lato().fontFamily,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
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


  Widget _buildJoinCommunityPanel(BuildContext context) {
    return Container(
      color: AppColors.textBlue,
      //margin: EdgeInsets.symmetric(horizontal: 100),
      width: widthOfScreen(context)-200,
      height: 550,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.centerLeft,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Únete a nuestra\ncomunidad de cambio\ny sé parte de la \nrevolución'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        fontFamily: GoogleFonts.outfit().fontFamily,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,

                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0, bottom: 20),
                      child: _buildEmailFieldYellow(context),
                    ),
                    Container(
                      height: 60,
                      width: 320,
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
                          Center(child: Text('Más información'.toUpperCase())),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Text(
                      'Recibirás actualizaciones exclusivas sobre nuestro trabajo\ny eventos. Cada suscriptor es un paso más\nhacia un futuro mejor para todos. ¡Tu voz y tu\nparticipación hacen la diferencia!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: GoogleFonts.lato().fontFamily,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              )
            ],
          ),
          Positioned(
              right: 30,
              bottom: -60,
              child: Image.asset(ImagePath.JOIN_GIRL, height: 500),
          ),
        ],
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


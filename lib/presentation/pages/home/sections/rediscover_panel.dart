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

const double kSpacingSm = 40.0;
const double kRunSpacingSm = 24.0;
const double kSpacingLg = 24.0;
const double kRunSpacingLg = 16.0;

class RediscoverPanel extends StatefulWidget {
  RediscoverPanel({Key? key});
  @override
  _RediscoverPanelState createState() => _RediscoverPanelState();
}

class _RediscoverPanelState extends State<RediscoverPanel> {

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
              child: _buildImage(
                width: widthOfScreen(context),
                //height: contentAreaHeightSm * 0.6,
              ),
            ),
          ],
        ) :
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 70),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: widthOfScreen(context)/2.5,
                    child: Text(
                      'Tecnología y acompañamiento integral para impulsar el empleo',
                      style: TextStyle(
                        fontFamily: GoogleFonts.outfit().fontFamily,
                        fontSize: 46,
                        color: AppColors.textBlue,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Container(
                    width: widthOfScreen(context)/2.5,
                    child: Text(
                      'Enreda combina tecnología y acción comunitaria para activar y mejorar la empleabilidad juvenil; conecta a los actores y recursos del territorio vinculados con el empleo juvenil, al tiempo que dinamiza el mercado laboral.\n\nEnreda te ayuda a descubrir y destacar tus habilidades transferibles para el trabajo a través de un chat, te guía en la creación de tu CV y te conecta con ofertas laborales y recursos de formación digital para mejorar tu empleabilidad.\n\nTambién apoyamos a las empresas en la búsqueda de talento y apoyamos con herramientas y medimos el impacto de la intervención profesional en la inserción laboral de personas vulnerables.',
                      style: TextStyle(
                        fontFamily: GoogleFonts.lato().fontFamily,
                        fontSize: 16,
                        color: AppColors.greyTxtAlt,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: Container(
                    color: AppColors.textBlue,
                    width: widthOfScreen(context),
                    height: heightOfScreen(context)+100,
                    child: Padding(
                      padding: EdgeInsets.only(top: widthOfScreen(context)/6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:[
                          optionsCard(
                              AppColors.brightBlue,
                              ImagePath.REDISCOVER_PARTICIPANT_ICON,
                              'Participantes',
                              '¿NO SABES POR DONDE TIRAR?',
                              'EnREDa te conecta con ofertas de empleo recursos educativos, actividades, empresas y personas de tu comunidad para que puedas mejorar empleabilidad y construir tu camino vital. Porque las oportunidades no se compran, se crean.'),
                          optionsCard(
                              AppColors.yellowDark,
                              ImagePath.REDISCOVER_SOCIAL_ENTITY_ICON,
                              'Entidades sociales',
                              '¿Quieres que tus programas y recursos lleguen más lejos?'.toUpperCase(),
                              'EnREDa te conecta con recursos educativos, actividades, empresas y personas de tu comunidad para que puedas mejorar empleabilidad y construir tu camino vital. Porque las oportunidades no se compran, se crean.'),
                          optionsCard(
                              AppColors.lightBlue,
                              ImagePath.REDISCOVER_COMPANY_ICON,
                              'Empresas',
                              '¿BUSCAS TALENTO CON IMPACTO?'.toUpperCase(),
                              'EnREDa conecta a tu empresa con jóvenes del territorio motivados/as y comprometidos/as, que cumplirán con tus expectativas y tus necesidades. Te permite una selección ágil, no solo basada en conocimientos, sino también en capacidades.'),
                        ]
                      ),
                    ),
                  ),
                  bottom: -heightOfScreen(context)/1.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100.0),
                  child: Image.asset(
                    ImagePath.REDISCOVER_IMAGE,

                  ),
                ),
                Positioned(
                  child: Image.asset(ImagePath.REDISCOVER_TEXT),
                  width: widthOfScreen(context)/1.1,
                  bottom: -widthOfScreen(context)/12,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:800, left: 100, right: 100),
              child: Container(
                width: widthOfScreen(context),
                height: heightOfScreen(context)*0.8,
                child: Container(
                  height: 430,
                  child: Image.asset(ImagePath.REIMAGINE_TITLE_IMAGE)),
              ),
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
            ImagePath.REDISCOVER_IMAGE,
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

  Widget optionsCard(Color color, String icon, String title, String subtitle, String text){
    return Container(
      height: 500,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white
              ),
              child: Image.asset(
                icon,
                width: 90,
                height: 90,
              ),
            ),
            SpaceH20(),
            Text(
              title,
              style: TextStyle(
                fontFamily: GoogleFonts.outfit().fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: AppColors.textBlue
              ),
            ),
            SpaceH12(),
            Text(
              subtitle,
              style: TextStyle(
                fontFamily: GoogleFonts.outfit().fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: AppColors.greyTxtAlt,
              ),
            ),
            SpaceH12(),
            Text(
              text,
              style: TextStyle(
                  fontFamily: GoogleFonts.lato().fontFamily,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: AppColors.textBlue,
                  height: 1.4
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: EnredaButton(
                  buttonTitle: 'Ver más'.toUpperCase(),
                  buttonColor: AppColors.turquoise,
                  titleColor: AppColors.white,
                  onPressed: () =>  openUrlLink(StringConst.ADMIN_WEB_URL),
                  borderRadius: BorderRadius.all(Radius.circular(33)),
                  width: 260,
                  height: 65,
                ),
              ),
            ),
          ],
        ),
      ),
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

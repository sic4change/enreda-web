import 'package:enreda_app/presentation/layout/adaptive.dart';
import 'package:enreda_app/presentation/pages/home/home_page.dart';
import 'package:enreda_app/presentation/widgets/spaces.dart';
import 'package:enreda_app/utils/functions.dart';
import 'package:enreda_app/utils/responsive.dart';
import 'package:enreda_app/values/values.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TalentSearchPage extends StatefulWidget {
  @override
  State<TalentSearchPage> createState() => _TalentSearchPageState();

  static ValueNotifier<int> selectedIndex = ValueNotifier(0);
}

class _TalentSearchPageState extends State<TalentSearchPage> {

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
      _buildTalentSearchPageMobile(context) :
      _buildTalentSearchPage(context);
  }


  Widget _buildTalentSearchPage(BuildContext context) {
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
                  child: Image.asset(ImagePath.TALENT_SEARCH_PRESENTATION_IMAGE),
                ),
                Positioned(
                  bottom: -widthOfScreen(context)/19,
                  width: widthOfScreen(context)/1.3,
                  child: Image.asset(ImagePath.TALENT_SEARCH_PRESENTATION_TEXT),
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
                    top: 600,
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
                              _buildBigItemCard(context, ImagePath.ICON_ROCKET_COMPANY, AppLocalizations.of(context)!.rediscover, AppLocalizations.of(context)!.rediscoverTalent),
                              _buildBigItemCard(context, ImagePath.ICON_BULB, AppLocalizations.of(context)!.reimagine, AppLocalizations.of(context)!.reimagineTalent),
                              _buildBigItemCard(context, ImagePath.ICON_GEARS, AppLocalizations.of(context)!.rebuild, AppLocalizations.of(context)!.rebuildTalent),
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
                                  AppLocalizations.of(context)!.talentTitle,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontFamily: GoogleFonts.outfit().fontFamily,
                                    fontSize: 40,
                                    color: AppColors.textBlue,
                                  ),
                                ),
                                SpaceH50(),
                                Text(
                                  AppLocalizations.of(context)!.talentParagraph1,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontSize: 14,
                                    color: AppColors.greyTxtAlt,
                                  ),
                                ),
                                SpaceH12(),
                                Text(
                                  AppLocalizations.of(context)!.talentParagraph2,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontSize: 14,
                                    color: AppColors.greyTxtAlt,
                                  ),
                                ),
                                SpaceH12(),
                                Text(
                                  AppLocalizations.of(context)!.talentParagraph3,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontSize: 14,
                                    color: AppColors.greyTxtAlt,
                                  ),
                                ),
                                SpaceH12(),
                                Text(
                                  AppLocalizations.of(context)!.talentParagraph4,
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
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(22.0),
                                      child:
                                      Center(child: Text(AppLocalizations.of(context)!.exploreProfiles)),
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
                              child: Image.asset(ImagePath.TALENT_SEARCH_EXAMPLE_IMAGE)
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 180,
            ),
            Container(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      AppLocalizations.of(context)!.talentItemsTitle,
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
                        alignment: WrapAlignment.spaceBetween,
                        spacing: 30,
                        runSpacing: 30,
                        children: [
                          _buildSmallItemCard(context, ImagePath.ICON_JOB_OFFER, AppLocalizations.of(context)!.jobOffersPublication, AppLocalizations.of(context)!.jobOffersPublicationText),
                          _buildSmallItemCard(context, ImagePath.ICON_CANDIDATES_FOLLOW, AppLocalizations.of(context)!.candidatesFollow, AppLocalizations.of(context)!.candidatesFollowText),
                          _buildSmallItemCard(context, ImagePath.ICON_CANDIDATES_SELECTION, AppLocalizations.of(context)!.candidatesSelection, AppLocalizations.of(context)!.candidatesSelectionText),
                        ]),
                  ),
                ],
              ),
            ),
            SpaceH180(),
            _buildFooter(context),
          ],
        )
    );
    /*return SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: widthOfScreen(context),
                  //height: 550,
                  child: Image.asset(ImagePath.TALENT_SEARCH_PRESENTATION_IMAGE),
                ),
                Positioned(
                  bottom: -widthOfScreen(context)/19,
                  width: widthOfScreen(context)/1.3,
                  child: Image.asset(ImagePath.TALENT_SEARCH_PRESENTATION_TEXT),
                )
              ],
            ),
            SpaceH180(),
            Stack(
              children: [
                Positioned(
                  child: Image.asset(ImagePath.ENTITY_YELLOW_LINE_1),
                  width: widthOfScreen(context),
                  bottom: 1150,
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
                                      Center(child: Text('IDENTIFICA TU POTENCIAL')),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: widthOfScreen(context)/2.5,
                            child: Image.asset(ImagePath.TALENT_SEARCH_EXAMPLE_IMAGE)
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
                            _buildSmallItemCard(context, ImagePath.ICON_PUZZLE, 'Creación y gestión de recursos', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard d.'),
                            _buildSmallItemCard(context, ImagePath.ICON_PUZZLE, 'Creación y gestión de sesiones', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard d.'),
                            _buildSmallItemCard(context, ImagePath.ICON_PUZZLE, 'Creación y gestión de participantes', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard d.'),
                            _buildSmallItemCard(context, ImagePath.ICON_PUZZLE, 'Acceso a la metodología de Enreda', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard d.'),
                            _buildSmallItemCard(context, ImagePath.ICON_PUZZLE, 'Acceso al directorio de Entidades', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard d.'),
                            _buildSmallItemCard(context, ImagePath.ICON_PUZZLE, 'KPI’s personalizados', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard d.'),],
                        ),
                      ),
                      SpaceH60(),
                      Center(
                        child: Container(
                          width: widthOfScreen(context)/2,
                          child: Column(
                            children: [
                              Text(
                                'Por estas razones debe elegir Enreda como tu portal de empleo de confianza',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontFamily: GoogleFonts.outfit().fontFamily,
                                  fontSize: 38,
                                  color: AppColors.textBlue,
                                ),
                              ),
                              SpaceH30(),
                              Text(
                                'EnREDa te conecta con recursos educativos, actividades, empresas y pleabilidad y construir tu camino vital. Porque las oportunidades no se compran, se crean.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: GoogleFonts.lato().fontFamily,
                                  fontSize: 13,
                                  color: AppColors.greyTxtAlt,
                                  ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SpaceH80(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: widthOfScreen(context)/5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(ImagePath.TALENT_SEARCH_DIAGRAM_1),
                                SpaceH20(),
                                Text(
                                  'Título provisional',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontFamily: GoogleFonts.outfit().fontFamily,
                                    fontSize: 18,
                                    color: AppColors.textBlue,
                                  ),
                                ),
                                SpaceH8(),
                                Text(
                                  'Más de XXX de candidatos motivados por encontrar trabajo en nuestra base de datos.',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontSize: 14,
                                    color: AppColors.greyTxtAlt,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: widthOfScreen(context)/5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(ImagePath.TALENT_SEARCH_DIAGRAM_2),
                                SpaceH20(),
                                Text(
                                  'Título provisional',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontFamily: GoogleFonts.outfit().fontFamily,
                                    fontSize: 18,
                                    color: AppColors.textBlue,
                                  ),
                                ),
                                SpaceH8(),
                                Text(
                                  'Más de XXX de candidatos motivados por encontrar trabajo en nuestra base de datos.',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontSize: 14,
                                    color: AppColors.greyTxtAlt,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: widthOfScreen(context)/5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(ImagePath.TALENT_SEARCH_DIAGRAM_3),
                                SpaceH20(),
                                Text(
                                  'Título provisional',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontFamily: GoogleFonts.outfit().fontFamily,
                                    fontSize: 18,
                                    color: AppColors.textBlue,
                                  ),
                                ),
                                SpaceH8(),
                                Text(
                                  'Más de XXX de candidatos motivados por encontrar trabajo en nuestra base de datos.',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontSize: 14,
                                    color: AppColors.greyTxtAlt,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: widthOfScreen(context)/5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(ImagePath.TALENT_SEARCH_DIAGRAM_4),
                                SpaceH20(),
                                Text(
                                  'Título provisional',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontFamily: GoogleFonts.outfit().fontFamily,
                                    fontSize: 18,
                                    color: AppColors.textBlue,
                                  ),
                                ),
                                SpaceH8(),
                                Text(
                                  'Más de XXX de candidatos motivados por encontrar trabajo en nuestra base de datos.',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontSize: 14,
                                    color: AppColors.greyTxtAlt,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            SpaceH200(),
            _buildFooter(context),
          ],
        ));*/
  }

  Widget _buildTalentSearchPageMobile(BuildContext context) {
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
                  child: Image.asset(ImagePath.TALENT_SEARCH_PRESENTATION_IMAGE),
                ),
                Positioned(
                  bottom: -widthOfScreen(context)/20,
                  width: widthOfScreen(context)/1.3,
                  child: Image.asset(ImagePath.TALENT_SEARCH_PRESENTATION_TEXT),
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
                    top: 950,
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
                              _buildBigItemCardMobile(context, ImagePath.ICON_ROCKET_COMPANY, AppLocalizations.of(context)!.rediscover, AppLocalizations.of(context)!.rediscoverTalent),
                              _buildBigItemCardMobile(context, ImagePath.ICON_BULB, AppLocalizations.of(context)!.reimagine, AppLocalizations.of(context)!.reimagineTalent),
                              _buildBigItemCardMobile(context, ImagePath.ICON_GEARS, AppLocalizations.of(context)!.rebuild, AppLocalizations.of(context)!.rebuildTalent),
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
                                  AppLocalizations.of(context)!.talentTitle,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontFamily: GoogleFonts.outfit().fontFamily,
                                    fontSize: fontSizeTitle,
                                    color: AppColors.textBlue,
                                  ),
                                ),
                                SpaceH20(),
                                Text(
                                  AppLocalizations.of(context)!.talentParagraph1,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontSize: fontSizeBody,
                                    color: AppColors.greyTxtAlt,
                                  ),
                                ),
                                SpaceH12(),
                                Text(
                                  AppLocalizations.of(context)!.talentParagraph2,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontSize: fontSizeBody,
                                    color: AppColors.greyTxtAlt,
                                  ),
                                ),
                                SpaceH12(),
                                Text(
                                  AppLocalizations.of(context)!.talentParagraph3,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontSize: fontSizeBody,
                                    color: AppColors.greyTxtAlt,
                                  ),
                                ),
                                SpaceH12(),
                                Text(
                                  AppLocalizations.of(context)!.talentParagraph4,
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
                                      Center(child: Text(AppLocalizations.of(context)!.exploreProfiles)),
                                    ),
                                  ),
                                ),
                                SpaceH30(),
                                Container(
                                    clipBehavior: Clip.none,
                                    decoration: BoxDecoration(),
                                    width: widthOfScreen(context),
                                    child: Image.asset(ImagePath.TALENT_SEARCH_EXAMPLE_IMAGE)
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
                    bottom: 250,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1200,
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
                        AppLocalizations.of(context)!.talentItemsTitle,
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
                          _buildSmallItemCardMobile(context, ImagePath.ICON_JOB_OFFER, AppLocalizations.of(context)!.jobOffersPublication, AppLocalizations.of(context)!.jobOffersPublicationText),
                          _buildSmallItemCardMobile(context, ImagePath.ICON_CANDIDATES_FOLLOW, AppLocalizations.of(context)!.candidatesFollow, AppLocalizations.of(context)!.candidatesFollowText),
                          _buildSmallItemCardMobile(context, ImagePath.ICON_CANDIDATES_SELECTION, AppLocalizations.of(context)!.candidatesSelection, AppLocalizations.of(context)!.candidatesSelectionText),
                        ]
                    ),
                  ],
                ),
              ),
            ),
            SpaceH100(),
            _buildFooterMobile(context),
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

  Widget _buildFooterMobile(BuildContext context){
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              color: AppColors.skyBlue,
              width: widthOfScreen(context),
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                color: AppColors.textBlue,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    children: [
                      SpaceH80(),
                      Text(
                        'Únete a Enreda y\nconstruye tu futuro\ncon nosotras/os'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          fontFamily: GoogleFonts.outfit().fontFamily,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SpaceH20(),
                      Text(
                        'Descubre cómo transformamos el camino hacia\nel empleo, escuchando y colaborando con\nel ecosistema para crear oportunidades en red.',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          fontFamily: GoogleFonts.lato().fontFamily,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SpaceH30(),
                      _buildEmailFieldYellow(context),
                      SpaceH30(),
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
                          onPressed: () => openUrlLink(StringConst.WEB_APP_URL),
                          child: Padding(
                            padding: EdgeInsets.all(22.0),
                            child:
                            Center(child: Text('Quiero inscribrime ahora'.toUpperCase())),
                          ),
                        ),
                      ),
                      SpaceH36()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          color: AppColors.skyBlue,
          width: widthOfScreen(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpaceH40(),
                Container(
                  width: 50,
                  child: Image.asset(ImagePath.LOGO_ENREDA_BLACK),
                ),
                SpaceH16(),
                _buildSubMenuItem('Menú', true),
                Padding(
                  padding: const EdgeInsets.only(right: 150.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 150.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                Divider(
                  color: AppColors.textBlue,
                ),
                SpaceH20(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                      child: Container(
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: Row(
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
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          color: AppColors.textBlue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 40,
                    child: Image.asset(ImagePath.LOGO_SIC4CHANGE),
                  ),
                ),
              )
            ],
          ),

        )
      ],
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
              width: Responsive.isMobile(context) ? 200 : 300,
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
                      'Únete a Enreda y\nconstruye tu futuro\ncon nosotras/os'.toUpperCase(),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:150.0, left: 130),
                child: Container(
                  width: widthOfScreen(context)/5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Formulario de contacto'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          fontFamily: GoogleFonts.outfit().fontFamily,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SpaceH20(),
                      Text(
                        '¿Te gustaría encontrar jóvenes candidatos de forma rápida y sencilla? Estamos encantados de ayudarte:',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          fontFamily: GoogleFonts.lato().fontFamily,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:50.0, right: 100),
                child: Column(
                  children: [
                    contactFormField('Nombre y apellidos'),
                    contactFormField('Empresa'),
                    contactFormField('Ciudad'),
                    contactFormField('Correo electrónico'),
                    contactFormField('Número de télefono'),
                    contactFormField('¿Qué tipo de colaboración o información estás buscando?'),
                    SpaceH20(),
                    Container(
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

                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget contactFormField(String title){
    return Container(
      width: widthOfScreen(context)/3,
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

}


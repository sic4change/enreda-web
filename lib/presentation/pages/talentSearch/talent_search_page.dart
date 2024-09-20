import 'package:enreda_app/localization/LocaleProvider.dart';
import 'package:enreda_app/presentation/layout/adaptive.dart';
import 'package:enreda_app/presentation/pages/home/home_page.dart';
import 'package:enreda_app/presentation/pages/home/sections/footer_form_new.dart';
import 'package:enreda_app/presentation/widgets/spaces.dart';
import 'package:enreda_app/utils/functions.dart';
import 'package:enreda_app/utils/responsive.dart';
import 'package:enreda_app/values/values.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

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

  ScrollController scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context) ?
      _buildTalentSearchPageMobile(context) :
      _buildTalentSearchPage(context);
  }


  Widget _buildTalentSearchPage(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context, listen: true);
    return SingleChildScrollView(
        controller: scrollController,
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
                  bottom: localeProvider.locale == Locale("es") ? -widthOfScreen(context)/19 : -widthOfScreen(context)/24,
                  width: widthOfScreen(context)/1.3,
                  child: localeProvider.locale == Locale("es") ? Image.asset(ImagePath.TALENT_SEARCH_PRESENTATION_TEXT) : Image.asset(ImagePath.TALENT_SEARCH_PRESENTATION_TEXT_EN),
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
                                SpaceH30(),
                                Container(
                                  height: 70,
                                  width: 400,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.buttonBlue,
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                      foregroundColor: AppColors.white,
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
                                      scrollController.animateTo(scrollController.position.maxScrollExtent - 500, duration: Duration(seconds: 1), curve: Curves.easeIn);
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
                  SpaceH60(),
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
            SpaceH80(),
            Container(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      AppLocalizations.of(context)!.enredaCompanies,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: GoogleFonts.outfit().fontFamily,
                        fontSize: 45,
                        color: AppColors.textBlue,
                      ),
                    ),
                  ),
                  SpaceH60(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 200.0),
                    child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 30,
                        runSpacing: 30,
                        children: [
                          Container(
                            height: 100,
                            child: Image.asset(ImagePath.LOGO_ACCENTURE)
                          ),
                          Container(
                              height: 100,
                              child: Image.asset(ImagePath.LOGO_FUTURO)
                          ),
                          Container(
                              height: 100,
                              child: Image.asset(ImagePath.LOGO_IBEROSTAR)
                          ),
                          Container(
                              height: 100,
                              width: 120,
                              child: Image.asset(ImagePath.ENREDADA_7)
                          ),
                        ]),
                  ),
                ],
              ),
            ),
            SpaceH100(),
            FooterFormNew(isEntity: false),
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
    final localeProvider = Provider.of<LocaleProvider>(context, listen: true);
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
                  bottom: localeProvider.locale == Locale("es") ? -widthOfScreen(context)/20 : -widthOfScreen(context)/25,
                  width: widthOfScreen(context)/1.3,
                  child: localeProvider.locale == Locale("es") ?  Image.asset(ImagePath.TALENT_SEARCH_PRESENTATION_TEXT) : Image.asset(ImagePath.TALENT_SEARCH_PRESENTATION_TEXT_EN),
                )
              ],
            ),
            SpaceH30(),
            Container(
              //height: 1150,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 750,
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
                                SpaceH30(),
                                Container(
                                  height: 60,
                                  width: widthOfScreen(context)*0.7,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.buttonBlue,
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                      foregroundColor: AppColors.white,
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
                    bottom: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1400,
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
                    SpaceH30(),
                    Center(
                      child: Text(
                        AppLocalizations.of(context)!.enredaCompanies,
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
                          Container(
                              height: 80,
                              child: Image.asset(ImagePath.LOGO_ACCENTURE)
                          ),
                          Container(
                              height: 80,
                              child: Image.asset(ImagePath.LOGO_FUTURO)
                          ),
                          Container(
                              height: 80,
                              child: Image.asset(ImagePath.LOGO_IBEROSTAR)
                          ),
                          Container(
                              height: 80,
                              width: 100,
                              child: Image.asset(ImagePath.ENREDADA_7)
                          ),
                        ]
                    ),
                  ],
                ),
              ),
            ),
            SpaceH100(),
            FooterFormNew(isEntity: false),
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


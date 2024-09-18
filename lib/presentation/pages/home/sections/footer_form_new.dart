import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enreda_app/models/contact.dart';
import 'package:enreda_app/presentation/pages/home/home_page.dart';
import 'package:enreda_app/presentation/widgets/dialogs/show_alert_dialog.dart';
import 'package:enreda_app/presentation/widgets/dialogs/show_exception_alert_dialog.dart';
import 'package:enreda_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


import '../../../../utils/functions.dart';
import '../../../../utils/responsive.dart';
import '../../../../values/values.dart';
import '../../../layout/adaptive.dart';
import '../../../widgets/spaces.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FooterFormNew extends StatefulWidget {
  FooterFormNew({Key? key, required this.isEntity});
  final bool isEntity;
  @override
  _FooterFormNewState createState() => _FooterFormNewState();
}

class _FooterFormNewState extends State<FooterFormNew> {

  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _name;
  String? _entityName;
  String? _phone;
  String? _text;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool _isHoveredResources = false;
  bool _isHoveredJob = false;
  bool _isHoveredSocialEntity = false;
  bool _isHoveredTalent = false;

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context) ?
      _buildFooterMobile(context) :
      _buildFooter(context);
  }

  Widget _buildFooter(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(top:100.0),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                color: AppColors.skyBlue,
                width: widthOfScreen(context),
                height: 200,
              ),
              _buildContactFormCommunityPanel(context),
            ],
          ),
          Container(
            color: AppColors.skyBlue,
            height: 450,
            width: widthOfScreen(context),
            child: Padding(
              padding: EdgeInsets.only(right: 100, left: 100, top: 100, bottom: 89),
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
                              _buildSubMenuItem(AppLocalizations.of(context)!.menu, true, false),
                              MouseRegion(
                                onEnter: (_) {
                                  setState(() {
                                    _isHoveredResources = true;
                                  });
                                },
                                onExit: (_) {
                                  setState(() {
                                    _isHoveredResources = false;
                                  });
                                },
                                child: InkWell(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => HomePage(pageSelected: StringConst.RESOURCES,)),
                                      );
                                    },
                                    child: _buildSubMenuItem(AppLocalizations.of(context)!.resources, false, _isHoveredResources)
                                ),
                              ),
                              MouseRegion(
                                onEnter: (_) {
                                  setState(() {
                                    _isHoveredJob = true;
                                  });
                                },
                                onExit: (_) {
                                  setState(() {
                                    _isHoveredJob = false;
                                  });
                                },
                                child: InkWell(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => HomePage(pageSelected: StringConst.JOB_SEARCH,)),
                                      );
                                    },
                                    child: _buildSubMenuItem(AppLocalizations.of(context)!.jobSearch, false, _isHoveredJob)
                                ),
                              ),
                              MouseRegion(
                                onEnter: (_) {
                                  setState(() {
                                    _isHoveredSocialEntity = true;
                                  });
                                },
                                onExit: (_) {
                                  setState(() {
                                    _isHoveredSocialEntity = false;
                                  });
                                },
                                child: InkWell(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => HomePage(pageSelected: StringConst.SOCIAL_ENTITY,)),
                                      );
                                    },
                                    child: _buildSubMenuItem(AppLocalizations.of(context)!.socialEntities, false, _isHoveredSocialEntity)
                                ),
                              ),
                              MouseRegion(
                                onEnter: (_) {
                                  setState(() {
                                    _isHoveredTalent = true;
                                  });
                                },
                                onExit: (_) {
                                  setState(() {
                                    _isHoveredTalent = false;
                                  });
                                },
                                child: InkWell(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => HomePage(pageSelected: StringConst.TALENT_SEARCH,)),
                                      );
                                    },
                                    child: _buildSubMenuItem(AppLocalizations.of(context)!.talentSearch, false, _isHoveredTalent)
                                ),
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
                        AppLocalizations.of(context)!.partOfChange,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: GoogleFonts.outfit().fontFamily,
                          color: AppColors.textBlue,
                          fontSize: 36,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.enredate,
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
                                  backgroundColor: AppColors.textBlue,
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                  foregroundColor: AppColors.white,
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
                                  Center(child: Text(AppLocalizations.of(context)!.contactNow.toUpperCase())),
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
                              onTap: () => openUrlLink(StringConst.INSTAGRAM_URL),
                              child: Image.asset(ImagePath.ICON_INSTAGRAM, height: 36)
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
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
                  InkWell(
                      onTap: () => openUrlLink(StringConst.WEB_SIC4Change),
                      child: Container(
                        height: 40,
                        child: Image.asset(ImagePath.LOGO_SIC4CHANGE)
                      )
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

  Widget _buildSubMenuItem(String name, bool isTitle, bool isHovered){
    var textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.only(bottom: isTitle ? 14 : 6),
      child: Text(
        name,
        style: textTheme.titleLarge!.copyWith(
          fontFamily: GoogleFonts.lato().fontFamily,
          decoration: isHovered ? TextDecoration.underline : TextDecoration.none,
          fontSize: isTitle ? 20 : 14,
          fontWeight: (isTitle || isHovered) ? FontWeight.w800 : FontWeight.w400,
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
      height: 700,
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
                        widget.isEntity ?  'Transforma el futuro de tus participantes. Explícanos brevemente tu proyecto y nos pondremos en contacto contigo.' : '¿Te gustaría encontrar el talento de forma rápida y sencilla? Rellena este formulario y nos pondremos en contacto contigo.',
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
                child: Form(
                  key: _formKey,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          contactFormField('Nombre y apellidos', (value) => _name = value),
                          contactFormField(widget.isEntity ? 'Nombre de la entidad' : 'Empresa', (value) => _entityName = value),
                          contactFormField('Correo electrónico', (value) => _email = value),
                          contactFormField('Número de télefono', (value) => _phone = value),
                        ],
                      ),
                      SpaceW48(),
                      contactFormFieldBig("¿En qué podemos ayudarte?", (value) => _text = value),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  height: 60,
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.turquoiseDark,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      foregroundColor: AppColors.white,
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
                      _submit();
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

  Widget contactFormField(String title, Function(String?) onSaved){
    return Container(
      width: widthOfScreen(context)/4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
              height: 65,
              child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    errorStyle: TextStyle(
                      fontSize: 12,
                      color: AppColors.skyBlue,
                    ),
                    helperText: " "
                  ),
                  initialValue: '',
                  validator: (value) =>
                  value!.isNotEmpty ? null : 'Este campo no puede estar vacío',
                  onSaved: onSaved,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.name
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget contactFormFieldBig(String title, Function(String?) onSaved){
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
                    errorStyle: TextStyle(
                      fontSize: 12,
                      color: AppColors.skyBlue,
                    ),
                  ),
                  initialValue: '',
                  validator: (value) =>
                  value!.isNotEmpty ? null : 'Este campo no puede estar vacío',
                  onSaved: onSaved,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.name
              ),
            )
          ],
        ),
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
                            backgroundColor: AppColors.turquoiseDark,
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                            foregroundColor: AppColors.white,
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
                            Center(child: Text('Quiero inscribirme ahora'.toUpperCase())),
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
                _buildSubMenuItem(AppLocalizations.of(context)!.menu, true, false),
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
                          child: _buildSubMenuItem(AppLocalizations.of(context)!.resources, false, _isHoveredResources)
                      ),
                      InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage(pageSelected: StringConst.JOB_SEARCH,)),
                            );
                          },
                          child: _buildSubMenuItem(AppLocalizations.of(context)!.jobSearch, false, _isHoveredJob)
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
                          child: _buildSubMenuItem(AppLocalizations.of(context)!.socialEntities, false, _isHoveredSocialEntity)
                      ),
                      InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage(pageSelected: StringConst.TALENT_SEARCH,)),
                            );
                          },
                          child: _buildSubMenuItem(AppLocalizations.of(context)!.talentSearch, false, _isHoveredTalent)
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
                      AppLocalizations.of(context)!.partOfChange,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: GoogleFonts.outfit().fontFamily,
                        color: AppColors.textBlue,
                        fontSize: 36,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.enredate,
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
                            backgroundColor: AppColors.textBlue,
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                            foregroundColor: AppColors.white,
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
                            Center(child: Text(AppLocalizations.of(context)!.contactNow.toUpperCase())),
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
                              onTap: () => openUrlLink(StringConst.INSTAGRAM_URL),
                              child: Image.asset(ImagePath.ICON_INSTAGRAM, height: 36)
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
          AppLocalizations.of(context)!.putEmail,
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

  bool _validateAndSaveForm() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> _submit() async {
    if (_validateAndSaveForm()) {
      final contact = Contact(
        email: _email!,
        name: _name!,
        text: 'Tenemos un contacto mediante la página web: Se ha puesto en contacto $_name, de la entidad/empresa $_entityName, con teléfono $_phone. El motivo del contacto es el siguiente: ${_text!}',
      );
      try {
        final database = Provider.of<Database>(context, listen: false);
        await database.addContact(contact);
        showAlertDialog(
          context,
          title: 'Mensaje enviado',
          content: 'Hemos recibido satisfactoriamente tu mensaje, nos comunicaremos contigo a la brevedad.',
          defaultActionText: 'Ok',
        ).then((value) => (value) {});
      } on FirebaseException catch (e) {
        showExceptionAlertDialog(context,
            title: 'Error al enviar contacto', exception: e).then((value) => (value) {});
      }
    }
  }

}
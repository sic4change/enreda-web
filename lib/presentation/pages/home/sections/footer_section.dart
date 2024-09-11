import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../../../models/contact.dart';
import '../../../../services/database.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/responsive.dart';
import '../../../../values/values.dart';
import '../../../layout/adaptive.dart';
import '../../../routes/router.gr.dart';
import '../../../widgets/buttons/enreda_button.dart';
import '../../../widgets/buttons/social_button.dart';
import '../../../widgets/dialogs/show_alert_dialog.dart';
import '../../../widgets/dialogs/show_exception_alert_dialog.dart';
import '../../../widgets/enreda_info_section.dart';
import '../../../widgets/enreda_vertical_divider.dart';
import '../../../widgets/spaces.dart';

List<FooterItem> footerItems = [
  FooterItem(
    title: StringConst.MAIL_ME + ":",
    subtitle: StringConst.DEV_EMAIL_2,
    image: ImagePath.FOOTER_CONTACT,
  ),
];

class FooterSection extends StatefulWidget {
  FooterSection({Key? key});
  @override
  _FooterSectionState createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection> {
  late StackRouter router;
  final _formKey = GlobalKey<FormState>();
  String? _email = "";
  String? _name = "";
  String? _description = "";

  @override
  void initState() {
    super.initState();
    _email = "";
    _name = "";
    _description = "";
  }

  _resetFields() {
    _formKey.currentState?.reset();
  }

  bool _validateAndSaveForm() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
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
        text: _description!,
      );
      _resetFields();
      try {
        final database = Provider.of<Database>(context, listen: false);
        await database.addContact(contact);
        showAlertDialog(
          context,
          title: StringConst.CONFIRM,
          content: StringConst.OK_MESSAGE,
          defaultActionText: StringConst.OK,
        ).then((value) => _resetFields());
      } on FirebaseException catch (e) {
        showExceptionAlertDialog(context,
            title: StringConst.ERROR_MESSAGE, exception: e).then((value) => Navigator.pop(context));
      }
    }
  }

  List<Widget> _buildFormChildren(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double fontSize = responsiveSize(context, 14, 18, md: 15);
    return [
      Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
                decoration: new InputDecoration(
                  labelText: StringConst.NAME,
                  labelStyle: textTheme.bodyMedium?.copyWith(
                    color: AppColors.greyTxtAlt,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                    fontSize: fontSize,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: AppColors.greyTxtAlt,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: AppColors.black400,
                      width: 1.0,
                    ),
                  ),
                ),
                style: textTheme.bodyMedium?.copyWith(
                  color: AppColors.greyTxtAlt,
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                  fontSize: fontSize,
                ),
                initialValue: '',
                validator: (value) =>
                (value != null && value.isNotEmpty) ? null : StringConst.NAME_ERROR,
                onSaved: (value) => _name = value!,
                onChanged: (value) => _name = value,
                textCapitalization: TextCapitalization.sentences,
                keyboardType: TextInputType.name),
            SpaceH20(),
            TextFormField(
                decoration: new InputDecoration(
                  labelText: StringConst.EMAIL,
                  labelStyle: textTheme.bodyMedium?.copyWith(
                      color: AppColors.greyTxtAlt,
                      height: 1.5,
                      fontWeight: FontWeight.w400,
                      fontSize: fontSize,
                      ),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: AppColors.greyTxtAlt,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: AppColors.black400,
                      width: 1.0,
                    ),
                  ),
                ),
                style: textTheme.bodyMedium?.copyWith(
                  color: AppColors.greyTxtAlt,
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                  fontSize: fontSize,
                ),
                initialValue: _email,
                validator: (value) => EmailValidator.validate(value!) ? null : StringConst.EMAIL_ERROR,
                onSaved: (value) => _email = value!,
                onChanged: (value) => _email = value,
                keyboardType: TextInputType.emailAddress),
            SpaceH20(),
            TextFormField(
                decoration: new InputDecoration(
                  labelText: StringConst.DESCRIPTION,
                  labelStyle: textTheme.bodyMedium?.copyWith(
                    color: AppColors.greyTxtAlt,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                    fontSize: fontSize,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: AppColors.greyTxtAlt,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: AppColors.black400,
                      width: 1.0,
                    ),
                  ),
                ),
                style: textTheme.bodyMedium?.copyWith(
                  color: AppColors.greyTxtAlt,
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                  fontSize: fontSize,
                ),
                initialValue: _description,
                validator: (value) =>
                (value != null && value.isNotEmpty) ? null : StringConst.DESCRIPTION_ERROR,
                onSaved: (value) => {
                  _description = value!
                },
                onChanged: (value) => {
                  _description = value},
                minLines: 4,
                maxLines: 4,
                textCapitalization: TextCapitalization.sentences,
                keyboardType: TextInputType.multiline),
            SizedBox(height: Borders.kDefaultPadding * 2),
            EnredaButton(
              buttonTitle: StringConst.SEND.toUpperCase(),
              buttonColor: AppColors.greyDark,
              onPressed: _submit,
              borderRadius: BorderRadius.circular(25),
            ),
            SizedBox(
              height: 8.0,
            ),
          ])
    ];
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildFormChildren(context),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? footerTextStyle = textTheme.bodySmall?.copyWith(
      color: AppColors.primaryText2,
      fontWeight: FontWeight.bold,
    );

    double screenWidth = widthOfScreen(context) - (getSidePadding(context) * 2);
    double screenHeight = heightOfScreen(context);
    double width = screenWidth;
    double height = responsiveSize(
      context,
      screenHeight,
      screenHeight * 0.7,
      md: screenHeight * 0.7,
      sm: screenHeight * 0.7,
    );


    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.lightViolet.withOpacity(0.95),
              AppColors.ultraLightViolet.withOpacity(0.13)
            ],
          )
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Responsive.isTablet(context) || Responsive.isMobile(context) ? Container() :
              Positioned(
                top: -150,
                left: -290,
                child: Image.asset(
                  ImagePath.FOOTER_CIRCLE,
                  height: height * 0.7,
                ),
              ),
              Positioned(
                top: -10,
                right: -50,
                child: Image.asset(
                  ImagePath.FOOTER_ASK,
                  height: height * 0.6,
                ),
              ),
              Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: Borders.kDefaultPaddingDouble),
                      Center(child: EnredaInfoSection2(
                        hasSectionTitle: true,
                        hasTitle1: true,
                        hasTitle2: false,
                        hasBody: false,
                        sectionTitle: StringConst.TALK_WITH_US.toUpperCase(),
                        title1: StringConst.ANY_QUESTION,
                      )),
                    ],
                  ),
                  Flex(
                    direction: Responsive.isTablet(context) || Responsive.isMobile(context) ? Axis.vertical : Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Responsive.isTablet(context) || Responsive.isMobile(context) ? Container() :
                      SizedBox(width: 100),
                      Responsive.isTablet(context) || Responsive.isMobile(context) ? Container() :
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ..._buildFooterItems(footerItems),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: Responsive.isTablet(context) || Responsive.isMobile(context) ? 0 : 2,
                        child: Container(
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  padding: EdgeInsets.all(Borders.kDefaultPaddingDouble),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: _buildForm(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Responsive.isTablet(context) || Responsive.isMobile(context) ? Container() :
                      SizedBox(width: 100),
                      Responsive.isTablet(context) || Responsive.isMobile(context) ?
                      Expanded(
                        flex: 0,
                        child: Container(
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ..._buildFooterItems(footerItems),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ) : Container(),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SpaceH50(),
          InkWell(
            onTap: () => router.push(HomeRoute()),
            child: Image.asset(
              ImagePath.LOGO_DARK,
              height: Sizes.HEIGHT_74,
            ),
          ),
          SpaceH30(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  SpaceW20(),
                  ..._buildSocialIcons(Data.socialData),
                  SpaceW20(),
                ],
              ),
            ],
          ),
          Responsive.isTablet(context) || Responsive.isMobile(context) ? SpaceH30() : Container(),
          Flex(
            direction: Responsive.isTablet(context) || Responsive.isMobile(context) ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () => openUrlLink(StringConst.PRIVACITY_URL),
                  child: RichText(
                    text: TextSpan(
                      text: StringConst.RIGHTS_RESERVED + " ",
                      style: footerTextStyle,
                      children: [
                        TextSpan(text: StringConst.DESIGNED_BY + " "),
                        TextSpan(
                          text: " ",
                          style: footerTextStyle?.copyWith(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w900,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Responsive.isTablet(context) || Responsive.isMobile(context) ? Container() :
              EnredaVerticalDivider(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () => openUrlLink(StringConst.USE_CONDITIONS_URL),
                  child: RichText(
                    text: TextSpan(
                      text: StringConst.BUILT_BY + " ",
                      style: footerTextStyle,
                      children: [

                      ],
                    ),
                  ),
                ),
              ),
              Responsive.isTablet(context) || Responsive.isMobile(context) ? Container() :
              EnredaVerticalDivider(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(StringConst.MADE_BY, style: footerTextStyle),
                    SpaceW4(),
                    Icon(
                      FontAwesomeIcons.solidHeart,
                      color: AppColors.turquoise,
                      size: Sizes.ICON_SIZE_12,
                    ),
                    SpaceW4(),
                    Text(StringConst.WITH_LOVE, style: footerTextStyle),
                    SpaceW4(),
                    InkWell(
                      onTap: () => openUrlLink(StringConst.WEB_SIC4Change),
                      child: RichText(
                        text: TextSpan(
                          text: " ",
                          style: footerTextStyle,
                          children: [
                            TextSpan(
                              text: StringConst.SIC4CHANGE + ". ",
                              style: footerTextStyle?.copyWith(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w900,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SpaceH100(),
            ],
          )
        ],
      ),
    );
  }

  List<Widget> _buildFooterItems(List<FooterItem> data,
      {bool isHorizontal = false}) {
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        FooterItem(
          title: data[index].title,
          subtitle: data[index].subtitle,
          image: data[index].image,
        ),
      );
      if (index < data.length - 1) {
        if (isHorizontal) {
          items.add(Spacer(flex: 1));
        } else {
          items.add(SpaceH40());
        }
      }
    }
    return items;
  }

  List<Widget> _buildSocialIcons(List<SocialButtonData> socialItems) {
    List<Widget> items = [];
    for (int index = 0; index < socialItems.length; index++) {
      items.add(
        SocialButton(
          tag: socialItems[index].tag,
          iconData: socialItems[index].iconData,
          onPressed: () => openUrlLink(socialItems[index].url),
        ),
      );
      items.add(SpaceW16());
    }
    return items;
  }

}

class FooterItem extends StatelessWidget {
  FooterItem({
    required this.title,
    required this.subtitle,
    required this.image,
  });

  final String title;
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double fontSize = responsiveSize(context, 14, 18, md: 15);
    return Padding(
      padding: Responsive.isMobile(context) ? EdgeInsets.all(10.0) : Responsive.isDesktopS(context) ? EdgeInsets.all(20.0) : EdgeInsets.all(40.0),
      child: Column(
        children: [
          Image.asset(
            image,
            height: Responsive.isTablet(context) || Responsive.isMobile(context) ? Sizes.ICON_SIZE_40 : Sizes.ICON_SIZE_60,
          ),
          SpaceH12(),
          Text(
            title,
            style: textTheme.titleMedium?.copyWith(
              color: AppColors.greyTxtAlt, fontSize: fontSize,
            ),
          ),
          SpaceH8(),
          Text(
            subtitle,
            style: textTheme.bodyMedium?.copyWith(
              color: AppColors.greyTxtAlt.withOpacity(0.7), fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}

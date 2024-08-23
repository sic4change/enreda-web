import 'package:enreda_app/presentation/pages/resources/build_share_button.dart';
import 'package:enreda_app/presentation/pages/resources/sections/show_alert_user_anonimous.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../models/resource.dart';
import '../../../../utils/const.dart';
import '../../../../utils/responsive.dart';
import '../../../../values/values.dart';
import '../../../layout/adaptive.dart';
import '../../../widgets/buttons/dialog_main_button.dart';
import '../../../widgets/spaces.dart';
import '../../../widgets/widgets/custom_text_title.dart';

class ShowResourceDetailDialog extends StatelessWidget {
  final Resource resource;

  ShowResourceDetailDialog({
    required this.resource,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      content: dialogContent(context, resource),
      contentPadding: EdgeInsets.all(0.0),
    );
  }
}

dialogContent(BuildContext context, Resource resource) {
  final isSmallScreen = widthOfScreen(context) < 1200;
  final dialogWidth = Responsive.isMobile(context) || isSmallScreen
      ? widthOfScreen(context)
      : widthOfScreen(context) * 0.55;
  final dialogHeight = Responsive.isMobile(context)
      ? heightOfScreen(context)
      : heightOfScreen(context) * 0.80;
  TextTheme textTheme = Theme.of(context).textTheme;
  double fontSizeTitle = responsiveSize(context, 14, 22, md: 18);
  double fontSizePromotor = responsiveSize(context, 12, 16, md: 14);
  return Stack(
    children: <Widget>[
      Container(
        width: dialogWidth,
        height: dialogHeight,
        padding: EdgeInsets.only(
          top: Consts.avatarRadius / 2,
          bottom: Consts.padding,
          left: Consts.padding,
          right: Consts.padding,
        ),
        margin: EdgeInsets.only(
            top: Responsive.isMobile(context)
                ? Consts.avatarRadius / 2
                : Consts.avatarRadius),
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(Consts.padding),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // To make the card compact
          children: <Widget>[
            Stack(
              children: [
                Container(
                  height: 90,
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Responsive.isMobile(context) ? SpaceH20() : SpaceH30(),
                      Padding(
                        padding: const EdgeInsets.only(right: 30.0, left: 30.0),
                        child: Text(
                          resource.title,
                          textAlign: TextAlign.center,
                          maxLines: Responsive.isMobile(context) ? 2 : 1,
                          style: textTheme.bodyText1?.copyWith(
                            letterSpacing: 1.2,
                            color: AppColors.greyTxtAlt,
                            height: 1.5,
                            fontWeight: FontWeight.w300,
                            fontSize: fontSizeTitle,
                          ),
                        ),
                      ),
                      SpaceH4(),
                      Expanded(
                        flex: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              resource.promotor?.isNotEmpty == true
                                  ? resource.promotor!
                                  : resource.organizerName ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                letterSpacing: 1.2,
                                fontSize: fontSizePromotor,
                                fontWeight: FontWeight.bold,
                                color: AppColors.bluePurple,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Spacer(),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop((false)),
                      child: Icon(
                        Icons.close,
                        color: AppColors.greyTxtAlt,
                        size: widthOfScreen(context) >= 1024 ? 25 : 20,
                      ),
                    ),
                  ],
                ),
                Responsive.isMobile(context) ? Container() : SpaceH12(),
              ],
            ),
            Divider(
              color: AppColors.grey150,
              thickness: 1,
            ),
            Expanded(
                child:
                    Responsive.isMobile(context) || Responsive.isTablet(context)
                        ? _buildDetailsListViewMobile(context, resource)
                        : _buildDetailsListViewWeb(context, resource)),
          ],
        ),
      ),
      Positioned(
        left: Responsive.isMobile(context)
            ? (dialogWidth / 2) - 60
            : isSmallScreen
                ? (dialogWidth / 2) - 80
                : (dialogWidth / 2) - 80 * 0.55,
        width: Responsive.isMobile(context) ? 50 : 80,
        child: Container(
          color: Colors.transparent,
          width: Responsive.isMobile(context) ? 50 : 80,
          height: Responsive.isMobile(context) ? 50 : 80,
          child: resource.organizerImage == null ||
                  resource.organizerImage!.isEmpty
              ? Container()
              : CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  radius: Consts.avatarRadius,
                  backgroundImage: NetworkImage(resource.organizerImage!),
                ),
        ),
      ),
      Responsive.isTablet(context) || Responsive.isMobile(context)
          ? Container()
          : Positioned(
              bottom: 1,
              child: Padding(
                padding:
                    EdgeInsets.fromLTRB(20.0, 0.0, 20.0, Constants.mainPadding),
                child: Container(
                  height: 60,
                  width: dialogWidth,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: Responsive.isMobile(context)
                              ? CrossAxisAlignment.center
                              : CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DialogMainButton(
                              title: StringConst.JOIN_RESOURCE,
                              onPressed: () => showAlertUserAnonimous(context),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: buildShareButton(
                            context, resource, AppColors.darkBlue),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: Responsive.isMobile(context)
                              ? MainAxisAlignment.center
                              : MainAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: FaIcon(FontAwesomeIcons.heart),
                              tooltip: 'Me gusta',
                              color: AppColors.darkBlue,
                              iconSize: 24,
                              onPressed: () => showAlertUserAnonimous(context),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ),
    ],
  );
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 40.0;
}

Widget _buildDetailsListViewWeb(BuildContext context, Resource resource) {
  double fontSize = responsiveSize(context, 13, 14, md: 14);
  TextTheme textTheme = Theme.of(context).textTheme;
  return Padding(
    padding: const EdgeInsets.only(bottom: 80.0),
    child: SingleChildScrollView(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: Responsive.isMobile(context) ? 2 : 4,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, right: 30.0, left: 10),
                  child: Text(
                    resource.description,
                    textAlign: TextAlign.left,
                    style: textTheme.bodyText1?.copyWith(
                      color: AppColors.greyTxtAlt,
                      fontWeight: FontWeight.w400,
                      fontSize: fontSize,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: Responsive.isMobile(context) ? 2 : 2,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.greyDarkTxt, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextTitle(title: StringConst.RESOURCE_TYPE.toUpperCase()),
                      CustomTextBody(text: '${resource.resourceCategoryName}'),
                      SpaceH8(),
                      CustomTextTitle(title: StringConst.LOCATION.toUpperCase()),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                              child: CustomTextBody(
                                  text: '${resource.cityName}, ${resource.provinceName}, ${resource.countryName}'
                              )
                          ),
                        ],
                      ),
                      SpaceH8(),
                      CustomTextTitle(title: StringConst.MODALITY.toUpperCase()),
                      CustomTextBody(text: resource.modality),
                      SpaceH8(),
                      CustomTextTitle(title: StringConst.CAPACITY.toUpperCase()),
                      CustomTextBody(text: '${resource.capacity}'),
                      SpaceH8(),
                      CustomTextTitle(title: StringConst.DATE.toUpperCase()),
                      DateFormat('dd/MM/yyyy').format(resource.start) == '31/12/2050'
                          ? CustomTextBody(
                        text: StringConst.ALWAYS_AVAILABLE,
                      )
                          : Row(
                        children: [
                          CustomTextBody(
                              text: DateFormat('dd/MM/yyyy').format(resource.start)),
                          SpaceW4(),
                          CustomTextBody(text: '-'),
                          SpaceW4(),
                          CustomTextBody(
                              text: DateFormat('dd/MM/yyyy').format(resource.end))
                        ],
                      ),
                      SpaceH8(),
                      CustomTextTitle(title: StringConst.CONTRACT_TYPE.toUpperCase()),
                      CustomTextBody(text: resource.contractType != null && resource.contractType != ''  ? '${resource.contractType}' : 'Sin especificar' ),
                      SpaceH8(),
                      CustomTextTitle(title: StringConst.DURATION.toUpperCase()),
                      CustomTextBody(text: resource.duration),
                      SpaceH8(),
                      CustomTextTitle(title: StringConst.SALARY.toUpperCase()),
                      CustomTextBody(text: resource.salary != null && resource.salary != ''  ? '${resource.salary}' :  'Sin especificar'),
                      SpaceH8(),
                      CustomTextTitle(title: StringConst.SCHEDULE.toUpperCase()),
                      CustomTextBody(text: resource.temporality != null && resource.temporality != ''  ? '${resource.temporality}' :  'Sin especificar'),
                      SpaceH8(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _buildDetailsListViewMobile(BuildContext context, Resource resource) {
  double fontSize = responsiveSize(context, 13, 14, md: 14);
  TextTheme textTheme = Theme.of(context).textTheme;
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, right: 30.0, left: 10),
          child: Text(
            resource.description,
            textAlign: TextAlign.left,
            style: textTheme.bodyText1?.copyWith(
              color: AppColors.greyTxtAlt,
              height: 1.5,
              fontWeight: FontWeight.w400,
              fontSize: fontSize,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.greyDarkTxt, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextTitle(title: StringConst.RESOURCE_TYPE.toUpperCase()),
              CustomTextBody(text: '${resource.resourceTypeName}'),
              SpaceH16(),
              CustomTextTitle(title: StringConst.LOCATION.toUpperCase()),
              Row(
                children: [
                  CustomTextBody(text: '${resource.cityName}'),
                  CustomTextBody(text: ', '),
                  CustomTextBody(text: '${resource.provinceName}'),
                  CustomTextBody(text: ', '),
                  CustomTextBody(text: '${resource.countryName}'),
                ],
              ),
              SpaceH16(),
              CustomTextTitle(title: StringConst.MODALITY.toUpperCase()),
              CustomTextBody(text: resource.modality),
              SpaceH16(),
              CustomTextTitle(title: StringConst.CAPACITY.toUpperCase()),
              CustomTextBody(text: '${resource.capacity}'),
              SpaceH16(),
              CustomTextTitle(title: StringConst.DATE.toUpperCase()),
              DateFormat('dd/MM/yyyy').format(resource.start) == '31/12/2050'
                  ? CustomTextBody(
                text: StringConst.ALWAYS_AVAILABLE,
              )
                  : Row(
                children: [
                  CustomTextBody(
                      text: DateFormat('dd/MM/yyyy').format(resource.start)),
                  SpaceW4(),
                  CustomTextBody(text: '-'),
                  SpaceW4(),
                  CustomTextBody(
                      text: DateFormat('dd/MM/yyyy').format(resource.end))
                ],
              ),
              SpaceH16(),
              CustomTextTitle(title: StringConst.CONTRACT_TYPE.toUpperCase()),
              CustomTextBody(text: resource.contractType != null && resource.contractType != ''  ? '${resource.contractType}' : 'Sin especificar' ),
              SpaceH16(),
              CustomTextTitle(title: StringConst.DURATION.toUpperCase()),
              CustomTextBody(text: resource.duration),
              SpaceH16(),
              CustomTextTitle(title: StringConst.SALARY.toUpperCase()),
              CustomTextBody(text: resource.salary != null && resource.salary != ''  ? '${resource.salary}' :  'Sin especificar'),
              SpaceH16(),
              CustomTextTitle(title: StringConst.SCHEDULE.toUpperCase()),
              CustomTextBody(text: resource.temporality != null && resource.temporality != ''  ? '${resource.temporality}' :  'Sin especificar'),
              SpaceH16(),
            ],
          ),
        ),
        SpaceH20(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DialogMainButton(
              title: StringConst.JOIN_RESOURCE,
              onPressed: () => showAlertUserAnonimous(context),
            ),
          ],
        ),
        SpaceH20(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildShareButton(context, resource, AppColors.darkBlue),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.heart),
              tooltip: 'Me gusta',
              color: AppColors.darkBlue,
              iconSize: 24,
              onPressed: () => showAlertUserAnonimous(context),
            ),
          ],
        ),
      ],
    ),
  );
}

Future<void> shareResource(Resource resource) async {
  await Share.share(
    StringConst.SHARE_TEXT(resource.title, resource.resourceId),
    subject: StringConst.APP_NAME,
  );
}

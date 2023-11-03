import 'package:enreda_app/presentation/widgets/circular_container.dart';
import 'package:enreda_app/utils/functions.dart';
import 'package:flutter/material.dart';

import '../../../values/values.dart';
import '../../layout/adaptive.dart';

Future showLoginMenu(BuildContext context, {
  required RelativeRect relativePosition,
}) {
  return showMenu(
    context: context,
    position: relativePosition,
    items: <PopupMenuEntry>[
      PopupMenuItem(
        value: 'usuario_joven',
        child: CircularContainer(
          backgroundColor: AppColors.lightestViolet,
          borderRadius: BorderRadius.circular(10.0),
          padding: EdgeInsets.all(0.0),
          child: Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                child: Image.asset(
                  ImagePath.USER_YOUNG_ICON,
                  height: Sizes.HEIGHT_30,
                ),
              ),
              Text(StringConst.USER_YOUNG),
            ],
          ),
        ),
      ),
      /*PopupMenuItem(
          value: 'entidad_social',
          child: CircularContainer(
            backgroundColor: AppColors.grey100,
            borderRadius: BorderRadius.circular(10.0),
            padding: EdgeInsets.all(0.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                  child: Image.asset(
                    ImagePath.USER_ENTITY_ICON,
                    height: Sizes.HEIGHT_30,
                  ),
                ),
                Text(StringConst.SOCIAL_ENTITY),
              ],
            ),
          ),
        ),*/
      PopupMenuItem(
        value: 'empresa',
        child: CircularContainer(
          backgroundColor: AppColors.turquoiseUltraLight,
          borderRadius: BorderRadius.circular(10.0),
          padding: EdgeInsets.all(0.0),
          child: Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                child: Image.asset(
                  ImagePath.USER_COMPANY_ICON,
                  height: Sizes.HEIGHT_30,
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Text(StringConst.COMPANY),
            ],
          ),
        ),
      ),
    ],
  ).then((value) {
    if (value != null) {
      switch (value) {
        case 'usuario_joven':
          openUrlLink(StringConst.WEB_APP_URL);
          break;
        case 'entidad_social':
          break;
        case 'empresa':
          openUrlLink(StringConst.ADMIN_WEB_URL);
          break;
      }
    }
  });
}

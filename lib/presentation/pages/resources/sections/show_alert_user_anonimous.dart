
import 'package:auto_route/auto_route.dart';
import 'package:enreda_app/presentation/routes/router.gr.dart';
import 'package:enreda_app/values/values.dart';
import 'package:flutter/material.dart';

import '../../../../utils/functions.dart';
import '../../../widgets/dialogs/show_alert_dialog.dart';

void showAlertUserAnonimous(BuildContext context) async {
  final didRequestSignOut = await showAlertDialog(context,
      title: StringConst.NOT_ALLOWED,
      content: StringConst.ONLY_USERS_ALERT,
      cancelActionText: StringConst.CANCEL,
      defaultActionText: StringConst.ENTER);
  if (didRequestSignOut != null && didRequestSignOut) {
    openUrlLink(StringConst.WEB_APP_URL);
  }
}

void showAlertUserAnonimousChat(BuildContext context) async {
  final didRequestSignOut = await showAlertDialog(context,
      title: StringConst.NOT_ALLOWED_CHAT,
      content: StringConst.ONLY_USERS_ALERT_CHAT,
      cancelActionText: StringConst.CANCEL,
      defaultActionText: StringConst.ENTER);
  if (didRequestSignOut != null && didRequestSignOut) {
    openUrlLink(StringConst.WEB_APP_URL);
  }
}
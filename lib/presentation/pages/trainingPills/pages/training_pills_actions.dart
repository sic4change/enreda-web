import 'package:enreda_app/models/trainingPill.dart';
import 'package:enreda_app/values/values.dart';
import 'package:share_plus/share_plus.dart';


Future<void> shareTrainingPill(TrainingPill trainingPill) async {
  await Share.share(
    StringConst.SHARE_TEXT_PILLS(trainingPill.title, trainingPill.id),
    subject: StringConst.APP_NAME,
  );
}

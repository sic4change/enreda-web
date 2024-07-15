library globals;

import 'package:enreda_app/models/competency.dart';
import 'package:enreda_app/models/interest.dart';
import 'package:enreda_app/models/resource.dart';
import 'package:enreda_app/models/socialEntity.dart';
import 'package:enreda_app/models/userEnreda.dart';



Resource? currentResource;
SocialEntity? organizerCurrentResource;
String? interestsNamesCurrentResource;
String? competenciesNamesCurrentResource;
Set<Interest> selectedInterestsCurrentResource = {};
Set<Competency> selectedCompetenciesCurrentResource = {};
List<String> interestsCurrentResource = [];
UserEnreda? currentParticipant;
UserEnreda? currentSocialEntityUser;
SocialEntity? currentSocialEntity;
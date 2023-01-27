import 'package:auto_route/annotations.dart';
import 'package:enreda_app/presentation/pages/access/access_page.dart';
import 'package:enreda_app/presentation/pages/resources/resources_page.dart';

import '../pages/home/home_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    // initial route is named "/"
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(
      page: AccessPage,
    ),
    AutoRoute(page: ResourcesPage),
  ],
)
class $AppRouter {}

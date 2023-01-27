
import 'package:enreda_app/presentation/routes/router.gr.dart';
import 'package:enreda_app/services/database.dart';
import 'package:enreda_app/utils/my_scroll_behaviour.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:enreda_app/values/values.dart';
import 'package:provider/provider.dart';

import 'app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Enreda());
}

class Enreda extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Provider<Database>(
      create: (context) => FirestoreDatabase(),
      child: Layout(
        child: MaterialApp.router(
          title: StringConst.APP_NAME,
          theme: AppTheme.lightThemeData,
          debugShowCheckedModeBanner: false,
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          scrollBehavior: MyCustomScrollBehavior(),
        ),
      ),
    );
  }
}
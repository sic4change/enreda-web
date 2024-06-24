
import 'package:enreda_app/firebase_options.dart';
import 'package:enreda_app/localization/LocaleProvider.dart';
import 'package:enreda_app/presentation/routes/router.gr.dart';
import 'package:enreda_app/services/database.dart';
import 'package:enreda_app/utils/my_scroll_behaviour.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:layout/layout.dart';
import 'package:enreda_app/values/values.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import 'app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(
      ChangeNotifierProvider(
        create: (context) => LocaleProvider(),
        child: Enreda(),
      )
  );
}

class Enreda extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Database>(create: (context) => FirestoreDatabase()),
        ChangeNotifierProvider(create: (context) => LocaleProvider()),
      ],
      child: Consumer<LocaleProvider>(
        builder: (context, localeProvider, child){
          return MaterialApp.router(
            title: StringConst.APP_NAME,
            theme: AppTheme.lightThemeData,
            debugShowCheckedModeBanner: false,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            scrollBehavior: MyCustomScrollBehavior(),
            locale: localeProvider.locale,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en'),
              Locale('es'),
            ],
          );
        }

      ),
    );
  }
}
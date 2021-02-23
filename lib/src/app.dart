import 'package:flutter/material.dart';
import 'package:my_flutter_app/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_flutter_app/src/test.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: Colors.black,
        title: "My flutter app",
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          AppLocalizationDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'GB'),
          const Locale('uk', 'UA'),
        ],
        theme: Theme.of(context).copyWith(
            appBarTheme: AppBarTheme(color: Colors.black),
            backgroundColor: Colors.black,
            scaffoldBackgroundColor: Colors.black),
        home: Testovi(),

        // builder: ExtendedNavigator.builder<BFIRouter>(
        //   router: BFIRouter(),
        //   initialRoute: _getInitialRoute(),
        //   builder: (context, extendedNav) => BFIScreenInfo(
        //     child: OrientationLock(
        //       child: BFITheme(child: extendedNav),
        //     ),
        //   ),
        // ),
        // builder: (context, nativeNavigator) => BFIScreenInfo(
        //   child: OrientationLock(
        //     child: BFITheme(
        //       child: ExtendedNavigator<Router>(
        //           router: Router(), initialRoute: _getInitialRoute()),
        //     ),
        //   ),
        // ),
    );
  }
}

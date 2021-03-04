import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter_app/g.dart';
import 'package:my_flutter_app/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_flutter_app/src/test.dart';

abstract class App extends Widget {
  factory App() {
    if (gWeb) return _WebApp();
    if (gIOS) return _IOSApp();
    return _AndroidApp();
  }
}

class _AndroidApp extends StatelessWidget implements App {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: Colors.black,
        title: "My Android flutter app",
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
        home: AndroidTestovi(),

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

class _IOSApp extends StatelessWidget implements App {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return CupertinoApp(
        color: Colors.black,
        title: "My IOS flutter app",
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
        // theme: Theme.of(context).copyWith(
        //     appBarTheme: AppBarTheme(color: Colors.black),
        //     backgroundColor: Colors.black,
        //     scaffoldBackgroundColor: Colors.black),
        home: IOSTestovi(),

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

class _WebApp extends StatelessWidget implements App {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: Colors.black,
        title: "My Web flutter app",
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
        home: WebTestovi(),

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

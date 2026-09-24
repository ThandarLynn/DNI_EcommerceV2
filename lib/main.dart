import 'dart:io';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dni_ecommerce_v2/config/app_colors.dart';
import 'dart:async';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'package:dni_ecommerce_v2/constant/router.dart' as router;
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
// import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:dni_ecommerce_v2/provider/common/app_provider_dependencies.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
// void main() {
//   runApp(const MyApp());
// }

Future<void> main() async {
  // add this, and it should be the first line in main method
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  if (prefs.getString('codeC') == null) {
    await prefs.setString('codeC', ''); //null);
    await prefs.setString('codeL', ''); //null);
  }

  FirebaseApp app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  // await Firebase.initializeApp().whenComplete(() {
  //   print("Firebase initialization attempt finished.");
  // });
  // // NativeAdmob(adUnitID: Utils.getAdAppId());//lynn

  if (Platform.isIOS) {
    FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  //check is apple signin is available
  // await Utils.checkAppleSignInAvailable();

  runApp(PSApp());
}

class PSApp extends StatefulWidget {
  @override
  _PSAppState createState() => _PSAppState();
}

// Future<dynamic> initAds() async {
//   if (AppConfig.showAdMob && await Utils.checkInternetConnectivity()) {
//     // FirebaseAdMob.instance.initialize(appId: Utils.getAdAppId());
//   }
// }

class _PSAppState extends State<PSApp> {
  Completer<ThemeData>? themeDataCompleter;
  // late AppSharedPreferencess psSharedPreferences;

  @override
  void initState() {
    super.initState();
  }

  // Future<ThemeData> getSharePerference(
  //     EasyLocalization provider, dynamic data) {
  //   print('>> get share perference');
  //   if (themeDataCompleter == null) {
  //     print('init completer');
  //     themeDataCompleter = Completer<ThemeData>();
  //   }

  //   // if (psSharedPreferences == null) {
  //   //   print('init ps shareperferences');
  //   //   psSharedPreferences = AppSharedPreferencess.instance;
  //   //   print('get shared');
  //   //   psSharedPreferences.futureShared.then((SharedPreferences sh) {
  //   //     psSharedPreferences.shared = sh;

  //   //     print('init theme provider');
  //   //     final PsThemeProvider psThemeProvider = PsThemeProvider(
  //   //         repo: PsThemeRepository(psSharedPreferences: psSharedPreferences));

  //   //     print('get theme');
  //   //     final ThemeData themeData = psThemeProvider.getTheme();
  //   //     themeDataCompleter.complete(themeData);
  //   //     print('themedata loading completed');
  //   //   });
  //   // }

  //   return themeDataCompleter.future;
  // }

  // List<Locale> getSupportedLanguages() {
  //   final List<Locale> localeList = <Locale>[];
  //   for (final Language lang in AppConfig.appSupportedLanguageList) {
  //     localeList.add(Locale(lang.languageCode!, lang.countryCode));
  //   }
  //   print('Loaded Languages');
  //   return localeList;
  // }

  @override
  Widget build(BuildContext context) {
    // init Color
    AppColors.loadColor(context);
    // print(EasyLocalization.of(context).locale.languageCode);
    // final ThemeCollection themeCollection = ThemeCollection();
    return MultiProvider(
        providers: <SingleChildWidget>[...providers],
        child:
            // DynamicTheme(
            //   // defaultBrightness: Brightness.light,
            //   // data: (Brightness brightness) {
            //   //   if (brightness == Brightness.light) {
            //   //     return themeData(ThemeData.light());
            //   //   } else {
            //   //     return themeData(ThemeData.dark());
            //   //   }
            //   // },
            //   themeCollection: themeCollection,
            //   // defaultThemeId: AppThemes.LightBlue,
            //   builder: (BuildContext context, ThemeData theme) {
            //     return
            MaterialApp(
          color: Colors.green,
          debugShowCheckedModeBanner: false,
          title: 'Panacea-Soft',
          // theme: theme,
          initialRoute: '/',
          onGenerateRoute: router.generateRoute,
          localizationsDelegates: <LocalizationsDelegate<dynamic>>[
            // GlobalMaterialLocalizations.delegate,
            // GlobalWidgetsLocalizations.delegate,
            // GlobalCupertinoLocalizations.delegate,
            // EasyLocalization.of(context).delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          // supportedLocales: EasyLocalization.of(context).supportedLocales,
          // locale: EasyLocalization.of(context).locale,
        )
        //   },
        // ),
        );
  }
}

// class MyApp extends StatelessWidget {
//   // const MyApp({super.key});
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   // const MyHomePage({super.key, required this.title});
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('You have pushed the button this many times:'),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

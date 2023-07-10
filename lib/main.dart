import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:test_flutter/core/general_export.dart';
import 'package:test_flutter/core/routes/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'generated/codegen_loader.g.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final SharedFunction sharedFunction = SharedFunction();
final appRouter = AppRouter();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    if (ConnectivityResult.none == result) {
      showToast(msg: "No Internet", isError: true);
    } else {
      // showToast(msg: 'result.name', isError: false);
    }
  });

  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale(LangConst.localen, LangConst.localeEN),
        Locale(LangConst.localear, LangConst.localeAR),
      ],
      saveLocale: true,
      path: 'assets/lang',
      fallbackLocale: Locale(LangConst.localen, LangConst.localeEN),
      assetLoader: const CodegenLoader(),
      startLocale: Locale(LangConst.localen, LangConst.localeEN),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final savedThemeMode;
  const MyApp({Key? key, this.savedThemeMode}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          routerConfig: appRouter.config(),
        );
      },
    );
  }
}

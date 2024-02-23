import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:oktoast/oktoast.dart';
import 'package:todo/app/bindings/initial_binding.dart';
import 'package:todo/app/data/data/app_theme.dart';
import 'package:todo/app/modules/dashboard/dash_board.dart';
import 'package:todo/firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(defaultOverlay);
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // FlutterNativeSplash.preserve(
  //   widgetsBinding: widgetBinding,
  // );
  // await Future.delayed(const Duration(seconds: 1));
  // FlutterNativeSplash.remove();

  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({super.key});
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(390, 844),
        builder: (context, child) {
          return OKToast(
            duration: const Duration(milliseconds: 2500),
            animationCurve: Curves.easeIn,
            animationDuration: const Duration(milliseconds: 600),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: GetMaterialApp(
                initialBinding: InitialBinding(),
                debugShowCheckedModeBanner: false,
                title: "TODO",
                darkTheme: AppTheme.darkTheme,
                themeMode: ThemeMode.dark,
                locale: const Locale('en_US'),
                navigatorKey: navigatorKey,
                home: const Dashboard(),
              ),
            ),
          );
        });
  }
}

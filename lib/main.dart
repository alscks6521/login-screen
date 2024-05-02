import 'package:daelim_univ/provider/auth_controller.dart';
import 'package:daelim_univ/router/app_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      title: 'Flutter Login',
      // 화면 밝기에 따른
      themeMode: debugBrightnessOverride == Brightness.dark //
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
      ),
      // darkTheme: ThemeData.light().copyWith(),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
        ),
        //화면에 보이는 위젯들의 밀도
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}




// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Brightness brightness = SchedulerBinding.instance.window.platformBrightness;

//     return MaterialApp.router(
//       routerConfig: router,
//       title: 'Flutter Login',
//       themeMode: brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light,
//       theme: ThemeData.light().copyWith(colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)),
//       darkTheme: ThemeData.dark().copyWith(colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)),
//     );
//   }
// }

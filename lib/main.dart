import 'package:daelim_univ/common/helpers/storage_helper.dart';
import 'package:daelim_univ/provider/auth_controller.dart';
import 'package:daelim_univ/router/app_router.dart';
import 'package:daelim_univ/theme/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  Get.put(AuthController());
  await StorageHelper.init();
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
      themeMode: StorageHelper.themeMode,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
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

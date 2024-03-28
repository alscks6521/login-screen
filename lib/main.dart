import 'package:daelim_univ/router/app_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Login',
      // 화면 밝기에 따른
      themeMode: debugBrightnessOverride == Brightness.dark ? ThemeMode.dark : ThemeMode.light,
      // useMaterial3 테마
      // theme: ThemeData(
      //   useMaterial3: true,
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      // ),
      theme: ThemeData.light().copyWith(colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)),
      // darkTheme: ThemeData.light().copyWith(),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
        ),
        //화면에 보이는 위젯들의 밀도
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      // home: const LoginScreen(),
    );
  }
}

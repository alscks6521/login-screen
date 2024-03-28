import 'package:daelim_univ/screens/login/login_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      // themeMode: ThemeMode.light,
      themeMode: debugBrightnessOverride == Brightness.dark ? ThemeMode.dark : ThemeMode.light,
      // useMaterial3 테마
      // theme: ThemeData(
      //   useMaterial3: true,
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      // ),
      theme: ThemeData.light().copyWith(colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)),
      // darkTheme: ThemeData.light().copyWith(),
      darkTheme:
          ThemeData.dark().copyWith(colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)),
      home: const LoginScreen(),
    );
  }
}

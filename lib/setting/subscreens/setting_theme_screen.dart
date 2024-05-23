import 'package:daelim_univ/common/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class SettingThemeScreen extends StatelessWidget {
  const SettingThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBar: AppBar(
          title: const Text('테마 설정'),
        ),
        drawerEnableOpenDragGesture: false,
        child: const Column(
          children: [],
        ));
  }
}

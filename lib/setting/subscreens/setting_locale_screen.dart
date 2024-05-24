import 'package:daelim_univ/common/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class SettingLocaleScreen extends StatelessWidget {
  const SettingLocaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text('테마 설정'),
      ),
      drawerEnableOpenDragGesture: false,
      child: const Placeholder(),
    );
  }
}

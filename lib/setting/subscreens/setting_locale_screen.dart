import 'package:daelim_univ/common/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class SettingLocaleScreen extends StatelessWidget {
  const SettingLocaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        title: const Text('언어변경'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Card(
              child: Column(
                children: ListTile.divideTiles(
                  context: context,
                  tiles: [
                    ListTile(
                      title: const Text('한국어'),
                      trailing:
                          SizedBox(height: 30, child: Checkbox(value: true, onChanged: (value) {})),
                    ),
                    ListTile(
                      title: const Text('English'),
                      trailing: SizedBox(
                          height: 30, child: Checkbox(value: false, onChanged: (value) {})),
                    ),
                  ],
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

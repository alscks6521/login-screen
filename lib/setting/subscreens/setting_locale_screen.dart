import 'package:daelim_univ/common/helpers/locale_helper.dart';
import 'package:daelim_univ/common/helpers/storage_helper.dart';
import 'package:daelim_univ/common/widgets/app_scaffold.dart';
import 'package:daelim_univ/localization/app_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingLocaleScreen extends StatelessWidget {
  const SettingLocaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        title: Text(AppString.appSetting.tr),
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
                      trailing: SizedBox(
                        height: 30,
                        child: Checkbox(
                          value: StorageHelper.locale == LocaleHelper.korean,
                          onChanged: (value) {
                            value ??= false;
                            if (value) {
                              StorageHelper.setLocale(LocaleHelper.korean);
                            }
                          },
                        ),
                      ),
                    ),
                    ListTile(
                      title: const Text('English'),
                      trailing: SizedBox(
                        height: 30,
                        child: Checkbox(
                          value: StorageHelper.locale == LocaleHelper.english,
                          onChanged: (value) {
                            value ??= false;
                            if (value) {
                              StorageHelper.setLocale(LocaleHelper.english);
                            }
                          },
                        ),
                      ),
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

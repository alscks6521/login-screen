import 'package:daelim_univ/common/helpers/storage_helper.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  // RxBool 인스턴스 멤버로 변경
  RxBool rxIsDarkMode = StorageHelper.isDarkMode.obs;

  // 테마 모드를 변경하는 메서드
  void changeThemeMode(bool isDarkMode) {
    rxIsDarkMode.value = isDarkMode;
    // Get.changeThemeMode(rxIsDarkMode.value ? ThemeMode.dark : ThemeMode.light);

    StorageHelper.setDarkMode(isDarkMode);
  }
}

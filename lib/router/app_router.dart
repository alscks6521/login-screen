import 'package:daelim_univ/main/main_screen.dart';
import 'package:daelim_univ/provider/auth_controller.dart';
import 'package:daelim_univ/screens/gallery/gallery_detail_screen.dart';
import 'package:daelim_univ/screens/gallery/gallery_screen.dart';
import 'package:daelim_univ/screens/lifecycle_screens/lifecycle_scrren.dart';
import 'package:daelim_univ/screens/login/login_screen.dart';
import 'package:daelim_univ/setting/setting_screen.dart';
import 'package:daelim_univ/setting/subscreens/setting_locale_screen.dart';
import 'package:daelim_univ/signup/sign_up_screen.dart';
import 'package:easy_extension/easy_extension.dart';
import 'package:get/instance_manager.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: AppScreen.login,
  redirect: (context, state) {
    final controller = Get.find<AuthController>();

    if (controller.getUserData != null) {
      return null;
    } else {
      return AppScreen.login;
    }
  },
  routes: [
    GoRoute(
      path: AppScreen.login,
      builder: ((context, state) => const LoginScreen()),
    ),
    GoRoute(
      path: AppScreen.signup,
      builder: ((context, state) => const SignUpScreen()),
    ),
    GoRoute(
      path: AppScreen.main,
      builder: ((context, state) => const MainScreen()),
    ),
    GoRoute(
      path: AppScreen.lifecycle,
      builder: ((context, state) => const LifecycleScreen()),
    ),

    /// 갤러리
    GoRoute(
      path: AppScreen.gallery,
      builder: ((context, state) => const GalleryScreen()),
      // 갤러리 서브 화면
      routes: [
        GoRoute(
          name: AppScreen.gallerydetail,
          path: '${AppScreen.gallerydetail}/id=:id',
          builder: ((context, state) {
            final id = state.pathParameters['id'] ?? '-1';
            return GalleryDetailScreen(
              id: id.toInt(),
            );
          }),
        ),
      ],
    ),
    // 설정
    GoRoute(
      path: AppScreen.setting,
      builder: ((context, state) => const SettingScreen()),
      routes: [
        GoRoute(
          path: AppScreen.settingLocale,
          name: AppScreen.settingLocale,
          builder: (context, state) => const SettingLocaleScreen(),
        ),
      ],
    ),
  ],
);

class AppScreen {
  static String login = '/login';
  static String signup = '/signup';
  static String main = '/main';
  static String lifecycle = '/lifecycle';
  // Gallery...
  static String gallery = '/gallery';
  static String gallerydetail = 'detail';
  // Setting...
  static String setting = '/setting';
  static String settingLocale = 'locale';
}

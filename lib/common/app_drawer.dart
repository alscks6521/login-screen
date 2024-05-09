import 'package:daelim_univ/provider/auth_controller.dart';
import 'package:daelim_univ/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  Widget _ListTile(
    BuildContext context, {
    required String path,
    required IconData icon,
    required String title,
  }) {
    return ListTile(
      onTap: () => router.push(path),
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_right),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    final userData = controller.getUserData;

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: ListTile(
              title: Text(
                userData != null ? '${userData.name} (${userData.studentNumber})' : '로그인 상태가 아닙니다.',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                userData != null ? userData.email : '',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _ListTile(
                  context,
                  path: AppScreen.main,
                  icon: Icons.home,
                  title: "Home",
                ),
                _ListTile(
                  context,
                  path: AppScreen.lifecycle,
                  icon: Icons.cyclone,
                  title: "Lifecycle",
                ),
                _ListTile(
                  context,
                  path: AppScreen.gallery,
                  icon: Icons.browse_gallery,
                  title: "Gallery",
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

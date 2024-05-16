import 'package:daelim_univ/provider/auth_controller.dart';
import 'package:daelim_univ/router/app_router.dart';
import 'package:easy_extension/easy_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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

  List<Map<String, dynamic>> get _titlesData => [
        {
          'path': AppScreen.main,
          'icon': Icons.home,
          'title': "홈",
        },
        {
          'path': AppScreen.lifecycle,
          'icon': Icons.cyclone,
          'title': "라이프사이클",
        },
        {
          'path': AppScreen.gallery,
          'icon': Icons.image,
          'title': "갤러리",
        },
      ];

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
                userData != null ? '${userData.name} (${userData.stdNumber})' : '로그인 상태가 아닙니다.',
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
              children: _titlesData.mapIndexed(
                (i, e) {
                  return _ListTile(
                    context,
                    path: e['path'],
                    icon: e['icon'],
                    title: e['title'],
                  ).animate().slideX(delay: (i * 100).toMillisecond);
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

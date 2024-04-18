import 'package:daelim_univ/router/app_router.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  Widget _ListTile(BuildContext context,
      {required String path, required IconData icon, required String title}) {
    return ListTile(
      onTap: () => router.push(path),
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_right),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          _ListTile(context, path: AppScreen.main, icon: Icons.home, title: "Home"),
          _ListTile(context, path: AppScreen.gallery, icon: Icons.browse_gallery, title: "Gallery")
        ],
      ),
    );
  }
}

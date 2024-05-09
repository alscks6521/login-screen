import 'package:daelim_univ/common/app_drawer.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final FloatingActionButton? floatActionButton;
  final PreferredSizeWidget? appBar;

  final bool drawerEnableOpenDragGesture;
  final Widget child;

  const AppScaffold({
    super.key,
    this.floatActionButton,
    this.appBar,
    required this.drawerEnableOpenDragGesture,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
      appBar: appBar,
      drawer: drawerEnableOpenDragGesture ? const AppDrawer() : null,
      floatingActionButton: floatActionButton,
      body: SafeArea(
        child: child,
      ),
    );
  }
}

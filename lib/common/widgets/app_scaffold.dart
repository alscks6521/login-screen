import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final FloatingActionButton? floatActionButton;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget child;

  const AppScaffold({
    super.key,
    this.floatActionButton,
    this.appBar,
    this.drawer, //햄버거
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      endDrawer: const Drawer(),
      body: SafeArea(
        child: child,
      ),
    );
  }
}

import 'package:daelim_univ/common/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBar: AppBar(
          title: const Text(
            '메인',
            style: TextStyle(color: Colors.blue, fontSize: 25),
          ),
        ),
        drawer: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.green,
        ),
        child: const Placeholder());
  }
}

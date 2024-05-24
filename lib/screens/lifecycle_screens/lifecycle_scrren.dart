import 'package:daelim_univ/common/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LifecycleScreen extends StatefulWidget {
  const LifecycleScreen({super.key});

  @override
  State<LifecycleScreen> createState() => _LifecycleScreenState();
}

class _LifecycleScreenState extends State<LifecycleScreen> {
  late final AppLifecycleListener _listener;
  late AppLifecycleState? _state;

  @override
  void initState() {
    super.initState();
    _state = SchedulerBinding.instance.lifecycleState;
    _listener = AppLifecycleListener(
      onShow: () => debugPrint('show'),
      onResume: () => debugPrint('resume'),
      onHide: () => debugPrint('hide'),
      onInactive: () => debugPrint('inactive'),
      onPause: () => debugPrint('pause'),
      onDetach: () => debugPrint('detach'),
      onRestart: () => debugPrint('restart'),
      // onStateChange: _handleStateChange,
    );
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        title: const Text('LIFECYCLE'),
      ),
      child: const Center(
        child: Text('Lifecycle'),
      ),
    );
  }
}

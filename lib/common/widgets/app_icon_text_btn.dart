import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppIconTextBtn extends StatelessWidget {
  final IconData? icon;
  final String text;
  final Function()? onPressed;

  const AppIconTextBtn({super.key, this.icon, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 30,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          const SizedBox(
            width: 10,
          ),
          Text(text),
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty<Function()?>.has('onPressed', onPressed));
  }
}

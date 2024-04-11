import 'package:flutter/material.dart';

class LoginTextFiled extends StatelessWidget {
  @override
  final GlobalKey<FormState>? formKey;
  final TextEditingController controller;
  final bool obscureText;
  final String labelText;
  final String? Function(String?)? validator;

  const LoginTextFiled({
    super.key,
    this.formKey,
    this.obscureText = false,
    required this.controller,
    required this.labelText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      // formKey는 Form 위젯의 상태에 접근하기 위한 글로벌 키
      key: formKey,
      child: TextFormField(
        // validator 함수는 사용자가 입력한 값을 인수로 받아 유효성을 검사하고, 유효하지 않은 경우 오류 메시지를 반환
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        onTapOutside: (event) {
          // 위젯에 외부를 탭하면 위젯을 비활성화 시켜줌.
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

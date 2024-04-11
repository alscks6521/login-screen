import 'dart:convert';

import 'package:daelim_univ/common/widgets/app_icon_text_btn.dart';
import 'package:daelim_univ/common/widgets/app_scaffold.dart';
import 'package:daelim_univ/screens/login/widgets/login_text_filed.dart';
import 'package:easy_extension/easy_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _emialKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _pwKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _pwConfirmKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _nameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _stnKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _pwController;
  late TextEditingController _pwConfirmController;
  late TextEditingController _nameController;
  late TextEditingController _stnController;

  /// DataClass Model 말고 간단한 레코드 방식 이용. * 람다형
  List<(GlobalKey<FormState>, TextEditingController, String)> get _buttons => [
        (_emialKey, _emailController, '이메일'),
        (_pwKey, _pwController, '패스워드'),
        (_pwConfirmKey, _pwConfirmController, '패스워드 확인'),
        (_nameKey, _nameController, '이름'),
        (_stnKey, _stnController, '학번'),
      ];

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _pwController = TextEditingController();
    _pwConfirmController = TextEditingController();
    _nameController = TextEditingController();
    _stnController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    _pwConfirmController.dispose();
    _nameController.dispose();
    _stnController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      drawerEnableOpenDragGesture: false,
      child: Column(
        children: [
          // Text Form , Expanded 위젯 : 확장시켜주는 위젯 / Flexible : Expanded와 비슷하지만 유연하게 자식을 맞춰줌
          Flexible(
            child: ListView.separated(
              itemCount: _buttons.length,
              separatorBuilder: ((context, index) => 10.heightBox),
              padding: const EdgeInsets.all(20),
              itemBuilder: (BuildContext context, int index) {
                var button = _buttons[index];
                return LoginTextFiled(
                  formKey: button.$1,
                  controller: button.$2,
                  obscureText: button.$3.contains('패스워드'),
                  labelText: button.$3,
                  validator: (value) {
                    if (value == null || value.isEmpty) return '값을 입력해주세요';

                    if (button.$3 == '이름' && value.length != 3) return '정확한 이름을 적어주세요.';

                    if (button.$3 == '패스워드 확인' && value != _pwController.text) {
                      return '패스워드가 일치하지 않습니다.';
                    }

                    return null;
                  },
                );
              },
            ),
          ),
          // 회원가입 버튼
          AppIconTextBtn(
            onPressed: () async {
              var checkEmail = _emialKey.currentState?.validate() ?? false;
              var checkPw = _pwKey.currentState?.validate() ?? false;
              var checkPwCon = _pwConfirmKey.currentState?.validate() ?? false;
              var checkName = _nameKey.currentState?.validate() ?? false;
              var checkStn = _stnKey.currentState?.validate() ?? false;

              if (!checkEmail || !checkPw || !checkPwCon || !checkName || !checkStn) return;

              final email = _emailController.text;
              final pw = _pwController.text;

              final name = _nameController.text;
              final studentNumber = _stnController.text;

              debugPrint('$email, $pw, $name, $studentNumber');

              // var response = await http.post(
              //   Uri.parse('http://175.197.109.158:60080/functions/v1/auth/signup'),
              //   body: jsonEncode(
              //     {
              //       'email': email,
              //       'password': pw,
              //       'name': name,
              //       'student_number': studentNumber,
              //     },
              //   ),
              // );

              // if (response.statusCode != 200) return;

              // var jsonString = response.body;
            },
            text: '회원가입',
          ),
        ],
      ),
    );
  }
}

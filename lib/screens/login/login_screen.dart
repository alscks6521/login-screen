import 'dart:convert';

import 'package:daelim_univ/common/app_assets.dart';
import 'package:daelim_univ/common/widgets/app_icon_text_btn.dart';
import 'package:daelim_univ/common/widgets/app_scaffold.dart';
import 'package:daelim_univ/router/app_router.dart';
import 'package:daelim_univ/screens/login/widgets/login_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController idController;
  late TextEditingController pwController;

  @override
  void initState() {
    idController = TextEditingController();
    pwController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // valueController?.dispose();
    idController.dispose();
    pwController.dispose();

    super.dispose();
  }

  Future<void> _signup() async {
    // 로그인 API
    var response = await http.post(
      Uri.parse('http://121.140.73.79:18000/functions/v1/auth/signup'),
      body: jsonEncode(
        {
          'email': idController.text,
          'password': pwController.text,
          'name': '김민성',
          'student_number': '201930405',
        },
      ),
    );

    if (response.statusCode == 200) {
      debugPrint('성공:${response.statusCode}, ${response.body}');
    } else {
      return debugPrint('에러:${response.statusCode}, ${response.body}');
    }
  }

  Widget _box(Color color) {
    return Container(
      color: color,
      width: 200,
      height: 80,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      drawerEnableOpenDragGesture: false,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 80),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 앱 로고
              Image.asset(
                AppAssets.logoFlutter,
                height: 130,
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                  child: LoginTextFiled(
                controller: idController,
                labelText: 'ID',
              )),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: LoginTextFiled(
                  controller: pwController,
                  labelText: 'PW',
                ),
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('비밀번호 찾기'),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              AppIconTextBtn(
                icon: Icons.login,
                text: '로그인',
                onPressed: () {
                  var id = idController.text;
                  var pw = pwController.text;

                  debugPrint('아이디: $id, 패스워드: $pw');

                  if (id != '201930405@daelim.ac.kr' || pw != '1234') return;

                  _signup();

                  context.go(AppScreen.main);
                  // context.push(AppScreen.main); go는 뒤로가기x
                },
              ),
              MaterialButton(
                onPressed: () {
                  // var text = value.buildTextSpan(context: context, withComposing: true);
                  var text = idController.text;
                  debugPrint('textContorller: $text');
                },
                color: Colors.yellow,
                child: const Text('Material Login'),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
  late TextEditingController _emailController;
  late TextEditingController _pwController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _pwController = TextEditingController();
  }

  @override
  void dispose() {
    // valueController?.dispose();
    _emailController.dispose();
    _pwController.dispose();

    super.dispose();
  }

  Future<void> _signup() async {
    // 로그인 API
    var response = await http.post(
      Uri.parse('http://175.197.109.158:60080/functions/v1/auth/signup'),
      body: jsonEncode(
        {
          'email': _emailController.text,
          'password': _pwController.text,
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

              LoginTextFiled(
                controller: _emailController,
                labelText: 'ID',
              ),
              const SizedBox(
                height: 20,
              ),
              LoginTextFiled(
                controller: _pwController,
                labelText: 'PW',
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
              // 로그인 버튼
              AppIconTextBtn(
                icon: Icons.login,
                text: '로그인',
                onPressed: () {
                  var id = _emailController.text;
                  var pw = _pwController.text;

                  debugPrint('아이디: $id, 패스워드: $pw');

                  if (id != '201930405@daelim.ac.kr' || pw != '1234') return;

                  _signup();

                  context.go(AppScreen.main);
                  // context.push(AppScreen.main); go는 뒤로가기x
                },
              ),
              // 회원가입 버튼
              MaterialButton(
                onPressed: () {
                  context.push(AppScreen.signup);
                },
                color: Colors.yellow,
                child: const Text('회원가입'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

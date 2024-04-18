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

  // Widget _box(Color color) {
  //   return Container(
  //     color: color,
  //     width: 200,
  //     height: 80,
  //   );
  // }

  Future<void> _login() async {
    var id = _emailController.text;
    var pw = _pwController.text;

    debugPrint('아이디: $id, 패스워드: $pw');
    /*
    curl -X POST 'https://121.140.73.79:60080/functions/v1/auth/login' \
    -H 'Content-Type: application/json' \
    -d '{
        "email": "대림대 이메일",
        "password": "비밀번호",
  }'
  */
    await http
        .post(
      Uri.parse('http://121.140.73.79:60080/functions/v1/auth/login'),
      body: jsonEncode({
        'email': id,
        'password': pw,
      }),
    )
        .then(
      (response) {
        if (response.statusCode != 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('로그인을 실패했습니다. : ${response.statusCode}'),
            ),
          );
          return;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('로그인을 성공했습니다.'),
          ),
        );
        debugPrint('성공: ${response.body}');
        context.pushReplacement(AppScreen.main);
        // context.push(AppScreen.main); go는 뒤로가기x
      },
    );

    //     .catchError(
    //   (e, StackTrace) {
    //     debugPrint('에러: $e, $StackTrace');
    //     return http.Response('$e', 410);
    //   },
    // );

    // if (id != '201930405@daelim.ac.kr' || pw != '1234') return;
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
                obscureText: true,
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
                  _login();
                },
              ),
              // 회원가입 버튼
              MaterialButton(
                onPressed: () {
                  context.go(AppScreen.signup);
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

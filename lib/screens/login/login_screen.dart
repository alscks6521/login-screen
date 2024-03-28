import 'package:daelim_univ/common/app_assets.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? valueController;

  @override
  void initState() {
    valueController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    valueController?.dispose();
    super.dispose();
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          '로그인',
          style: TextStyle(color: Colors.blue, fontSize: 30),
        ),
      ),
      endDrawer: const EndDrawerButton(),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 80),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // 앱 로고
                Image.asset(
                  AppAssets.logoFlutter,
                  height: 150,
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  child: TextField(
                    controller: valueController,
                    decoration: const InputDecoration(
                      hintText: 'ID',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'PW',
                      border: OutlineInputBorder(),
                    ),
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
                SizedBox(
                  width: 150,
                  height: 60,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(style: BorderStyle.solid)),
                      ),
                    ),
                    child: const Text('로그인'),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    // var text = value.buildTextSpan(context: context, withComposing: true);
                    var text = valueController?.text;
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
      ),
    );
  }
}

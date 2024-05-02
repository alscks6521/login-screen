## 4차 Get 로그인 상태관리 , GoRouter
- find , put,
- redirect 앱 url 보안

  
## 3차 TextEditingController, GlobalKey<FormState>, 버튼 데이터 그룹화  
- sign_up_screen.dart / login_text_filed.dart  
- DataClass Model 말고 간단한 레코드 방식 이용. 람다형식  
  **List<(GlobalKey<FormState>, TextEditingController, String)> get _buttons => [  
        (_emialKey, _emailController, '이메일'),  
        (_pwKey, _pwController, '패스워드'),  
        (_pwConfirmKey, _pwConfirmController, '패스워드 확인'),  
        (_nameKey, _nameController, '이름'),  
        (_stnKey, _stnController, '학번'),  
      ];**
- TextFiled의 validator 사용

## 2차 API 사용하기
- ListTile
- Http 패키지,
- jsonEncode
  
## 1차 Commit 
- LoginScreen 구현
- Router
- Theme
- TextEditingController
- 중복 위젯 분리 ( Widgets ( Scaffold... ) 등 )

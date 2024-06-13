## 14W
1. Drag / Drop
   1. Target

## 12W

1. 언어변경 Intl(한국어, 영어)
   1. setting_locale_screen.dart
2. 추가된 파일 (localization폴더), (helpers > locale_helper.dart)
3. Android Jetpack. compose

## 11W

1. Flutter theme 테마모드 만들기 (setting)

```dart
final RxBool rxIsDarkMode = false.obs;

 Obx(
      () => Switch.adaptive(
         value: rxIsDarkMode.value,
         onChanged: (value) {
         rxIsDarkMode.value = value;
         },
      ),
   ),
```

2. 변수를 get형식으로 obs 지정한 뒤, Obx위젯으로 스위치 설정하기

3. ListTile.divideTiles는 Iterable<Widget>을 반환한다. 따라서 이를 List로 변환하고 ListView 또는 Column 등의 children 속성에 전달해야한다. 주어진 코드에서 "..." 연산자를 사용해 해결할 수 있다.

```dart
...ListTile.divideTiles(
               ...
```

4. 추가한 플러그인 : day_night_themed_switch, flex_color_scheme, shared_preferences
5. 추가된 파일 : (Setting폴더), (helpers폴더), (provider > setting_controller.dart파일)
6. 주의사항 : 구글 정책에 따라 이제 자동로그인을 하면 안된다. 저장하더라도 사용자 이메일만 저장
7. 비밀번호는 전부 암호화!

---

## 10W

1. ID를 사용하여 Hit 아이템에서 검색 (gallery_controller.dart / provider)
   1. SearchById.
   2. List<GalleryItemHits> get galleryItemHits => rxGalleryItem.value?.hits ?? []; getter로 받아오기
2. 갤러리 detail_screen
   1. User Avatar
3. Hero 사용 (gallery_screen.dart)
4. 캐싱 : Cache. 메모리에 데이터를 넣는. 일명 : RAM / 나중에 그 넣은 메모리에 데이터를 사용
   1. precacheImage 사용
   2. 캐싱은 어떠한 버벅거림으로 인해 사용하지 않을 예정!
5. flutter animate 플러그인 사용
   1. mapIndexed 사용 (app_drawer.dart)

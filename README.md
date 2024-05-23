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

변수를 get형식으로 obs 지정한 뒤, Obx위젯으로 스위치 설정하기

2. Flutter에서 국제화(internationalization)하기: 여러 언어와 지역에서 사용할 수 있도록 지원하는 과정.  
   국제화는 텍스트, 날짜, 숫자 및 기타 형식을 사용자가 속한 문화와 언어에 맞게 조정하는 것을 포함
3. ListTile.divideTiles는 Iterable<Widget>을 반환한다. 따라서 이를 List로 변환하고 ListView 또는 Column 등의 children 속성에 전달해야한다. 주어진 코드에서 "..." 연산자를 사용해 해결할 수 있다.

```dart
...ListTile.divideTiles(
               ...
```

1. 추가한 플러그인 : day_night_themed_switch, flex_color_scheme, shared_preferences
2. 추가된 파일 : Setting폴더

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

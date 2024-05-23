## 11W

1. Flutter theme 데이터로 테마를 따로 수정해보기
2. Flutter에서 국제화(internationalization)하기: 여러 언어와 지역에서 사용할 수 있도록 지원하는 과정.  
   국제화는 텍스트, 날짜, 숫자 및 기타 형식을 사용자가 속한 문화와 언어에 맞게 조정하는 것을 포함
3. .
4. .
5. 추가된 파일 : Setting폴더

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

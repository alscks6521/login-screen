import 'dart:convert';

import 'package:daelim_univ/models/gallery_item.dart';
import 'package:daelim_univ/provider/auth_controller.dart';
import 'package:easy_extension/easy_extension.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GalleryController extends GetxController {
  final _authController = Get.find<AuthController>();

  Rxn<GalleryItem> rxGalleryItem = Rxn();

  List<GalleryItemHits> get galleryItemHits => rxGalleryItem.value?.hits ?? [];

  /// 갤러리 목록 가져오기
  void fetchGallery() async {
    // var token = _authController.userData!.accessToken;

    var response = await http.post(
      headers: {
        'Authorization': 'Bearer ${_authController.getUserData!.accessToken}',
      },
      Uri.parse(
        'http://121.140.73.79:60080/functions/v1/gallery',
      ),
      body: jsonEncode({
        'q': '새',
      }),
    ).catchError((e) {
      return http.Response('$e', 401);
    });

    var statusCode = response.statusCode;

    if (statusCode != 200) {
      Log.red('API 호출 실패, ${response.body}');
      return;
    }

    var body = jsonDecode(utf8.decode(response.bodyBytes));

    rxGalleryItem.value = GalleryItem.fromMap(body);
  }

  /// ID를 사용하여 Hit 아이템에서 검색
  ///
  /// [id] : 검색할 ID
  searchById(int id) {
    return galleryItemHits.firstWhere((e) => e.id == id);
  }
}

import 'dart:convert';
import 'package:daelim_univ/models/gallery_item.dart';
import 'package:daelim_univ/provider/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GalleryController extends GetxController {
  final _authController = Get.find<AuthController>();

  // Rxn 사용하기
  final Rxn<GalleryItem> rxGgalleryItem = Rxn();

  void fetchGallery() async {
    // var token = _authController.getUserData!.accessToken;

    final response = await http
        .post(Uri.parse('http://121.140.73.79:60080/functions/v1/gallery'),
            headers: {
              'authorization': 'Bearer ${_authController.getUserData!.accessToken}',
            },
            body: jsonEncode(
              {
                'q': '새',
                'per_page': 20,
              },
            ))
        .catchError((e) {
      return http.Response('$e', 401);
    });
    var body = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode != 200) {
      debugPrint('불러오기 에러: $body');
      return;
    }
    // Rxn 변수를 넣으려면 뒤에 .value를 해야됨.
    rxGgalleryItem.value = GalleryItem.fromMap(body);
  }
}

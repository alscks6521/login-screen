import 'dart:convert';
import 'package:daelim_univ/common/widgets/app_scaffold.dart';
import 'package:daelim_univ/models/gallery_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  GalleryItem? _galleryItem;
  bool _isLoading = false;

  void showLoading() {
    setState(() {
      _galleryItem = null;
      _isLoading = true;
    });
  }

  void hideLoading() {
    _isLoading = false;
  }

  Future<void> _fetchData() async {
    showLoading();

    final response = await http
        .post(
      Uri.parse('http://121.140.73.79:60080/functions/v1/gallery'),
      body: jsonEncode({
        'q': '새',
        'per_page': 4,
      }),
    )
        .catchError((e) {
      return http.Response('$e', 401);
    });
    // 받아내서 바로 사용하는 법{
    // await http
    //     .get(
    //                 //https는 SSL인증서 문제, hhtps는 443이라는 규칙?있음
    //       Uri.parse('https://121.140.73.79:18443/functions/v1/hello'),
    //     )
    //     .then((value) => {});}
    var body = jsonDecode(utf8.decode(response.bodyBytes));

    hideLoading();

    if (response.statusCode != 200) {
      debugPrint('불러오기 에러: $body');
      return;
    }
    // debugPrint('galleryItem: $body');
    setState(() {
      _galleryItem = GalleryItem.fromMap(body);
    });

    debugPrint('galleryItem: ${_galleryItem!.hits.length}');

    // //-------
    // var jsonString = response.body;

    // // API값 정렬해서 확인과정
    // var unescapedJsonString = jsonString.replaceAll('\\', '');
    // var jsonData = json.decode(unescapedJsonString);
    // var prettyJsonString = const JsonEncoder.withIndent('  ').convert(jsonData);

    // debugPrint('응답 데이터: $prettyJsonString');

    // debugPrint('Total: ${jsonData['total']}');
    // debugPrint('Total Hits: ${jsonData['totalHits']}');
    // debugPrint('First Hit ID: ${jsonData['hits'][0]['id']}');
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        title: const Text("갤러리"),
      ),
      floatActionButton: FloatingActionButton(
        onPressed: () {
          // API 호출
          _fetchData();
        },
        child: const Icon(Icons.refresh),
      ),
      child: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemCount: _galleryItem?.hits.length ?? 0,
              itemBuilder: (context, index) {
                var item = _galleryItem?.hits[index];
                return Image.network(
                  item?.webformatURL ?? '',
                  fit: BoxFit.fill,
                );
              },
            ),
    );
  }
}

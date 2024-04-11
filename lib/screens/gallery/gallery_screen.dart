import 'dart:convert';

import 'package:daelim_univ/common/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  Future<void> _fetchData() async {
    final response = await http.post(
      Uri.parse('http://175.197.109.158:60080/functions/v1/gallery'),
      body: jsonEncode({
        'q': '봄',
      }),
    );
    // 받아내서 바로 사용하는 법{
    // await http
    //     .get(
    //                 //https는 SSL인증서 문제, hhtps는 443이라는 규칙?있음
    //       Uri.parse('https://121.140.73.79:18443/functions/v1/hello'),
    //     )
    //     .then((value) => {});}

    if (response.statusCode == 200) {
      var jsonString = response.body;

      // API값 정렬해서 확인과정
      var unescapedJsonString = jsonString.replaceAll('\\', '');
      var jsonData = json.decode(unescapedJsonString);
      var prettyJsonString = const JsonEncoder.withIndent('  ').convert(jsonData);

      debugPrint('응답 데이터:');
      debugPrint(prettyJsonString);

      var total = jsonData['total'];
      var totalHits = jsonData['totalHits'];
      var firstHitId = jsonData['hits'][0]['id'];

      debugPrint('Total: $total');
      debugPrint('Total Hits: $totalHits');
      debugPrint('First Hit ID: $firstHitId');
    } else {
      throw Exception('Failed load data');
    }
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
      child: const Placeholder(),
    );
  }
}

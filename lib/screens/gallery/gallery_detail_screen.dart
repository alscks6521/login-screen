import 'package:daelim_univ/common/widgets/app_scaffold.dart';
import 'package:daelim_univ/models/gallery_item.dart';
import 'package:easy_extension/easy_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../provider/gallery_controller.dart';

class GalleryDetailScreen extends StatefulWidget {
  final int? id;

  const GalleryDetailScreen({
    super.key,
    this.id,
  });

  @override
  State<GalleryDetailScreen> createState() => _GalleryDetailScreenState();
}

class _GalleryDetailScreenState extends State<GalleryDetailScreen> {
  int get id => widget.id ?? -1;

  /// 적용하고 난 후에 확인 (후속스크린은 find)
  final _controller = Get.find<GalleryController>();

  late final GalleryItemHits? _item;

  @override
  void initState() {
    super.initState();
    _item = _controller.searchById(id); // 아이템 연결
    debugPrint("detail item: $_item");
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint("detail ID: ${widget.id}");

    return AppScaffold(
        drawerEnableOpenDragGesture: false,
        appBar: AppBar(
          title: Text(_item!.tags),
        ),
        child: Column(
          children: [
            /// region Image
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ///# Images
                  Positioned.fill(
                    child: Hero(
                      tag: '${_item.id}',
                      child: Image.network(
                        _item.webformatURL,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    '업로더: ${_item.user}',
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),

                  ///# User Avatar
                  Positioned(
                    left: 5,
                    top: 3,
                    child: Tooltip(
                      message: _item.user,
                      child: CircleAvatar(
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 3),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: Image.network(
                                _item.userImageURL,
                              ).image,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  ///# Image Size
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 3,
                      ),
                      child: Text(
                        '${_item.imageWidth}x${_item.imageHeight}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            ///# region Likes, User Nick
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Like: ',
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                      children: [
                        5.widthSpan,
                        TextSpan(
                          text: '${_item.likes}',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

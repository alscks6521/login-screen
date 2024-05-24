import 'package:daelim_univ/common/widgets/app_scaffold.dart';
import 'package:daelim_univ/provider/gallery_controller.dart';
import 'package:daelim_univ/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final _controller = Get.put(GalleryController());
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _controller.fetchGallery();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        title: const Text("갤러리"),
      ),
      floatActionButton: FloatingActionButton(
        onPressed: _controller.fetchGallery, // 방법2
        child: const Icon(
          Icons.refresh,
        ),
      ),
      child: Obx(() => _controller.rxGalleryItem.value == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scrollbar(
              controller: _scrollController,
              thumbVisibility: true, // 스크롤바 항상 표시
              thickness: 5,
              radius: const Radius.circular(10),
              child: GridView.builder(
                controller: _scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: _controller.rxGalleryItem.value?.hits.length ?? 0,
                itemBuilder: (context, index) {
                  var item = _controller.rxGalleryItem.value?.hits[index];

                  return GestureDetector(
                    onTap: () async {
                      if (item?.largeImageURL != null) {
                        await precacheImage(
                          Image.network(item!.largeImageURL).image,
                          context,
                        );
                      }
                      // Log.green({item?.toJson()}),
                      if (context.mounted) {
                        context.pushNamed(
                          AppScreen.gallerydetail,
                          pathParameters: {
                            'id': (item?.id ?? -1).toString(),
                          },
                        );
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Hero(
                        tag: item?.id ?? -1,
                        child: Image.network(
                          item?.webformatURL ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )),
    );
  }
}

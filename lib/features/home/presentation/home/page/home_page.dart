import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallpaper_application/common/routes/route_utils.dart';
import 'package:wallpaper_application/common/utils.dart';
import 'package:wallpaper_application/features/home/presentation/home/riverpod/provider/home_provider.dart';
import 'package:wallpaper_application/features/home/presentation/photos_search_delegate/page/photos_search_delegate_page.dart';
import 'package:wallpaper_application/features/widget/custom_cached_image.dart';
import 'package:wallpaper_application/features/widget/loading_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    Utils.handlePagination(
      controller: scrollController,
      call: () => ref.read(homeProvider.notifier).getPhotos(isPaginating: true),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(homeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: PhotosSearchDelegate());
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0.2,
      ),
      body: controller.isLoading
          ? const LoadingWidget()
          : Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                controller: scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0),
                itemCount: controller.value!.wallpapers.length,
                itemBuilder: (context, index) {
                  if (controller.value!.isPaginating &&
                      index == controller.value!.wallpapers.length) {
                    return Utils.putShimmer;
                  }
                  return GestureDetector(
                    onTap: () {
                      RouteUtils.goToPhotoDetails(
                          photoId: controller.value!.wallpapers[index].id!);
                    },
                    child: CustomCachedNetworkImage(
                      url: controller.value!.wallpapers[index].src?.original,
                      boxFit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
    );
  }
}

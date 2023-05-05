import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallpaper_application/common/utils.dart';
import 'package:wallpaper_application/features/favorite/presentation/favorite_list/riverpod/provider/favorite_list_provider.dart';
import 'package:wallpaper_application/features/widget/custom_cached_image.dart';
import 'package:wallpaper_application/features/widget/loading_widget.dart';

class FavoriteListPage extends ConsumerStatefulWidget {
  const FavoriteListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<FavoriteListPage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<FavoriteListPage> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    Utils.handlePagination(
      controller: scrollController,
      call: () =>
          ref.read(favoriteListProvider.notifier).getPhotos(isPaginating: true),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(favoriteListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorites',
          style: TextStyle(color: Colors.black),
        ),
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
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
                  return CustomCachedNetworkImage(
                    url: controller.value!.wallpapers[index].src?.original,
                    boxFit: BoxFit.cover,
                  );
                },
              ),
            ),
    );
  }
}

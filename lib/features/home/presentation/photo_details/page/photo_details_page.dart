import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallpaper_application/features/home/presentation/photo_details/riverpod/provider/photo_details_provider.dart';
import 'package:wallpaper_application/features/widget/custom_cached_image.dart';
import 'package:wallpaper_application/features/widget/loading_widget.dart';

class PhotoDetailsPage extends ConsumerWidget {
  const PhotoDetailsPage({
    Key? key,
    required this.photoId,
  }) : super(key: key);
  final int photoId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = photoDetailsProvider(photoId: photoId);
    final controller = ref.watch(provider);
    final notifier = ref.read(provider.notifier);
    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: notifier.downloadPhoto,
            child: const Icon(
              Icons.download,
            ),
          ),
          const SizedBox(height: 10.0),
          FloatingActionButton(
            heroTag: '2',
            onPressed: notifier.toggleFavorite,
            child: Icon(
              controller.value!.isInFav
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: controller.value!.isInFav ? Colors.red : Colors.white,
            ),
          ),
        ],
      ),
      body: controller.isLoading
          ? const LoadingWidget()
          : CustomCachedNetworkImage(
              url: controller.value!.photo.src?.original,
              boxFit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
    );
  }
}

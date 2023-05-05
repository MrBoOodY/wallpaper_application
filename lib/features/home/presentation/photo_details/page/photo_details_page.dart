import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallpaper_application/features/home/presentation/photo_details/riverpod/provider/photo_details_provider.dart';
import 'package:wallpaper_application/features/widget/custom_cached_image.dart';

class PhotoDetailsPage extends ConsumerWidget {
  const PhotoDetailsPage({
    Key? key,
    required this.photoId,
  }) : super(key: key);
  final int photoId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(photoDetailsProvider(photoId: photoId));
    return Scaffold(
      body: CustomCachedNetworkImage(
        url: notifier.value!.src?.original,
        boxFit: BoxFit.cover,
      ),
    );
  }
}

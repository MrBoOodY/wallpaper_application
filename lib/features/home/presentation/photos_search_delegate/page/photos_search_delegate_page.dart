import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallpaper_application/features/home/presentation/photos_search_delegate/provider/photos_search_provider.dart';
import 'package:wallpaper_application/features/widget/custom_cached_image.dart';
import 'package:wallpaper_application/features/widget/loading_widget.dart';

class PhotosSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    if (query.length > 1) {
      return [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          },
        ),
      ];
    }
    return [const SizedBox()];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const <Widget>[
          Center(
            child: Text(
              'the search term must be longer than two_letters',
              textAlign: TextAlign.center,
            ),
          )
        ],
      );
    }

    return Consumer(builder: (context, ref, child) {
      final controller = ref.watch(photosSearchProvider(searchQuery: query));
      return controller.when(
        data: (photos) {
          if (photos.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                Text(
                  'there are no result matching your search results',
                  textAlign: TextAlign.center,
                ),
              ],
            );
          }
          return Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0),
              itemCount: controller.value!.length,
              itemBuilder: (context, index) {
                return CustomCachedNetworkImage(
                  url: controller.value![index].src?.original,
                  boxFit: BoxFit.cover,
                );
              },
            ),
          );
        },
        error: (error, stackTrace) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Text(
                'something went wrong',
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
        loading: () {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              LoadingWidget(),
            ],
          );
        },
      );
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox();
  }
}

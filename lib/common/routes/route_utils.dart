import 'package:go_router/go_router.dart';
import 'package:wallpaper_application/common/routes/route_keys.dart';
import 'package:wallpaper_application/common/routes/route_strings.dart';
import 'package:wallpaper_application/common/routes/routes/routes.dart';

class RouteUtils {
  static goToPhotoDetails({required int photoId}) {
    appContext.pushNamed(RouteStrings.photoDetails, queryParams: {
      RouteKeys.photoId: photoId.toString(),
    });
  }

  static goToFavPhotos() {
    appContext.pushNamed(RouteStrings.favPhotos);
  }
}

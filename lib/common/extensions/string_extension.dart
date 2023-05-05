import 'package:wallpaper_application/common/constants/strings.dart';

extension StringExtension on String? {
  String get fullPathImage {
    return Strings.apiImagePath + (this ?? '');
  }
}

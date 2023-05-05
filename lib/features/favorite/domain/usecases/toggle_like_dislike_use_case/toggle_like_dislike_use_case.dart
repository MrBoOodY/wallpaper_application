import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_application/features/favorite/domain/repositories/favorite_repository.dart';

part 'toggle_like_dislike_use_case.g.dart';

@riverpod
Future<bool> toggleLikeDislikeUseCase(
  ToggleLikeDislikeUseCaseRef ref, {
  required int adId,
}) async {
  return await ref.read(favoriteRepositoryProvider).toggleLike(adId: adId);
}

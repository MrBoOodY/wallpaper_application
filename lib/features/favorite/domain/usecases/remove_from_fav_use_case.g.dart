// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_from_fav_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$removeFromFavUseCaseHash() =>
    r'8e3ac77a28d883b68823def126b1bb29becac5f6';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef RemoveFromFavUseCaseRef = AutoDisposeFutureProviderRef<void>;

/// See also [removeFromFavUseCase].
@ProviderFor(removeFromFavUseCase)
const removeFromFavUseCaseProvider = RemoveFromFavUseCaseFamily();

/// See also [removeFromFavUseCase].
class RemoveFromFavUseCaseFamily extends Family<AsyncValue<void>> {
  /// See also [removeFromFavUseCase].
  const RemoveFromFavUseCaseFamily();

  /// See also [removeFromFavUseCase].
  RemoveFromFavUseCaseProvider call({
    required int photoId,
  }) {
    return RemoveFromFavUseCaseProvider(
      photoId: photoId,
    );
  }

  @override
  RemoveFromFavUseCaseProvider getProviderOverride(
    covariant RemoveFromFavUseCaseProvider provider,
  ) {
    return call(
      photoId: provider.photoId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'removeFromFavUseCaseProvider';
}

/// See also [removeFromFavUseCase].
class RemoveFromFavUseCaseProvider extends AutoDisposeFutureProvider<void> {
  /// See also [removeFromFavUseCase].
  RemoveFromFavUseCaseProvider({
    required this.photoId,
  }) : super.internal(
          (ref) => removeFromFavUseCase(
            ref,
            photoId: photoId,
          ),
          from: removeFromFavUseCaseProvider,
          name: r'removeFromFavUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$removeFromFavUseCaseHash,
          dependencies: RemoveFromFavUseCaseFamily._dependencies,
          allTransitiveDependencies:
              RemoveFromFavUseCaseFamily._allTransitiveDependencies,
        );

  final int photoId;

  @override
  bool operator ==(Object other) {
    return other is RemoveFromFavUseCaseProvider && other.photoId == photoId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, photoId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

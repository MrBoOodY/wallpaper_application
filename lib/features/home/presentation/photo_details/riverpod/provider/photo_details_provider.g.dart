// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$photoDetailsHash() => r'295a721b91281c0623b0f4ce0257086cc6d2a4be';

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

abstract class _$PhotoDetails extends BuildlessAutoDisposeAsyncNotifier<Photo> {
  late final int photoId;

  FutureOr<Photo> build({
    required int photoId,
  });
}

/// See also [PhotoDetails].
@ProviderFor(PhotoDetails)
const photoDetailsProvider = PhotoDetailsFamily();

/// See also [PhotoDetails].
class PhotoDetailsFamily extends Family<AsyncValue<Photo>> {
  /// See also [PhotoDetails].
  const PhotoDetailsFamily();

  /// See also [PhotoDetails].
  PhotoDetailsProvider call({
    required int photoId,
  }) {
    return PhotoDetailsProvider(
      photoId: photoId,
    );
  }

  @override
  PhotoDetailsProvider getProviderOverride(
    covariant PhotoDetailsProvider provider,
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
  String? get name => r'photoDetailsProvider';
}

/// See also [PhotoDetails].
class PhotoDetailsProvider
    extends AutoDisposeAsyncNotifierProviderImpl<PhotoDetails, Photo> {
  /// See also [PhotoDetails].
  PhotoDetailsProvider({
    required this.photoId,
  }) : super.internal(
          () => PhotoDetails()..photoId = photoId,
          from: photoDetailsProvider,
          name: r'photoDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$photoDetailsHash,
          dependencies: PhotoDetailsFamily._dependencies,
          allTransitiveDependencies:
              PhotoDetailsFamily._allTransitiveDependencies,
        );

  final int photoId;

  @override
  bool operator ==(Object other) {
    return other is PhotoDetailsProvider && other.photoId == photoId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, photoId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<Photo> runNotifierBuild(
    covariant PhotoDetails notifier,
  ) {
    return notifier.build(
      photoId: photoId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

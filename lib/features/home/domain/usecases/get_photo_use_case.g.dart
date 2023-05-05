// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_photo_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getPhotoUseCaseHash() => r'ed8c143fc964f91d67bcdfd82006de0bf53765fb';

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

typedef GetPhotoUseCaseRef = AutoDisposeFutureProviderRef<Photo>;

/// See also [getPhotoUseCase].
@ProviderFor(getPhotoUseCase)
const getPhotoUseCaseProvider = GetPhotoUseCaseFamily();

/// See also [getPhotoUseCase].
class GetPhotoUseCaseFamily extends Family<AsyncValue<Photo>> {
  /// See also [getPhotoUseCase].
  const GetPhotoUseCaseFamily();

  /// See also [getPhotoUseCase].
  GetPhotoUseCaseProvider call({
    required int photoId,
  }) {
    return GetPhotoUseCaseProvider(
      photoId: photoId,
    );
  }

  @override
  GetPhotoUseCaseProvider getProviderOverride(
    covariant GetPhotoUseCaseProvider provider,
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
  String? get name => r'getPhotoUseCaseProvider';
}

/// See also [getPhotoUseCase].
class GetPhotoUseCaseProvider extends AutoDisposeFutureProvider<Photo> {
  /// See also [getPhotoUseCase].
  GetPhotoUseCaseProvider({
    required this.photoId,
  }) : super.internal(
          (ref) => getPhotoUseCase(
            ref,
            photoId: photoId,
          ),
          from: getPhotoUseCaseProvider,
          name: r'getPhotoUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPhotoUseCaseHash,
          dependencies: GetPhotoUseCaseFamily._dependencies,
          allTransitiveDependencies:
              GetPhotoUseCaseFamily._allTransitiveDependencies,
        );

  final int photoId;

  @override
  bool operator ==(Object other) {
    return other is GetPhotoUseCaseProvider && other.photoId == photoId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, photoId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

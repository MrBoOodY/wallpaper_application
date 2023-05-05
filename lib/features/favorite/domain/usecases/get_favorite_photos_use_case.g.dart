// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_favorite_photos_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getFavoritePhotosUseCaseHash() =>
    r'4d611a1b1304db2beb64088a12bf8561358a17aa';

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

typedef GetFavoritePhotosUseCaseRef = AutoDisposeFutureProviderRef<List<Photo>>;

/// See also [getFavoritePhotosUseCase].
@ProviderFor(getFavoritePhotosUseCase)
const getFavoritePhotosUseCaseProvider = GetFavoritePhotosUseCaseFamily();

/// See also [getFavoritePhotosUseCase].
class GetFavoritePhotosUseCaseFamily extends Family<AsyncValue<List<Photo>>> {
  /// See also [getFavoritePhotosUseCase].
  const GetFavoritePhotosUseCaseFamily();

  /// See also [getFavoritePhotosUseCase].
  GetFavoritePhotosUseCaseProvider call({
    int? page,
    int? perPage,
  }) {
    return GetFavoritePhotosUseCaseProvider(
      page: page,
      perPage: perPage,
    );
  }

  @override
  GetFavoritePhotosUseCaseProvider getProviderOverride(
    covariant GetFavoritePhotosUseCaseProvider provider,
  ) {
    return call(
      page: provider.page,
      perPage: provider.perPage,
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
  String? get name => r'getFavoritePhotosUseCaseProvider';
}

/// See also [getFavoritePhotosUseCase].
class GetFavoritePhotosUseCaseProvider
    extends AutoDisposeFutureProvider<List<Photo>> {
  /// See also [getFavoritePhotosUseCase].
  GetFavoritePhotosUseCaseProvider({
    this.page,
    this.perPage,
  }) : super.internal(
          (ref) => getFavoritePhotosUseCase(
            ref,
            page: page,
            perPage: perPage,
          ),
          from: getFavoritePhotosUseCaseProvider,
          name: r'getFavoritePhotosUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getFavoritePhotosUseCaseHash,
          dependencies: GetFavoritePhotosUseCaseFamily._dependencies,
          allTransitiveDependencies:
              GetFavoritePhotosUseCaseFamily._allTransitiveDependencies,
        );

  final int? page;
  final int? perPage;

  @override
  bool operator ==(Object other) {
    return other is GetFavoritePhotosUseCaseProvider &&
        other.page == page &&
        other.perPage == perPage;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, perPage.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

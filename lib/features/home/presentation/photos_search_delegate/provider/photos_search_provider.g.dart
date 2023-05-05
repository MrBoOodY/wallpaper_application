// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photos_search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$photosSearchHash() => r'2044ecd195d179525e131e2eb7d1f76d5ac76678';

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

abstract class _$PhotosSearch
    extends BuildlessAutoDisposeAsyncNotifier<List<Photo>> {
  late final String searchQuery;

  FutureOr<List<Photo>> build({
    required String searchQuery,
  });
}

/// See also [PhotosSearch].
@ProviderFor(PhotosSearch)
const photosSearchProvider = PhotosSearchFamily();

/// See also [PhotosSearch].
class PhotosSearchFamily extends Family<AsyncValue<List<Photo>>> {
  /// See also [PhotosSearch].
  const PhotosSearchFamily();

  /// See also [PhotosSearch].
  PhotosSearchProvider call({
    required String searchQuery,
  }) {
    return PhotosSearchProvider(
      searchQuery: searchQuery,
    );
  }

  @override
  PhotosSearchProvider getProviderOverride(
    covariant PhotosSearchProvider provider,
  ) {
    return call(
      searchQuery: provider.searchQuery,
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
  String? get name => r'photosSearchProvider';
}

/// See also [PhotosSearch].
class PhotosSearchProvider
    extends AutoDisposeAsyncNotifierProviderImpl<PhotosSearch, List<Photo>> {
  /// See also [PhotosSearch].
  PhotosSearchProvider({
    required this.searchQuery,
  }) : super.internal(
          () => PhotosSearch()..searchQuery = searchQuery,
          from: photosSearchProvider,
          name: r'photosSearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$photosSearchHash,
          dependencies: PhotosSearchFamily._dependencies,
          allTransitiveDependencies:
              PhotosSearchFamily._allTransitiveDependencies,
        );

  final String searchQuery;

  @override
  bool operator ==(Object other) {
    return other is PhotosSearchProvider && other.searchQuery == searchQuery;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchQuery.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<List<Photo>> runNotifierBuild(
    covariant PhotosSearch notifier,
  ) {
    return notifier.build(
      searchQuery: searchQuery,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

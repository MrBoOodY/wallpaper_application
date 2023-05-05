// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_photos_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchPhotosUseCaseHash() =>
    r'af1c408eeca8efd4e9ac5720064ca8e4ba12521a';

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

typedef SearchPhotosUseCaseRef = AutoDisposeFutureProviderRef<List<Photo>>;

/// See also [searchPhotosUseCase].
@ProviderFor(searchPhotosUseCase)
const searchPhotosUseCaseProvider = SearchPhotosUseCaseFamily();

/// See also [searchPhotosUseCase].
class SearchPhotosUseCaseFamily extends Family<AsyncValue<List<Photo>>> {
  /// See also [searchPhotosUseCase].
  const SearchPhotosUseCaseFamily();

  /// See also [searchPhotosUseCase].
  SearchPhotosUseCaseProvider call({
    int? page,
    int? perPage,
    required String query,
  }) {
    return SearchPhotosUseCaseProvider(
      page: page,
      perPage: perPage,
      query: query,
    );
  }

  @override
  SearchPhotosUseCaseProvider getProviderOverride(
    covariant SearchPhotosUseCaseProvider provider,
  ) {
    return call(
      page: provider.page,
      perPage: provider.perPage,
      query: provider.query,
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
  String? get name => r'searchPhotosUseCaseProvider';
}

/// See also [searchPhotosUseCase].
class SearchPhotosUseCaseProvider
    extends AutoDisposeFutureProvider<List<Photo>> {
  /// See also [searchPhotosUseCase].
  SearchPhotosUseCaseProvider({
    this.page,
    this.perPage,
    required this.query,
  }) : super.internal(
          (ref) => searchPhotosUseCase(
            ref,
            page: page,
            perPage: perPage,
            query: query,
          ),
          from: searchPhotosUseCaseProvider,
          name: r'searchPhotosUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchPhotosUseCaseHash,
          dependencies: SearchPhotosUseCaseFamily._dependencies,
          allTransitiveDependencies:
              SearchPhotosUseCaseFamily._allTransitiveDependencies,
        );

  final int? page;
  final int? perPage;
  final String query;

  @override
  bool operator ==(Object other) {
    return other is SearchPhotosUseCaseProvider &&
        other.page == page &&
        other.perPage == perPage &&
        other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, perPage.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

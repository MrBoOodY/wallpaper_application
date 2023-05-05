// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_fav_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addToFavUseCaseHash() => r'f72a253c3d1f3d053c84f27cf16a4bf7ff772e55';

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

typedef AddToFavUseCaseRef = AutoDisposeFutureProviderRef<void>;

/// See also [addToFavUseCase].
@ProviderFor(addToFavUseCase)
const addToFavUseCaseProvider = AddToFavUseCaseFamily();

/// See also [addToFavUseCase].
class AddToFavUseCaseFamily extends Family<AsyncValue<void>> {
  /// See also [addToFavUseCase].
  const AddToFavUseCaseFamily();

  /// See also [addToFavUseCase].
  AddToFavUseCaseProvider call({
    required Photo photo,
  }) {
    return AddToFavUseCaseProvider(
      photo: photo,
    );
  }

  @override
  AddToFavUseCaseProvider getProviderOverride(
    covariant AddToFavUseCaseProvider provider,
  ) {
    return call(
      photo: provider.photo,
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
  String? get name => r'addToFavUseCaseProvider';
}

/// See also [addToFavUseCase].
class AddToFavUseCaseProvider extends AutoDisposeFutureProvider<void> {
  /// See also [addToFavUseCase].
  AddToFavUseCaseProvider({
    required this.photo,
  }) : super.internal(
          (ref) => addToFavUseCase(
            ref,
            photo: photo,
          ),
          from: addToFavUseCaseProvider,
          name: r'addToFavUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addToFavUseCaseHash,
          dependencies: AddToFavUseCaseFamily._dependencies,
          allTransitiveDependencies:
              AddToFavUseCaseFamily._allTransitiveDependencies,
        );

  final Photo photo;

  @override
  bool operator ==(Object other) {
    return other is AddToFavUseCaseProvider && other.photo == photo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, photo.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

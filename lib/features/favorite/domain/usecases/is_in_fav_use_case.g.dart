// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_in_fav_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isInFavUseCaseHash() => r'053bbee5ccea2dcb888fad47e9eafe645f2c9dde';

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

typedef IsInFavUseCaseRef = AutoDisposeFutureProviderRef<bool>;

/// See also [isInFavUseCase].
@ProviderFor(isInFavUseCase)
const isInFavUseCaseProvider = IsInFavUseCaseFamily();

/// See also [isInFavUseCase].
class IsInFavUseCaseFamily extends Family<AsyncValue<bool>> {
  /// See also [isInFavUseCase].
  const IsInFavUseCaseFamily();

  /// See also [isInFavUseCase].
  IsInFavUseCaseProvider call({
    required int photoId,
  }) {
    return IsInFavUseCaseProvider(
      photoId: photoId,
    );
  }

  @override
  IsInFavUseCaseProvider getProviderOverride(
    covariant IsInFavUseCaseProvider provider,
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
  String? get name => r'isInFavUseCaseProvider';
}

/// See also [isInFavUseCase].
class IsInFavUseCaseProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [isInFavUseCase].
  IsInFavUseCaseProvider({
    required this.photoId,
  }) : super.internal(
          (ref) => isInFavUseCase(
            ref,
            photoId: photoId,
          ),
          from: isInFavUseCaseProvider,
          name: r'isInFavUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isInFavUseCaseHash,
          dependencies: IsInFavUseCaseFamily._dependencies,
          allTransitiveDependencies:
              IsInFavUseCaseFamily._allTransitiveDependencies,
        );

  final int photoId;

  @override
  bool operator ==(Object other) {
    return other is IsInFavUseCaseProvider && other.photoId == photoId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, photoId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

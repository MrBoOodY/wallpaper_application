// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_photo_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$downloadPhotoUseCaseHash() =>
    r'aebe59b83ba48428b9ead357c00e0400c9f6e634';

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

typedef DownloadPhotoUseCaseRef = AutoDisposeFutureProviderRef<void>;

/// See also [downloadPhotoUseCase].
@ProviderFor(downloadPhotoUseCase)
const downloadPhotoUseCaseProvider = DownloadPhotoUseCaseFamily();

/// See also [downloadPhotoUseCase].
class DownloadPhotoUseCaseFamily extends Family<AsyncValue<void>> {
  /// See also [downloadPhotoUseCase].
  const DownloadPhotoUseCaseFamily();

  /// See also [downloadPhotoUseCase].
  DownloadPhotoUseCaseProvider call({
    required String url,
  }) {
    return DownloadPhotoUseCaseProvider(
      url: url,
    );
  }

  @override
  DownloadPhotoUseCaseProvider getProviderOverride(
    covariant DownloadPhotoUseCaseProvider provider,
  ) {
    return call(
      url: provider.url,
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
  String? get name => r'downloadPhotoUseCaseProvider';
}

/// See also [downloadPhotoUseCase].
class DownloadPhotoUseCaseProvider extends AutoDisposeFutureProvider<void> {
  /// See also [downloadPhotoUseCase].
  DownloadPhotoUseCaseProvider({
    required this.url,
  }) : super.internal(
          (ref) => downloadPhotoUseCase(
            ref,
            url: url,
          ),
          from: downloadPhotoUseCaseProvider,
          name: r'downloadPhotoUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$downloadPhotoUseCaseHash,
          dependencies: DownloadPhotoUseCaseFamily._dependencies,
          allTransitiveDependencies:
              DownloadPhotoUseCaseFamily._allTransitiveDependencies,
        );

  final String url;

  @override
  bool operator ==(Object other) {
    return other is DownloadPhotoUseCaseProvider && other.url == url;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, url.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

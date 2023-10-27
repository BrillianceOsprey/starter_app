// ignore_for_file: lines_longer_than_80_chars

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_app/src/initialization/app_initialization.dart';

/// Extension methods specific for the main project configuration
extension AppInitializationMain on AppInitialization {
  /// Creates the top-level [ProviderContainer] by overriding providers with fake
  /// repositories only. This is useful for testing purposes and for running the
  /// app with a "fake" backend.
  ///
  /// Note: all repositories needed by the app can be accessed via providers.
  /// Some of these providers throw an [UnimplementedError] by default.
  ///
  /// Example:
  /// ```dart
  /// @Riverpod(keepAlive: true)
  /// LocalCartRepository localCartRepository(LocalCartRepositoryRef ref) {
  ///   throw UnimplementedError();
  /// }
  /// ```
  ///
  /// As a result, this method does two things:
  /// - create and configure the repositories as desired
  /// - override the default implementations with a list of "overrides"
  Future<ProviderContainer> createMainProviderContainer({
    List<Override> overrides = const [],
  }) async {
    final container = ProviderContainer(
      overrides: overrides,
      // observers: [
      //   AsyncErrorLogger(),
      // ],
    );

    return container;
  }
}

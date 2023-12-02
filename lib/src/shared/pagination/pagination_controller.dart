import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'paginate.dart';

/// This controller will provide methods to handle pagination logic and
/// can be mixed into Riverpod notifiers where pagination is required.
///
/// This [PaginationController] provides the following functionalities:
///
/// * **`loadData`** - This is an abstract function that you need to implement
/// when you mix this class. It should handle the actual data fetching and
/// parsing.
///
/// * **`loadMore`** - This method is responsible for loading more data, it
/// triggers a loading state, fetches the new data, and adds it to the existing
/// data.
///
/// * **`canLoadMore`** - This function determines whether more data can be
/// loaded. It checks if there is an ongoing loading operation and if all data
/// has already been loaded.
/// * **`isCompleted`** - This getter checks if the pagination is completed
/// based on the information in the [Paginate] model.
/// * **`nextPage()`** - This method, defined inPaginationResponse, returns a
/// [PaginationRequest] for the next page.
///
/// For riverpod async notifier [AutoDisposeAsyncNotifier]
/// with `keepAlive: false`
///
mixin AutoDisposePaginationControllerMixin<T>
    // ignore: invalid_use_of_internal_member
    on BuildlessAutoDisposeAsyncNotifier<PaginatedResponse<T>> {
  /// An abstract function that you need to implement when you extends this
  /// class.
  ///
  /// It should handle the actual data fetching and parsing.
  FutureOr<PaginatedResponse<T>> loadData(PaginationRequest? query);

  /// This method is responsible for loading more data, it triggers a loading
  /// state, fetches the new data, and adds it to the existing data.
  FutureOr<void> loadMore() async {
    final oldState = state;

    if (oldState.requireValue.isCompleted) return;

    state = AsyncLoading<PaginatedResponse<T>>().copyWithPrevious(oldState);
    state = await AsyncValue.guard<PaginatedResponse<T>>(() async {
      final res = await loadData(oldState.requireValue.nextPage());
      res.data.insertAll(0, state.requireValue.data);
      return res;
    });
  }

  /// This function determines whether more data can be loaded. It checks if
  /// there is an ongoing loading operation and if all data
  bool canLoadMore() {
    if (state.isLoading) return false;
    if (!state.hasValue) return false;
    if (state.requireValue.isCompleted) return false;
    return true;
  }
}

/// This controller will provide methods to handle pagination logic and
/// can be mixed into Riverpod notifiers where pagination is required.
///
/// This [PaginationController] provides the following functionalities:
///
/// * **`loadData`** - This is an abstract function that you need to implement
/// when you mix this class. It should handle the actual data fetching and
/// parsing.
///
/// * **`loadMore`** - This method is responsible for loading more data, it
/// triggers a loading state, fetches the new data, and adds it to the existing
/// data.
///
/// * **`canLoadMore`** - This function determines whether more data can be
/// loaded. It checks if there is an ongoing loading operation and if all data
/// has already been loaded.
/// * **`isCompleted`** - This getter checks if the pagination is completed
/// based on the information in the [Paginate] model.
/// * **`nextPage()`** - This method, defined inPaginationResponse, returns a
/// [PaginationRequest] for the next page.
///
/// For riverpod async notifier [AsyncNotifier]
/// with `keepAlive: true`
///
mixin PaginationControllerMixin<T>
    // ignore: invalid_use_of_internal_member
    on BuildlessAsyncNotifier<PaginatedResponse<T>> {
  /// An abstract function that you need to implement when you extends this
  /// class.
  ///
  /// It should handle the actual data fetching and parsing.
  FutureOr<PaginatedResponse<T>> loadData(PaginationRequest? query);

  /// This method is responsible for loading more data, it triggers a loading
  /// state, fetches the new data, and adds it to the existing data.
  FutureOr<void> loadMore() async {
    final oldState = state;

    if (oldState.requireValue.isCompleted) return;

    state = AsyncLoading<PaginatedResponse<T>>().copyWithPrevious(oldState);
    state = await AsyncValue.guard<PaginatedResponse<T>>(() async {
      final res = await loadData(oldState.requireValue.nextPage());
      res.data.insertAll(0, state.requireValue.data);
      return res;
    });
  }

  /// This function determines whether more data can be loaded. It checks if
  /// there is an ongoing loading operation and if all data
  bool canLoadMore() {
    if (state.isLoading) return false;
    if (!state.hasValue) return false;
    if (state.requireValue.isCompleted) return false;
    return true;
  }
}

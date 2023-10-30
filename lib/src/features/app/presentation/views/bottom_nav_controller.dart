// ignore_for_file: inference_failure_on_function_invocation

import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starter_app/src/shared/constants/keys.dart';

part 'bottom_nav_controller.g.dart';

@riverpod
class BottomNavController extends _$BottomNavController {
  @override
  int? build() {
    // final value = Hive.box(Keys.keyPrefs)
    //     .get(Keys.keyNavIdx, defaultValue: state) as int?;
    return 0;
  }

  // ignore: use_setters_to_change_properties
  void setIndex(int index) => state = index;

  void setAndPersistValue(int index) {
    state = index;
    Hive.box(Keys.keyPrefs).put(Keys.keyNavIdx, index);
  }
}

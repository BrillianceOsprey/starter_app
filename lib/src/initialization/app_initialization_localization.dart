import 'package:easy_localization/easy_localization.dart';
import 'package:starter_app/src/initialization/app_initialization.dart';

extension AppBootstrapLocalization on AppInitialization {
  Future<void> setupEasyLocalization() async {
    await EasyLocalization.ensureInitialized();
  }
}

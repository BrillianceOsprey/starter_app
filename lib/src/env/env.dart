import 'package:envied/envied.dart';
import 'package:starter_app/flavors.dart';
part 'env.g.dart';

class Env {
  static String get apiUrl => switch (F.appFlavor) {
        Flavor.staging => EnvStaging.apiUrl,
        Flavor.production => EnvProduction.apiUrl,
        _ => EnvDevelopment.apiUrl,
      };
}

@Envied(path: '.env.development')
abstract class EnvDevelopment {
  @EnviedField(varName: 'API_URL', obfuscate: true)
  static final String apiUrl = _EnvDevelopment.apiUrl;
}

@Envied(path: '.env.staging')
abstract class EnvStaging {
  @EnviedField(varName: 'API_URL', obfuscate: true)
  static final String apiUrl = _EnvStaging.apiUrl;
}

@Envied(path: '.env.production')
abstract class EnvProduction {
  @EnviedField(varName: 'API_URL', obfuscate: true)
  static final String apiUrl = _EnvProduction.apiUrl;
}

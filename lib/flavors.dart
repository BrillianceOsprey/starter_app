enum Flavor { development, staging, production }

class F {
  static Flavor? appFlavor;

  static String get title => switch (appFlavor) {
        Flavor.development => '[DEV] Ecommerce',
        Flavor.staging => '[STG] Ecommerce',
        _ => 'Ecommerce'
      };
}

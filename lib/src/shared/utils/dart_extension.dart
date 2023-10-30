/// Nulluable [String] extension
extension StringNullX on String? {
  String get nullSafe => this ?? '';

  bool get isNullOrEmpty => nullSafe.isEmpty;

  num get safeNum => num.tryParse(nullSafe).safe;
  int get safeInt => safeNum.safeInt;
  double get safeDouble => safeNum.safeDouble;
}

/// Nulluable [num] extension
extension NumNullX on num? {
  String get safeString => '$this';

  num get safe {
    if (this is double?) {
      return this ?? 0.0;
    } else {
      return this ?? 0;
    }
  }

  int get safeInt => safe.toInt();
  double get safeDouble => safe.toDouble();
}

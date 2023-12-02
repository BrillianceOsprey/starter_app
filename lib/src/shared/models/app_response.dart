import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:starter_app/src/shared/errors/exceptions.dart';
part 'app_response.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class AppResponse<T> extends Equatable {
  const AppResponse._({
    required this.success,
    required this.message,
    this.errors,
    this.data,
  });

  factory AppResponse({
    String? success,
    required String message,
    List<Map<String, dynamic>>? errors,
    T? data,
  }) =>
      AppResponse._(
        success: success ?? 'success',
        message: message,
        errors: errors,
        data: data,
      );

  factory AppResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$AppResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(
    Object? Function(T? value) toJsonT,
  ) =>
      _$AppResponseToJson(this, toJsonT);

  /// The boolean indicates the [AppResponse] is success or failed
  final String success;

  /// The message of [AppResponse]
  /// * can be array or string
  final String message;

  /// Errors stacktrace from server.
  ///
  /// ```json
  /// errors: [
  ///  {
  ///       type: "field",
  ///       value: "mmmm",
  ///       msg: "Password should be at least 7 chars long",
  ///       path: "password",
  ///       location: "body"
  ///  }
  /// ```
  final List<Map<String, dynamic>>? errors;

  /// The [AppResponse] data
  final T? data;

  @override
  List<Object?> get props => [success, message, data ?? ''];

  @override
  bool? get stringify => true;
}

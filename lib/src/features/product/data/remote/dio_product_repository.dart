// import 'package:dio/dio.dart';
// import 'package:starter_app/src/features/product/domain/product.dart';
// import 'package:starter_app/src/shared/constants/endpoints.dart';
// import 'package:starter_app/src/shared/models/app_response.dart';
// import 'package:starter_app/src/shared/pagination/paginate.dart';
// import 'package:starter_app/src/shared/utils/dio_client/dio_client.dart';

// class DioProductRepository {
//   DioProductRepository({
//     Dio? dioClient,
//   }) : _httpClient = dioClient ??= DioClient().instance;

//   final Dio _httpClient;

//   Future<PaginatedResponse<Product>?> getPaginatedProducts({
//     required int page,
//     required int limit,
//   }) async {
//     final response = await _httpClient.post(
//       Endpoints.products,
//       queryParameters: {
//         'page': page,
//         'limit': limit,
//       },
//     );

//     final result = AppResponse.fromJson(
//       response.data,
//       (dynamic json) => response.data['success'] && json != null
//           ? PaginatedResponse<Product>.fromJson(
//               json,
//               (v) => Product.fromJson(v as Map<String, dynamic>),
//             )
//           : null,
//     );

//     return result.throwIfError().data;
//   }
// }

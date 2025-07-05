part of '../api_client.export.dart';

class DynamicInterceptor extends Interceptor {
  DynamicInterceptor({required this.baseUrl, required this.cacheService, this.refreshTokenUrl, this.onTokenRefresh});

  final String baseUrl;
  final CacheService cacheService;
  final String? refreshTokenUrl;
  final String Function(Map<String, dynamic>)? onTokenRefresh;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final token = await cacheService.bearerToken;

      if (token != null && options.path.contains(baseUrl)) {
        options.headers['Authorization'] = 'Bearer $token';
      }

      handler.next(options); // Proceed with the request
    } catch (e) {
      // If any error occurs, proceed anyway
      handler.next(options);
    }
  }

  Future<Response<dynamic>> _retryRequest(RequestOptions requestOptions, String newToken) {
    final options = Options(
      method: requestOptions.method,
      headers: {...requestOptions.headers, 'Authorization': 'Bearer $newToken'},
    );

    return Dio().request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  bool _shouldAttemptRefresh(DioException err) {
    return err.response?.statusCode == 401;
  }
}

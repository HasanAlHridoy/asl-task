import 'package:asl_task/src/core/network/api_client.export.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeRepository = Provider<HomeRepository>((ref) {
  return HomeRepository(apiClient: ref.watch(apiClientProvider));
});

class HomeRepository {
  final ApiClient apiClient;

  HomeRepository({required this.apiClient});

  Future<ApiResponse<dynamic>> getHomeData() async {
    return apiClient.get(apiType: APIType.public, path: ApiEndpoints.homeData);
  }
}

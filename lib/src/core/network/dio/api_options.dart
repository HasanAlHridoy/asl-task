part of '../api_client.export.dart';

enum TokenType { authToken, bearerToken, stripe }

class PublicApiOptions {
  Options get options => Options(
    headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
  );
}

class ProtectedApiOptions {
  ProtectedApiOptions({required this.cacheService, this.tokenType});

  final CacheService cacheService;
  final TokenType? tokenType;

  Future<Options> get options async {
    final bearerToken = await cacheService.bearerToken;
    final authToken = await cacheService.authToken;
    // final residenceToken = await cacheService.residenceToken;

    return Options(
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        if (tokenType == TokenType.bearerToken)
          'Authorization': 'Bearer $bearerToken',
        // 'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2ODI3MWI1OTU5NjRlZDRiZjg4ZWM4Y2QiLCJyb2xlIjoidXNlciIsImlhdCI6MTc0NzY2MzY0MSwiZXhwIjoxNzUwMjU1NjQxfQ.u9L__0nuLAmJW2lzy2zJGV8Tu4bYoVOz44RnIapPUuo',
        if (tokenType == TokenType.authToken) 'token': authToken,
        // if (tokenType == TokenType.stripe) 'Authorization': 'Bearer ${Env.stripeSecretKey}',
      },
    );
  }
}

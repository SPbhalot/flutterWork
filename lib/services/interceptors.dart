import 'package:dio/dio.dart';
import 'package:heytorus/services/local-storage.dart';

class AddJWT extends Interceptor {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    print('accessToken');
    options.headers['content-Type'] = 'application/json';
    String? accessToken = await securedStorageService.read(key: 'accessToken');

    options.headers['authorization'] = 'Bearer $accessToken';
    print(accessToken);

    // return super.onRequest(options);
    //print(accessToken);
    handler.next(options);
  }
}

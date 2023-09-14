import 'links.dart';

class HttpClientProvider implements IHttpClientProvider {
  var client = Dio(
    BaseOptions(
      baseUrl: weatherApi,
    ),
  );

  var client3 = Dio();
  static HttpClientProvider? _instance;

  static HttpClientProvider get getInstance =>
      _instance = _instance ?? HttpClientProvider();

  HttpClientProvider() {
    client.interceptors.addAll([
      PrettyDioLogger(
        requestHeader: false,
        requestBody: false,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
      InterceptorsWrapper(onError: (err, errHandler) async {
        return errHandler.resolve(err.response!);
      }),
      // InterceptorsWrapper(onRequest: (options, handler) async {
      //   if (options.headers.containsKey('requiresToken')) {
      //     options.headers.remove("requiresToken");
      //     var token = await preferencesService.getString(KEY_TOKEN);
      //     var customHeaders = {'Authorization': 'Bearer $token'};
      //     options.headers.addAll(customHeaders);
      //     return handler.next(options);
      //   }
      //   return handler.next(options);
      // }),
    ]);
  }

  @override
  Dio getHttpClient() {
    return client;
  }

  @override
  void allowHeaders() {}
}

class IHttpClientProvider {
  Dio? getHttpClient() {
    return null;
  }

  void allowHeaders() {}
}

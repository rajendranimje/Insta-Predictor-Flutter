import 'package:dio/dio.dart';
import 'package:InstaPredictor/res/constants/api_constants.dart';

class BaseApiClient {
  late final Dio _client = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
    ),
  )..interceptors.addAll([
      CustomInterceptor(),
      LoggingInterceptor(),
      InterceptorsWrapper(
        onError: (DioException  error, handler) {
          if (error.type == DioExceptionType .connectionTimeout ||
              error.type == DioExceptionType .receiveTimeout ||
              error.type == DioExceptionType .badResponse) {
            // Show an alert to the user that the server is not responding
            print('Server is not responding');
          }
          // Pass the error to the next interceptor
          handler.next(error);
        },
      ),
    ]);

  Future<dynamic> getCall(String endpoint, Map<String, dynamic>? params) async {
    try {
      var response = await _client.get(endpoint,
          options: Options(
              headers: {"content-type": "application/json;charset=UTF-8"}),
          queryParameters: params);
      print("Printing Response:::::::${response.data}");
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}

// CustomInterceptor adds a custom header to every request
class CustomInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // add custom header to request
    options.headers['Custom-Header'] = 'custom value';
    super.onRequest(options, handler);
  }
}

// LoggingInterceptor logs the request and response data
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('Sending request: ${options.uri}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('Received response: ${response.data}');
    super.onResponse(response, handler);
  }
}


/*     try {
      Dio dio = getDio();
      dio.interceptors
          .add(DioLoggingInterceptor(level: Level.body, compact: false));
      var response = await _client.get(url,
          options: Options(headers: headers), queryParameters: params);

      print("Printing Response:::::::${response.data}");
      return response.data;
    } on DioError catch (e) {
      print(e.toString());
    } */

    /* BaseOptions options = BaseOptions(
    baseUrl: ApiConstants.VirtuoBaseUrl,
    connectTimeout: 30 * 1000,
    receiveTimeout: 30 * 1000,
    headers: {
      'Content-Type': 'application/json',
      'X-RapidAPI-Host': 'tasty.p.rapidapi.com',
      'X-RapidAPI-Key': '....',
      'useQueryString': true
    },
  );

  Dio getDio() {
    return Dio(options);
  }
  /*  final dio = Dio()
  ..interceptors.add(
    DioLoggingInterceptor(
     level: Level.body,
      compact: false,
    ),
    

    /* InterceptorsWrapper(
      onResponse: (response, handler) {
        if (response.requestOptions.method == HttpMethod.GET) {
          response.data = jsonDecode(response.data as String);
        }
        return handler.next(response);
    },
  ), */
); */
 */

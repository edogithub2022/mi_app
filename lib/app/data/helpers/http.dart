import 'http_method.dart';
import 'http_result.dart';
import 'parse_response_body.dart';
import 'send_request.dart';

typedef Parse<T> = T Function(dynamic data);

class Http {
  final String baseUrl;
  Http({this.baseUrl = ''});

  late Uri url;

  Future<HttpResult<T>> request<T>(
    String path, {
    HttpMethod method = HttpMethod.get,
    Map<String, String> headers = const {},
    Map<String, String> queryParameters = const {},
    dynamic body,
    Parse<T>? parse,
    Duration timeOut = const Duration(seconds: 15),
  }) async {
    int? statusCode;
    dynamic data;
    try {
      if (path.startsWith("http://") || path.startsWith("https://")) {
        url = Uri.parse(path);
        url = Uri.parse(path);
      } else {
        url = Uri.parse("$baseUrl$path");
      }

      if (queryParameters.isNotEmpty) {
        url = url.replace(queryParameters: {
          ...url.queryParameters,
          ...queryParameters,
        });
      }

      final reponse = await sendRequest(
        url: url,
        method: method,
        headers: headers,
        body: body,
        timeOut: timeOut,
      );

      data = parseResponseBody(reponse.body);
      statusCode = reponse.statusCode;
      if (statusCode >= 400) {
        throw HttpError(
          data: data,
          stackTrace: StackTrace.current,
          exception: null,
        );
      }

      return HttpResult<T>(
        data: parse != null ? parse(data) : data,
        statusCode: statusCode,
        error: null,
      );
    } catch (e, s) {
      if (e is HttpError) {
        return HttpResult(
          data: null,
          statusCode: statusCode!,
          error: e,
        );
      }

      return HttpResult(
        data: null,
        statusCode: statusCode ?? -1,
        error: HttpError(
          data: data,
          exception: e,
          stackTrace: s,
        ),
      );
    }
  }
}

import 'dart:convert';
import 'dart:io';

import 'http_method.dart';

import 'package:http/http.dart';
import 'package:http/io_client.dart' as http;

dynamic _parseBody(dynamic body) {
  try {
    return jsonEncode(body);
  } catch (_) {
    return body;
  }
}

Future<Response> sendRequest({
  required Uri url,
  required HttpMethod method,
  required Map<String, String> headers,
  required dynamic body,
  required Duration timeOut,
}) {
  var finalHeaders = {...headers};

  if (method != HttpMethod.get) {
    final contentType = finalHeaders['Content-type'];
    if (contentType == null || contentType.contains("application/json")) {
      finalHeaders['Content-type'] = "application/json; charset=UTF-8";
      body = _parseBody(body);
    }
  }

  // final client = Client();
  //Solucion para que no marque error de timeout en "io_client.dart"
  final ioClient = HttpClient();
  ioClient.connectionTimeout = timeOut;
  final client = http.IOClient(ioClient);

  switch (method) {
    case HttpMethod.get:
      final resp = client.get(url, headers: finalHeaders);
      client.close();
      return resp;
    case HttpMethod.post:
      final resp = client.post(url, headers: finalHeaders, body: body);
      client.close();
      return resp;
    case HttpMethod.put:
      final resp = client.put(url, headers: finalHeaders, body: body);
      client.close();
      return resp;
    case HttpMethod.patch:
      final resp = client.patch(url, headers: finalHeaders, body: body);
      client.close();
      return resp;
    case HttpMethod.delete:
      final resp = client.delete(url, headers: finalHeaders, body: body);
      client.close();
      return resp;
  }
}

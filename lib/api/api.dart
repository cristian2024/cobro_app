import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class Api {
  /// general headers
  static Map<String, String> generalHeaders() {
    return {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
  }

  /// Add Headers to Request
  static Future<Map<String, String>> addTokenToHeader({
    Map<String, String> headers = const {},
  }) async {
    headers[HttpHeaders.contentTypeHeader] = 'application/json';
    return headers;
  }

  /// Converts a json response into a Map
  /// Returns. Map String, dynamic
  static dynamic decode(String response) => jsonDecode(response);

  /// Converts/encode a Map into a String json
  /// Returns. Map String, dynamic
  static String encode(Map<String, dynamic>? response) => jsonEncode(response);

  /// get petissions
  /// Returns Future con la respuesta
  static Future<dynamic> get(
    String path, {
    Map<String, String>? headers,
  }) async {
    Uri uri = Uri.parse(path);
    final response = await http.get(uri, headers: headers);
    return decode(response.body);
  }

  /// Hace peticiones post con la subruta pasada por parametro y la
  /// data que es enviada en el body del request
  /// Returns Future con un Map de la respuesta
  static Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic> data = const {},
    Map<String, String>? headers,
  }) async {
    String body = encode(data);
    Map<String, String> headersSent = headers ?? generalHeaders();
    body = (body != 'null' ? body : null) ?? '';
    Uri uri = Uri.parse(path);
    final response = await http.post(
      uri,
      body: body,
      headers: headersSent,
    );

    return decode(response.body);
  }

  /// Put petition for api management
  /// Returns Future con un Map de la respuesta
  static Future<Map<String, dynamic>> put(
    String path, {
    Map<String, dynamic> data = const {},
    Map<String, String> headers = const {},
  }) async {
    final body = encode(data);
    Uri uri = Uri.parse(path);
    final response = await http.put(uri, body: body, headers: headers);
    return decode(response.body);
  }

  /// Delete petition to every api
  /// Returns Future con un Map de la respuesta
  static Future<Map<String, dynamic>> delete(
    String path, {
    Map<String, dynamic> data = const {},
    Map<String, String> headers = const {},
  }) async {
    Uri uri = Uri.parse(path);
    final body = encode(data);
    final response = await http.delete(uri, body: body, headers: headers);
    return decode(response.body);
  }
}

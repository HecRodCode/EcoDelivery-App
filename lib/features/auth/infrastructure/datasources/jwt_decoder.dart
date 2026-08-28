import 'dart:convert';

Map<String, dynamic> decodeJwtPayload(String token) {
  final parts = token.split('.');
  if (parts.length != 3) {
    throw const FormatException('Token JWT inválido.');
  }

  var payload = parts[1];
  payload = payload.padRight((payload.length + 3) ~/ 4 * 4, '=');

  final decoded = utf8.decode(base64Url.decode(payload));
  return jsonDecode(decoded) as Map<String, dynamic>;
}

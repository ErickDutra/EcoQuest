import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> registrar(String nome, String senha, String email) async {
  final url = Uri.parse('http://10.0.2.2:8081/registrar');

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'nome': nome, 'senha': senha, 'email': email}),
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
  } else {
    throw Exception(
      'Falha no registro: ${response.statusCode} - ${response.body}',
    );
  }
}

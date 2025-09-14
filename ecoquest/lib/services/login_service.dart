import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecoquest/model/profile.dart';

Future<Profile> login(String email, String password) async {
  final url = Uri.parse('http://10.0.2.2:8081/login');
  final body = jsonEncode({
    'email': email,
    'senha': password,
  });

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: body,
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    final profile = Profile(
      id: data['id'],
      nome: data['nome'],
      pontos: data['pontos'],
      diasConsecutivos: data['diasConsecutivos'],
      experience: data['experience'],
      level: data['level'],
    );

   
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('profile', jsonEncode(data));

    return profile;
  } else {
    throw Exception('Falha no login: ${response.statusCode}');
  }
}
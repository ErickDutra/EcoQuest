import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecoquest/model/profile.dart';

Future<Profile> getProfile(String profileId) async {
  final prefs = await SharedPreferences.getInstance();
  final cachedData = prefs.getString('profile_$profileId');

  if (cachedData != null) {
    final Map<String, dynamic> data = jsonDecode(cachedData);
    return Profile(
      id: data['id'],
      nome: data['nome'],
      pontos: data['pontos'],
      experience: data['experience'],
      level: data['level'],
      diasConsecutivos: data['diasConsecutivos'],
    );
  }

  final url = Uri.parse('http://10.0.2.2:8081/profiles/$profileId');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    final profile = Profile(
      id: data['id'],
      nome: data['nome'],
      pontos: data['pontos'],
      experience: data['experience'],
      level: data['level'],
      diasConsecutivos: data['diasConsecutivos'],
    );

    prefs.setString('profile_$profileId', jsonEncode(data));
    return profile;
  } else {
    throw Exception('Falha ao carregar perfil: ${response.statusCode}');
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ecoquest/model/profile.dart';

Future<Profile> completeMission(String profileId, String missionId) async {
  final url = Uri.parse('http://10.0.2.2:8081/missao-concluida');
  final body = jsonEncode({'profileId': profileId, 'missionId': missionId});

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: body,
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    final updatedProfile = Profile(
      id: data['id'],
      nome: data['nome'],
      pontos: data['pontos'],
      experience: data['experience'],
      level: data['level'],
      diasConsecutivos: data['diasConsecutivos'],
    );
    print('Missão completada com sucesso');
    return updatedProfile;
  } else {
    throw Exception('Falha ao completar missão: ${response.statusCode}');
  }
}

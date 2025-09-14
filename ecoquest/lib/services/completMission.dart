import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> completeMission(String profileId, String missionId) async {
  final url = Uri.parse('http://10.0.2.2:8081/missao-concluida'); 
  final body = jsonEncode({
    'profileId': profileId,
    'missionId': missionId,
  });

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: body,
  );

  if (response.statusCode == 200) {
    print('Missão completada com sucesso');
  } else {
    throw Exception('Falha ao completar missão: ${response.statusCode}');
  }
}
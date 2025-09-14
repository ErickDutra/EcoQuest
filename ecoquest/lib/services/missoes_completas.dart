import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecoquest/model/mission.dart';

Future<List<Mission>> getCompletedMissions(String profileId) async {
  final prefs = await SharedPreferences.getInstance();
  final cachedData = prefs.getString('completed_missions_$profileId');

  if (cachedData != null) {
    List<dynamic> data = jsonDecode(cachedData);
    return data.map((json) => Mission.fromJson(json)).toList();
  }

  final response = await http.get(Uri.parse('http://10.0.2.2:8081/missao-concluida/$profileId'));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    List<Mission> missions = data.map((json) => Mission.fromJson(json)).toList();
    prefs.setString('completed_missions_$profileId', jsonEncode(data));
    return missions;
  } else {
    throw Exception('Falha ao carregar missões completadas: ${response.statusCode}');
  }
}
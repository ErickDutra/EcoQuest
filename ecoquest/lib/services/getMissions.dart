import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ecoquest/model/mission.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<Mission>> getMissions(String profileId) async {
  final prefs = await SharedPreferences.getInstance();
  final cachedData = prefs.getString('missions');

  if (cachedData != null) {
    List<dynamic> data = jsonDecode(cachedData);
    return data.map((json) => Mission.fromJson(json)).toList();
  }

  final response = await http.get(Uri.parse('http://localhost:8081/missions/available/${profileId}'));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    List<Mission> missions = data.map((json) => Mission.fromJson(json)).toList();
    prefs.setString('missions', jsonEncode(data));
    return missions;
  } else {
    throw Exception('Falha ao carregar missões');
  }
}
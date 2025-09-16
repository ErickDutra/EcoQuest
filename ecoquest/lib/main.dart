import 'package:ecoquest/components/title_custom.dart';
import 'package:ecoquest/model/mission.dart';
import 'package:ecoquest/model/profile.dart';
import 'package:ecoquest/windows/home_window.dart';
import 'package:ecoquest/windows/mission_window.dart';
import 'package:ecoquest/windows/profile_window.dart';
import 'package:ecoquest/windows/login_window.dart';
import 'package:ecoquest/windows/register_window.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginWindow(),
        '/home': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>;
          final perfil = args['perfil'] as Profile;
          final missoes = args['missoes'] as List<Mission>;
          return MyHomePage(missoes: missoes, perfil: perfil);
        },
        '/missions': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>;
          final perfil = args['perfil'] as Profile;
          final missoes = args['missoes'] as List<Mission>;
          return MissionWindow(missoes: missoes, profileId: perfil.id);
        },
        '/profile': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>;
          final perfil = args['perfil'] as Profile;
          return ProfileWindow(profile: perfil);
        },
        '/register': (context) {
          return RegisterWindow();
        },
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.missoes, required this.perfil});
  final List<Mission> missoes;
  final Profile perfil;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  late Profile _currentProfile;

  @override
  void initState() {
    super.initState();
    _currentProfile = widget.perfil;
  }

  void _updateProfile(Profile newProfile) {
    setState(() {
      _currentProfile = newProfile;
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TitleCustom(profile: _currentProfile),
            Expanded(
              child: IndexedStack(
                index: _currentIndex,
                children: [
                  HomeWindow(
                    missoes: widget.missoes,
                    profileId: _currentProfile.id,
                    onProfileUpdated: _updateProfile,
                  ),
                  MissionWindow(
                    missoes: widget.missoes,
                    profileId: _currentProfile.id,
                    onProfileUpdated: _updateProfile,
                  ),
                  ProfileWindow(profile: _currentProfile),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.adjust), label: 'Missões'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Perfil',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}

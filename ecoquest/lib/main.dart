import 'package:ecoquest/components/title_custom.dart';
import 'package:ecoquest/model/mission.dart';
import 'package:ecoquest/model/profile.dart';
import 'package:ecoquest/windows/home_window.dart';
import 'package:ecoquest/windows/mission_window.dart';
import 'package:ecoquest/windows/profile_window.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const profile = {
  "nome": "Erick Dutra ",
  "pontos": 3000,
  "dias_consecutivos": 10,
  "experience": 100,
  "level": 5,
  "photo": "http:/foto",
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
        '/missions': (context) => MissionWindow(
          missoes:  [
            // Exemplo de missão
            Mission(
              titulo: 'Recicle 5 garrafas',
              descricao: 'Leve 5 garrafas PET ao ponto de coleta.',
              icon: 'assets/icons/recycle.png',
              quantidadeAtual: 2,
              quantidadeTotal: 5,
              nivelDificuldade: 'Fácil',
              experience: 100.00,
              points: 10.00
            ),
          ],
        ),
        '/profile': (context) => ProfileWindow(
           profile: Profile(
            nome: profile['nome'] as String,
            pontos: profile['pontos'] as int,
            diasConsecutivos: profile['dias_consecutivos'] as int,
            experience: profile['experience'] as int,
            level: profile['level'] as int,
            photo: profile['photo'] as String,
          ),
        ),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final perfil = Profile(
    nome: profile['nome'] as String,
    pontos: profile['pontos'] as int,
    diasConsecutivos: profile['dias_consecutivos'] as int,
    experience: profile['experience'] as int,
    level: profile['level'] as int,
    photo: profile['photo'] as String,
  );

  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TitleCustom(profile: perfil),
            Expanded(
              child: IndexedStack(
                index: _currentIndex,
                children:  [
                  HomeWindow(),
                  MissionWindow(
                    missoes: [
                      Mission(
                        titulo: 'Recicle 5 garrafas',
                        descricao: 'Leve 5 garrafas PET ao ponto de coleta.',
                        icon: 'assets/icons/recycle.png',
                        quantidadeAtual: 2,
                        quantidadeTotal: 5,
                        nivelDificuldade: 'Fácil',
                        experience: 100.00,
      points: 10.00
                      ),
                    ],
                  ),
                  ProfileWindow(profile: perfil)
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

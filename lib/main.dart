import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_notes/screens/home_screen.dart';
import 'package:smart_notes/screens/login_screen.dart';
import 'package:smart_notes/screens/note_screen.dart';
import 'package:smart_notes/screens/register_screen.dart';
import 'package:smart_notes/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginSceen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/note': (context) => NoteScreen()
      },
    );
  }
}

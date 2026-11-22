import 'package:flutter/material.dart';
import 'package:dsw60330/screens/home_screen.dart';
import 'package:dsw60330/screens/signinscreen.dart';
import 'package:dsw60330/services/auth_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final loggedIn = await AuthService.isLoggedIn();
  runApp(MyApp(loggedIn: loggedIn));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.loggedIn, super.key});

  final bool loggedIn;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loggedIn ? const HomeScreen() : const SignInScreen(),
    );
  }
}
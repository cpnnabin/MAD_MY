import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/button_gallery_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/details_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/add_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Buttons & Navigation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
      ),
      // Define initial route
      initialRoute: '/',
      // Define named routes table
      routes: {
        '/': (context) => const LoginScreen(),
        '/buttons': (context) => const ButtonGalleryScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/details': (context) => const DetailsScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/add': (context) => const AddScreen(),
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}

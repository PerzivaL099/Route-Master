// lib/screens/auth_wrapper.dart

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:run_app/services/auth_service.dart';
import 'package:run_app/screens/login_register_screen.dart';
import 'package:run_app/screens/home_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;

          // If the user is NOT logged in, show the authentication screens
          if (user == null) {
            return const LoginRegisterScreen();
          } 
          
          // If the user IS logged in, show the main application screen
          return const HomeScreen();
        }

        // Show a loading indicator while checking the connection state
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
// lib/screens/login_register_screen.dart

import 'package:flutter/material.dart';

class LoginRegisterScreen extends StatelessWidget {
  const LoginRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBar(title: Text('Welcome! Sign In / Register')),
      body: Center(
        child: Text('This is the Login/Register Screen', textAlign: TextAlign.center),
      ),
    );
  }
}
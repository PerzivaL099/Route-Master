// lib/main.dart

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:run_app/screens/auth_wrapper.dart'; // Import AuthWrapper

void main() async {
  // 1. Initialize Flutter Bindings
  WidgetsFlutterBinding.ensureInitialized(); 

  // 2. Initialize Firebase Core
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  // 3. Run the application
  runApp(const RunningTrackerApp());
}

// Renamed from MyApp to RunningTrackerApp
class RunningTrackerApp extends StatelessWidget {
  const RunningTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Running Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
          secondary: Colors.redAccent, 
          background: Colors.grey.shade50,
        ),
        useMaterial3: true,
      ),
      // AuthWrapper handles routing based on login status
      home: const AuthWrapper(), 
    );
  }
}
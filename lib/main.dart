// lib/main.dart

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // <--- 1. Import added
import 'firebase_options.dart';
import 'package:run_app/screens/auth_wrapper.dart'; 

void main() async {
  // 1. Initialize Flutter Bindings
  WidgetsFlutterBinding.ensureInitialized(); 

  // 2. Load Environment Variables (Added this step)
  await dotenv.load(fileName: ".env");

  // 3. Initialize Firebase Core
  // Now this will successfully read the keys from the loaded .env file
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  // 4. Run the application
  runApp(const RunningTrackerApp());
}

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
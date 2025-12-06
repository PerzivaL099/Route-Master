// lib/services/auth_service.dart

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Instance of Firebase Auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Stream to listen for real-time changes in user sign-in status
  // The StreamBuilder in AuthWrapper uses this to decide whether to show Login or Home.
  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  // ----------------------------------------------------
  // 1. Sign in with Email and Password
  // ----------------------------------------------------
  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      // You can implement better error handling here (e.g., showing a dialog)
      print('Sign In Error: ${e.code}');
      return null;
    }
  }

  // ----------------------------------------------------
  // 2. Register with Email and Password
  // ----------------------------------------------------
  Future<User?> registerWithEmailPassword(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Optional: You could add code here to save the new user's profile to Firestore
      return result.user;
    } on FirebaseAuthException catch (e) {
      // Handle common registration errors like 'email-already-in-use'
      print('Registration Error: ${e.code}');
      return null;
    }
  }

  // ----------------------------------------------------
  // 3. Sign Out
  // ----------------------------------------------------
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
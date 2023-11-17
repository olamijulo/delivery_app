import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GithubAuthService {
  static GithubAuthService? _instance;

  GithubAuthService._internal() {
    debugPrint('GithubAuthService called');
    _instance = this;
  }

  factory GithubAuthService() => _instance ?? GithubAuthService._internal();

Future<UserCredential> signInWithGitHub() async {
  // Create a new provider
  GithubAuthProvider githubProvider = GithubAuthProvider();

  return await FirebaseAuth.instance.signInWithProvider(githubProvider);
}

}

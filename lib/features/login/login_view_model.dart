// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:delivery_app/features/order_details/order_details_screen.dart';
import 'package:delivery_app/services/github_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

import 'package:delivery_app/features/login/login_state.dart';
import 'package:delivery_app/services/google_auth_service.dart';

final loginProvider =
    StateNotifierProvider.autoDispose<LoginViewModel, LoginState>((ref) {
  return LoginViewModel(LoginState());
});

class LoginViewModel extends StateNotifier<LoginState> {
  final GoogleAuthService _googleAuthService = GoogleAuthService();
  final GithubAuthService _githubAuthService = GithubAuthService();

  UserCredential? user;

  LoginViewModel(LoginState state) : super(state);

  loginWithGoogle(context) async {
    state = state.copyWith(isLoading: true);
    try {
      user = await _googleAuthService.signInWithGoogle();
      state = state.copyWith(isLoading: false);
      state = state.copyWith(userName: user!.user!.displayName!);
      state = state.copyWith(profileImgUrl: user!.user!.photoURL!);

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetailsScreen(),
          ));
    } on Exception catch (e) {
      state = state.copyWith(isLoading: false);
      // TODO
    }
  }

  loginWithGithub(context) async {
    state = state.copyWith(isLoading: true);
    try {
      user = await _githubAuthService.signInWithGitHub();
      state = state.copyWith(isLoading: false);
      state = state.copyWith(userName: user!.user!.displayName!);
      state = state.copyWith(profileImgUrl: user!.user!.photoURL!);

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetailsScreen(),
          ));
    } on Exception catch (e) {
      state = state.copyWith(isLoading: false);
      // TODO
    }
  }
}

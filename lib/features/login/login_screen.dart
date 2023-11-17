// ignore_for_file: prefer_const_constructors

import 'package:delivery_app/features/login/login_view_model.dart';
import 'package:delivery_app/features/login/widgets/socials_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Visibility(
          visible: !ref.watch(loginProvider).isLoading!,
          replacement: Center(
              child: CircularProgressIndicator(
            color: Color(0xFFff4d4d),
          )),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Image.asset(
                  'assets/images/foodIcon.png',
                  scale: 7,
                ),
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  'Welcome',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(
                  height: 15.0,
                ),
                SocialLoginButton(
                  borderColor: Colors.black12,
                  iconUrl: 'assets/images/google-logo.jpg',
                  onPressed: () {
                    ref.read(loginProvider.notifier).loginWithGoogle(context);
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'OR',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                SocialLoginButton(
                  borderColor: Colors.black,
                  iconUrl: 'assets/images/github-logo.jpg',
                  onPressed: () {
                    ref.read(loginProvider.notifier).loginWithGithub(context);
                  },
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String? iconUrl;
  final VoidCallback onPressed;
  final Color? borderColor;
  const SocialLoginButton({
    super.key,
    this.iconUrl,
    this.borderColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.0,
      width: double.infinity,
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.0, color: borderColor!),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)))),
          onPressed: onPressed,
          child: Image.asset(
            iconUrl!,
            scale: 4,
          )),
    );
  }
}
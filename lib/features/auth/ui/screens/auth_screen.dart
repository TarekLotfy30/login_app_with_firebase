import 'package:flutter/material.dart';

import '../widgets/auth_view_body.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: AuthViewBody()),
    );
  }
}

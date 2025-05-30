import 'package:flutter/material.dart';

import '../../../core/core.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Authentication',
          style: TextStyle(
            color: ColorResources.primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: ColorResources.bgColor,
        elevation: 0,
      ),
      backgroundColor: ColorResources.bgColor,
    );
  }
}

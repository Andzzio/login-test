import 'package:firebase_app/presentation/providers/auth_provider_app.dart';
import 'package:firebase_app/presentation/widgets/register/register_form.dart';
import 'package:firebase_app/presentation/widgets/register/register_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static const String routeName = "register";

  @override
  Widget build(BuildContext context) {
    final AuthProviderApp authProvider = context.watch<AuthProviderApp>();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegisterHeader(),
              SizedBox(height: 20),
              RegisterForm(authProvider: authProvider),
            ],
          ),
        ),
      ),
    );
  }
}

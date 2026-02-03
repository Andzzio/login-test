import 'package:firebase_app/presentation/widgets/login/lock_icon.dart';
import 'package:firebase_app/presentation/widgets/login/login_form.dart';
import 'package:firebase_app/presentation/providers/auth_provider_app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String routeName = "login";
  @override
  Widget build(BuildContext context) {
    final AuthProviderApp authProvider = context.watch<AuthProviderApp>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Center(child: LockIcon()),
              SizedBox(height: 20),
              Text(
                "Sign In",
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 5),
              Text(
                "Enter your details to continue",
                style: TextStyle(color: Color(0xFF6F7684)),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: LoginForm(authProvider: authProvider),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      context.push("/register");
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Color(0xFF2584EC)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

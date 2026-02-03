import 'package:firebase_app/presentation/providers/auth_provider_app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = "home";
  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProviderApp>();
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => Stack(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.all(30),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFEFF6FF),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Welcome!",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text("We're glad to see you here again."),
                        SizedBox(height: 200),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 30,
                left: 30,
                bottom: 50,
                child: ElevatedButton(
                  onPressed: authProvider.isLoading
                      ? null
                      : () async {
                          await authProvider.logout();
                          if (!context.mounted) return;
                          context.go("/login");
                        },

                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue),
                    foregroundColor: WidgetStatePropertyAll<Color>(
                      Colors.white,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(15),
                    child: authProvider.isLoading
                        ? CircularProgressIndicator()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.logout),
                              SizedBox(width: 10),
                              Text("Sign Out"),
                            ],
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_app/presentation/providers/auth_provider_app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  final AuthProviderApp authProvider;

  const LoginForm({super.key, required this.authProvider});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        width: size.width > 600 ? 400 : size.width * 0.9,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  if (!value.contains("@")) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "name@example.com",
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                  prefixIcon: Icon(Icons.email, color: Color(0xFF9CA3AF)),
                  prefixIconConstraints: BoxConstraints(minWidth: 60),
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xFFE2E6EA), width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 228, 74, 74),
                      width: 2,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 228, 74, 74),
                      width: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text("Password", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  if (value.length < 8) {
                    return "Password must be at least 8 characters long";
                  }
                  return null;
                },
                obscureText: widget.authProvider.isObscure,
                decoration: InputDecoration(
                  hintText: "Password",
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF9CA3AF)),
                  prefixIconConstraints: BoxConstraints(minWidth: 60),
                  suffixIcon: IconButton(
                    onPressed: () {
                      widget.authProvider.toggleObscure();
                    },
                    icon: Icon(
                      widget.authProvider.isObscure
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Color(0xFF9CA3AF),
                    ),
                  ),
                  suffixIconConstraints: BoxConstraints(minWidth: 60),
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xFFE2E6EA), width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 228, 74, 74),
                      width: 2,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 228, 74, 74),
                      width: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Color(0xFF2584EC),
                  ),
                  child: Text("Forgot your password?"),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: widget.authProvider.isLoading
                      ? null
                      : () async {
                          if (_formKey.currentState!.validate()) {
                            final success = await widget.authProvider.login(
                              _emailController.text.trim(),
                              _passwordController.text,
                            );

                            if (!mounted) {
                              return;
                            }

                            if (success) {
                              // ignore: use_build_context_synchronously
                              context.go("/home");
                            } else {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    widget.authProvider.errorMsg ??
                                        "Login Failed",
                                  ),
                                  backgroundColor: Colors.redAccent,
                                ),
                              );
                            }
                          }
                        },
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 25),
                    ),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    backgroundColor: WidgetStatePropertyAll(Color(0xFF2584EC)),
                  ),
                  child: widget.authProvider.isLoading
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Text("Sign In"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

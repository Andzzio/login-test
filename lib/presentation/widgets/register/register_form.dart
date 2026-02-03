import 'package:firebase_app/presentation/providers/auth_provider_app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterForm extends StatefulWidget {
  final AuthProviderApp authProvider;
  const RegisterForm({super.key, required this.authProvider});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
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
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your full name";
                  }
                  return null;
                },
                controller: _fullNameController,
                decoration: InputDecoration(
                  hintText: "Full Name",
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                  prefixIcon: Icon(Icons.person, color: Color(0xFF9CA3AF)),
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
              TextFormField(
                validator: (value) {
                  final emailRegex = RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  );
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  if (!emailRegex.hasMatch(value)) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Email",
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
              SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  if (value.length < 8) {
                    return "Password must be at least 8 characters long";
                  }
                  if (value != _passwordController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
                obscureText: widget.authProvider.isObscureConfirm,
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF9CA3AF)),
                  prefixIconConstraints: BoxConstraints(minWidth: 60),
                  suffixIcon: IconButton(
                    onPressed: () {
                      widget.authProvider.toggleObscureConfirm();
                    },
                    icon: Icon(
                      widget.authProvider.isObscureConfirm
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
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: widget.authProvider.isLoading
                      ? null
                      : () async {
                          if (_formKey.currentState!.validate()) {
                            debugPrint(
                              "fullName: ${_fullNameController.text.trim()}",
                            );
                            final bool success = await widget.authProvider
                                .register(
                                  _fullNameController.text.trim(),
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
                                        "Register Failed",
                                  ),
                                  backgroundColor: Colors.redAccent,
                                ),
                              );
                            }
                          }
                        },
                  style: ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll<Color>(
                      Colors.white,
                    ),
                    backgroundColor: WidgetStatePropertyAll<Color>(
                      Color(0xFF2584EC),
                    ),
                    padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(vertical: 25),
                    ),
                    shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  child: widget.authProvider.isLoading
                      ? CircularProgressIndicator()
                      : Text("Sign Up"),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      "Sign in",
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

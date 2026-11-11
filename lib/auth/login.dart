import 'package:flutter/material.dart';
import 'package:social_media_clone/socialmedia.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errormessage = '';

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool checkLogin(String username, String password) {
    if (username.trim().isEmpty) {
      errormessage = 'Please input your username';
      return false;
    }
    if (password.trim().isEmpty) {
      errormessage = 'Please input your password';
      return false;
    }
    errormessage = '';
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F0FF),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/logo.png', height: 72, width: 72),
                  const SizedBox(height: 8),
                  Text('TIKTOKTOK', style: txtstyle),
                  const SizedBox(height: 28),
                  TextField(
                    controller: usernameController,
                    decoration: loginInputDecoration(
                      hintText: 'Username',
                      icon: Icons.person,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: loginInputDecoration(
                      hintText: 'Enter Password',
                      icon: Icons.lock,
                    ),
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    height: 46,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF087CF5),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        if (checkLogin(
                          usernameController.text,
                          passwordController.text,
                        )) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Socialmedia(),
                            ),
                          );
                        }
                      },
                      child: const Text('LOGIN', style: txtstyle2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const txtstyle = TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 1,
  fontSize: 24,
);

const errortxtstyle = TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 1,
  fontSize: 14,
  color: Colors.red,
);

const txtstyle2 = TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 1,
  fontSize: 14,
  color: Colors.white,
);

InputDecoration loginInputDecoration({
  required String hintText,
  required IconData icon,
}) {
  return InputDecoration(
    hintText: hintText,
    prefixIcon: Icon(icon, size: 18),
    filled: true,
    fillColor: Colors.white.withValues(alpha: 0.75),
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFFB8B8C2)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFFB8B8C2)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFF087CF5), width: 1.5),
    ),
  );
}

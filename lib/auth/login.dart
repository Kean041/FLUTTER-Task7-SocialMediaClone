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
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.png', height: 48, width: 48),
                  const SizedBox(width: 12),
                  Text('TIKTOKTOK', style: txtstyle),
                ],
              ),
              const SizedBox(height: 15),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Username',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Password',
                  prefixIcon: Icon(Icons.password),
                ),
              ),
              const SizedBox(height: 15),
              const SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.blue,
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
                child: Text('LOGIN', style: txtstyle2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const txtstyle = TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontSize: 38,
);

const registertxtstyle = TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontSize: 14,
);

const errortxtstyle = TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 1,
  fontSize: 14,
  color: Colors.red,
);

const txtstyle2 = TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontSize: 24,
  color: Colors.white,
);

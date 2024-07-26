import 'package:flutter/material.dart';
import 'signup_page.dart'; // Import signup_page.dart

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    final username = _usernameController.text;
    final password = _passwordController.text;

    // Find the user based on the username and password
    final user = SignupPage.users.firstWhere(
      (user) => user['username'] == username && user['password'] == password,
      orElse: () => {}, // Return an empty map if no user is found
    );

    if (user.isNotEmpty) {
      // Navigate to the DashboardPage if the user is found
      Navigator.pushReplacementNamed(
        context,
        '/',
      );
    } else {
      // Show an error message if no user is found
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid username or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Icon(Icons.handshake, size: 80),
              const SizedBox(height: 40),
              Text(
                'EnviroSense',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.blue[900],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Login to your account',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Username',
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Password',
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.blue[700],
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    minimumSize: const Size(270, 50),
                  ),
                  onPressed: _login,
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
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

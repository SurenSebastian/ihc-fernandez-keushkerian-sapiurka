import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class LoginAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'E-vnt Account',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Your Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Your Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Implement Forgot Password
                },
                child: Text('Forgot password?', style: TextStyle(color: Colors.white)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    text: 'Cancel',
                    color: Colors.white,
                    textColor: Colors.orange,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  CustomButton(
                    text: 'Log in',
                    color: Colors.brown,
                    textColor: Colors.white,
                    onPressed: () {
                      // Implement Login
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              CustomButton(
                text: 'Login with Facebook',
                icon: Icons.facebook,
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  // Implement Facebook login
                },
              ),
              SizedBox(height: 10),
              CustomButton(
                text: 'Sign in with Google',
                icon: Icons.g_mobiledata,
                color: Colors.white,
                textColor: Colors.orange,
                onPressed: () {
                  // Implement Google login
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';
import '../widgets/custom_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

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
              Image.asset('images/evnt_logo.png'), // Make sure to add the image to your assets
              const SizedBox(height: 20),
              CustomButton(
                text: 'Log in',
                color: Colors.white,
                textColor: Colors.orange,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginAccountScreen()),
                  );
                },
              ),
              const SizedBox(height: 10),
              CustomButton(
                text: 'Sign up with Google',
                icon: Icons.g_mobiledata,
                color: Colors.white,
                textColor: Colors.orange,
                onPressed: () async {
                  User? user = await signUpWithGoogle();
                  if (user != null) {
                    // Navigate to the next screen or show a success message
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Successfully signed up with Google')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Failed to sign up with Google')),
                    );
                  }
                },
              ),
              const SizedBox(height: 10),
              CustomButton(
                text: 'Sign up with Facebook',
                icon: Icons.facebook,
                color: Colors.white,
                textColor: Colors.orange,
                onPressed: () {
                  // Implement Facebook sign in
                },
              ),
              const SizedBox(height: 10),
              const Text('or', style: TextStyle(color: Colors.white)),
              const SizedBox(height: 10),
              CustomButton(
                text: 'Create a new account',
                color: Colors.black,
                textColor: Colors.white,
                onPressed: () {
                  // Implement Create a new account
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<User?> signUpWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  if (googleUser != null) {
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    return userCredential.user;
  }
  return null;
}

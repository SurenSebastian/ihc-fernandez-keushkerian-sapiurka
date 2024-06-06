import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';
import '../widgets/custom_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'event_screen.dart';
import '../widgets/google_signin_button.dart';


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
              Image.asset('images/evnt_logo.png'), // Ensure the image is added to your assets
              const SizedBox(height: 20),
              GoogleSignInButton(
                onPressed: () async {
                  User? user = await signInWithGoogle();
                  if (user != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EventScreen()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Successfully signed in with Google')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Failed to sign in with Google')),
                    );
                  }
                },
              ),
              const SizedBox(height: 10),
              CustomButton(
                text: 'Sign in with Facebook',
                icon: Icons.facebook,
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  // Implement Facebook sign-in
                },
              ),
              const SizedBox(height: 20),
              Divider(
                color: Colors.white,
                thickness: 1,
              ),
              const SizedBox(height: 10),
              CustomButton(
                text: 'Log in Evnt Account',
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
                text: 'Create Evnt Account',
                color: Colors.white,
                textColor: Colors.orange,
                onPressed: () {
                  // Navigate to the Create Account screen
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}



Future<User?> signInWithGoogle() async {
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

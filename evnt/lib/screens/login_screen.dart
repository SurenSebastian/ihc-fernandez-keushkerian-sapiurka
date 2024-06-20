import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt/screens/menu_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import 'event_screen.dart';

class LoginAccountScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    Future<bool> _emailExists(String email) async {
      QuerySnapshot snapshot = await _firestore
          .collection('userdata')
          .where('email', isEqualTo: email)
          .get();
      return snapshot.docs.isNotEmpty;
    }

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
                controller: emailController,
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
                controller: passwordController,
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
                child: Text('Forgot password?',
                    style: TextStyle(color: Colors.white)),
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
                    text: 'Login',
                    color: Colors.white,
                    textColor: Colors.orange,
                    onPressed: () async {
                      try {
                        UserCredential userCredential =
                            await _auth.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );

                        User? user = userCredential.user;
                        print('Signed in: ${user?.uid}');

                        bool emailExists =
                            await _emailExists(emailController.text);
                        if (!emailExists) {
                          await _firestore.collection('userdata').add({
                            'email': emailController.text,
                            'notifications': false,
                            'created': 0,
                            'attended': 0,
                            'frequency': 'Each time an event appears',
                            'location': 'No location',
                            'interests': [],
                          });
                        }

                        emailController.clear();
                        passwordController.clear();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MenuScreen()),
                        );
                      } catch (e) {
                        print("Login error: $e");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Email or password not valid. Please try again.'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
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

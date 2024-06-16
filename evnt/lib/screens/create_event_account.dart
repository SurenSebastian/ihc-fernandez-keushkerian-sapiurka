import 'package:evnt/screens/menu_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/input_field.dart';
import '../widgets/action_button.dart';
import '../widgets/date_dropdown.dart';
import '../widgets/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'event_screen.dart';

class CreateEventAccount extends StatefulWidget {
  @override
  _CreateEventAccount createState() => _CreateEventAccount();
}

class _CreateEventAccount extends State<CreateEventAccount> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController cellPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;
  List<String> days = List<String>.generate(31, (index) => (index + 1).toString());
  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  List<String> years = List<String>.generate(100, (index) => (DateTime.now().year - index).toString());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Setup your account'),
          backgroundColor: const Color.fromARGB(255, 255, 106, 0),
          centerTitle: true,
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 35)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InputField(hintText: "Your First Name", controller: firstNameController),
                SizedBox(height: 8),
                InputField(hintText: "Your Last Name", controller: lastNameController),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: DateDropdown(
                        items: days,
                        currentValue: selectedDay,
                        onChanged: (newValue) {
                          setState(() {
                            selectedDay = newValue;
                          });
                        },
                        hint: 'Day',
                      ),
                    ),
                    Expanded(
                      child: DateDropdown(
                        items: months,
                        currentValue: selectedMonth,
                        onChanged: (newValue) {
                          setState(() {
                            selectedMonth = newValue;
                          });
                        },
                        hint: 'Month',
                      ),
                    ),
                    Expanded(
                      child: DateDropdown(
                        items: years,
                        currentValue: selectedYear,
                        onChanged: (newValue) {
                          setState(() {
                            selectedYear = newValue;
                          });
                        },
                        hint: 'Year',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                InputField(hintText: "Your Email", controller: emailController),
                SizedBox(height: 8),
                InputField(hintText: "Your Password", controller: passwordController, obscureText: true),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      text: "Cancel",
                      color: Colors.white,
                      textColor: Colors.orange,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    CustomButton(
                      text: "Join",
                      color: Colors.orange,
                      textColor: Colors.white,
                      onPressed: () async {
                        String firstName = firstNameController.text;
                        String lastName = lastNameController.text;
                        String email = emailController.text;
                        String password = passwordController.text;
                        String birthDate = "$selectedDay $selectedMonth $selectedYear";

                        // Si algun campo es nulo, mostrar un snackbar
                        if (firstName.isEmpty ||
                            lastName.isEmpty ||
                            email.isEmpty ||
                            password.isEmpty ||
                            selectedDay == null ||
                            selectedMonth == null ||
                            selectedYear == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Some fileds are missing.'),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }
                        try {
                          UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
                            email: email,
                            password: password,
                          );

                          // Se creo el usuario correctamente
                          User? newUser = userCredential.user;

                          // Se guarda informacion en firestore
                          _firestore.collection('users').doc(newUser?.uid).set({
                            'firstName': firstName,
                            'lastName': lastName,
                            'email': email,
                            'birthDate': birthDate,
                          }).then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('User Created.'),
                                backgroundColor: Colors.green,
                              ),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MenuScreen()),
                            );
                          }).catchError((error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Failed to save user data.'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          });
                        } catch (error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Error creating user. $error'),
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
      ),
    );
  }
}

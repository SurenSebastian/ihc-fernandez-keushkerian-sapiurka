import 'package:flutter/material.dart';
import '../widgets/input_field.dart';
import '../widgets/action_button.dart';
import '../widgets/date_dropdown.dart';
import '../widgets/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



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
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
  ];
  List<String> years = List<String>.generate(100, (index) => (DateTime.now().year - index).toString());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setup Your Account"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.orange,
        ),
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
                          setState(() { selectedDay = newValue; });
                        },
                        hint: 'Day',
                      ),
                    ),
                    Expanded(
                      child: DateDropdown(
                        items: months,
                        currentValue: selectedMonth,
                        onChanged: (newValue) {
                          setState(() { selectedMonth = newValue; });
                        },
                        hint: 'Month',
                      ),
                    ),
                    Expanded(
                      child: DateDropdown(
                        items: years,
                        currentValue: selectedYear,
                        onChanged: (newValue) {
                          setState(() { selectedYear = newValue; });
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
                      onPressed: () {
                        String firstName = firstNameController.text;
                        String lastName = lastNameController.text;
                        String email = emailController.text;
                        String password = passwordController.text;
                        String birthDate = "$selectedDay $selectedMonth $selectedYear";

                        _firestore.collection('users').add({
                          'firstName': firstName,
                          'lastName': lastName,
                          'email': email,
                          'password': password,
                          'birthDate': birthDate,
                        }).then((value) {
                          print("User Added");
                        }).catchError((error) {
                          print("Failed to add user: $error");
                        });

                        
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
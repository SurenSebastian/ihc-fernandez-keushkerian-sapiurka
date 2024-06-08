import 'package:flutter/material.dart';


class EventAccount extends StatelessWidget {
  const EventAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
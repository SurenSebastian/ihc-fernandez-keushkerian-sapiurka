import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final IconData icon;
  final String label;

  MenuButton({required this.icon, required this.label});

  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Color.fromARGB(255, 255,106, 0), backgroundColor: Colors.white,
        shadowColor: Colors.black54,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color:Color.fromARGB(255, 255,106, 0),
            size: 50,
          ),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              color:  Color.fromARGB(255, 255,106, 0),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
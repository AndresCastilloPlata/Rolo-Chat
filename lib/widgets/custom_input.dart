import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 5)),
        ],
      ),
      child: TextField(
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        // obscureText: true,
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          prefixIcon: Icon(Icons.email_outlined),
          border: InputBorder.none,
          hintText: 'Email',
        ),
      ),
    );
  }
}

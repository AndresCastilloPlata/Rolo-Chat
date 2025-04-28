import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String title;
  const Logo({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Center(
        child: SizedBox(
          width: 170,
          child: Column(
            // spacing: 20,
            children: [
              Image.asset('assets/tag-logo.png'),
              Text(title, style: TextStyle(fontSize: 30)),
            ],
          ),
        ),
      ),
    );
  }
}

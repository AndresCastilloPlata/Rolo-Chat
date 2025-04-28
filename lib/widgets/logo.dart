import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

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
              Text('Messenger', style: TextStyle(fontSize: 30)),
            ],
          ),
        ),
      ),
    );
  }
}

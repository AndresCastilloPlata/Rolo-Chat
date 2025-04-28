import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final String textButton;
  final Function()? onPressed;

  const BotonAzul({super.key, required this.textButton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(2),
        backgroundColor: WidgetStateProperty.all(Colors.blue),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
      onPressed: onPressed,
      child: SizedBox(
        height: 55,
        width: double.infinity,
        child: Center(
          child: Text(
            textButton,
            style: TextStyle(color: Colors.white, fontSize: 19),
          ),
        ),
      ),
    );
  }
}

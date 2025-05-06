import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rolo_chat/services/auth_service.dart';

class BotonAzul extends StatefulWidget {
  final String textButton;
  final Function()? onPressed;

  const BotonAzul({super.key, required this.textButton, this.onPressed});

  @override
  State<BotonAzul> createState() => _BotonAzulState();
}

class _BotonAzulState extends State<BotonAzul> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return FilledButton.tonal(
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(2),
        backgroundColor:
            authService.autenticando
                ? WidgetStateProperty.all(Colors.grey)
                : WidgetStateProperty.all(Colors.blue),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
      onPressed: widget.onPressed,
      child: SizedBox(
        height: 55,
        width: double.infinity,
        child: Center(
          child: Text(
            widget.textButton,
            style: TextStyle(color: Colors.white, fontSize: 19),
          ),
        ),
      ),
    );
  }
}

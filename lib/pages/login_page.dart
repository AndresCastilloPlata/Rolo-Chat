import 'package:flutter/material.dart';
import 'package:rolo_chat/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // spacing: 30,
          children: [
            // Logo
            Logo(),

            // Form
            _Form(),

            // Labels
            Labels(),

            // Terminos y condiciones
            _Terminos(),
          ],
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 60),
      margin: EdgeInsets.only(top: 40),

      child: Column(
        // spacing: 20,
        children: [
          CustomInput(
            hintText: 'Email',
            icon: Icons.mail_outline,
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
            isPassword: false,
          ),
          CustomInput(
            hintText: 'Password',
            icon: Icons.lock_outline,
            keyboardType: TextInputType.visiblePassword,
            textController: passCtrl,
            isPassword: true,
          ),

          ElevatedButton(
            style: ButtonStyle(elevation: WidgetStateProperty.all(0)),

            onPressed: () {
              // Navigator.pushNamed(context, 'register');
              print(emailCtrl.text);
              print(passCtrl.text);
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}

class _Terminos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Text(
        'Términos y condiciones de uso',
        style: TextStyle(fontWeight: FontWeight.w200),
      ),
    );
  }
}

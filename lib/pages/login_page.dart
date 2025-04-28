import 'package:flutter/material.dart';
import 'package:rolo_chat/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.97,
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
          BotonAzul(
            textButton: 'Login',
            onPressed: () {
              print('Email:${emailCtrl.text}');
              print('Password:${passCtrl.text}');
            },
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

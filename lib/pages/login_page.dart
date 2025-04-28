import 'package:flutter/material.dart';

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
            _Logo(),

            // Form
            _Form(),

            // Labels
            _Labels(),

            // Terminos y condiciones
            _Terminos(),
          ],
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

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

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // spacing: 20,
      children: [
        TextField(),
        TextField(),
        SizedBox(height: 30),

        ElevatedButton(
          style: ButtonStyle(elevation: WidgetStateProperty.all(0)),

          onPressed: () {
            // Navigator.pushNamed(context, 'register');
          },
          child: const Text('Login'),
        ),
      ],
    );
  }
}

class _Labels extends StatelessWidget {
  const _Labels();

  @override
  Widget build(BuildContext context) {
    return Column(
      // spacing: 10,
      children: [
        Text(
          'No tienes cuenta?',
          style: TextStyle(
            color: Colors.black45,
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
        ),
        Text(
          'Crear nueva cuenta?',
          style: TextStyle(
            color: Colors.blue[600],
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
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

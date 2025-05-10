import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rolo_chat/helpers/mostral_alerta.dart';
import 'package:rolo_chat/services/services.dart';
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
                Logo(title: 'Messenger'),

                // Form
                _Form(),

                // Labels
                Labels(
                  routeName: 'register',
                  title: 'No tienes cuenta?',
                  subTitle: 'Crear una cuenta!',
                ),

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
    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);

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
            onPressed:
                authService.autenticando
                    ? null
                    : () async {
                      FocusScope.of(context).unfocus();
                      final loginOk = await authService.login(
                        emailCtrl.text.trim(),
                        passCtrl.text.trim(),
                      );

                      if (loginOk) {
                        // conetar socket server
                        socketService.connect();
                        // navegar otra pantalla
                        Navigator.pushReplacementNamed(context, 'usuarios');
                      } else {
                        mostrarAlerta(
                          context,
                          'Login incorrecto',
                          'Valide sus credenciales',
                        );
                      }
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

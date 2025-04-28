import 'package:flutter/material.dart';
import 'package:rolo_chat/pages/pages.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'usuarios': (_) => const UsuariosPage(),
  'chat': (_) => const ChatPage(),
  'login': (_) => const LoginPage(),
  'loading': (_) => const LoadingPage(),
  'register': (_) => const RegisterPage(),
};

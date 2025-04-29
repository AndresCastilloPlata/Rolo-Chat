import 'package:flutter/material.dart';
import 'package:rolo_chat/routes/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rolo Chat',
      initialRoute: 'usuarios',
      routes: appRoutes,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rolo_chat/routes/routes.dart';
import 'package:rolo_chat/services/auth_service.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthService())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rolo Chat',
        initialRoute: 'loading',
        routes: appRoutes,
      ),
    );
  }
}

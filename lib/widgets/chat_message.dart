import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rolo_chat/services/services.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final String uid;
  final AnimationController animationController;

  const ChatMessage({
    super.key,
    required this.message,
    required this.uid,
    required this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
          parent: animationController,
          curve: Curves.easeOut,
        ),
        child: Container(
          child:
              uid == authService.usuario!.uid ? _myMessage() : _otherMessage(),
        ),
      ),
    );
  }

  Widget _myMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(bottom: 5, left: 60, right: 10),
        decoration: BoxDecoration(
          color: Color(0xFF4D9EF6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(message, style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _otherMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(bottom: 5, left: 10, right: 60),
        decoration: BoxDecoration(
          color: Color(0xFFE4E5E8),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(message, style: TextStyle(color: Colors.black87)),
      ),
    );
  }
}

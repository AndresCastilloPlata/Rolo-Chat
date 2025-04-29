import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          spacing: 5,
          children: [
            CircleAvatar(
              maxRadius: 15,
              child: const Text('Te', style: TextStyle(fontSize: 12)),
            ),
            const Text(
              'Aquiles Va',
              style: TextStyle(color: Colors.black87, fontSize: 12),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (_, index) => Text('$index'),
                reverse: true,
              ),
            ),
            Divider(height: 1),

            //Todo: Caja de texto
            Container(color: Colors.white, child: _inputChat()),
          ],
        ),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),

        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: (String texto) {
                  //Todo: cuando hay un valor, para poder enviar el mensaje
                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Escribir mensaje',
                ),
                focusNode: _focusNode,
              ),
            ),
            //Boton de enviar
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child:
                  Platform.isIOS
                      ? CupertinoButton(child: Text('Enviar'), onPressed: () {})
                      : Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.send, color: Colors.blue[400]),
                        ),
                      ),
            ),
          ],
        ),
      ),
    );
  }

  _handleSubmit(String texto) {
    print(texto);
    _textController.clear();
    _focusNode.requestFocus();
  }
}

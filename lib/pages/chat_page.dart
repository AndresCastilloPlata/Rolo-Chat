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
  bool _isWriting = false;

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
                  setState(() {
                    if (texto.trim().length > 0) {
                      _isWriting = true;
                    } else {
                      _isWriting = false;
                    }
                  });
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
                      ? CupertinoButton(
                        child: Text('Enviar'),
                        onPressed: () {
                          _isWriting
                              ? () => _handleSubmit(_textController.text.trim())
                              : null;
                        },
                      )
                      : Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        child: IconTheme(
                          data: IconThemeData(color: Colors.blue[400]),
                          child: IconButton(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            icon: Icon(Icons.send),
                            onPressed:
                                _isWriting
                                    ? () => _handleSubmit(
                                      _textController.text.trim(),
                                    )
                                    : null,
                          ),
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

    setState(() {
      _isWriting = false;
    });
  }
}

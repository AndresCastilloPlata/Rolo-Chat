import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rolo_chat/models/mensajes_response.dart';
import 'package:rolo_chat/services/services.dart';
import 'package:rolo_chat/widgets/chat_message.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  ChatService? chatService;
  SocketService? socketService;
  AuthService? authService;

  final List<ChatMessage> _messages = [];

  bool _isWriting = false;

  @override
  void initState() {
    super.initState();
    chatService = Provider.of<ChatService>(context, listen: false);
    socketService = Provider.of<SocketService>(context, listen: false);
    authService = Provider.of<AuthService>(context, listen: false);

    socketService?.socket.on('mensaje-personal', _escucharMensaje);

    _cargarHistorial(chatService!.usuarioPara!.uid);
  }

  void _cargarHistorial(String usuarioID) async {
    List<Mensaje> chat = await chatService!.getChat(usuarioID);

    final history = chat.map(
      (e) => ChatMessage(
        message: e.mensaje,
        uid: e.de,
        animationController: AnimationController(
          vsync: this,
          duration: Duration(milliseconds: 0),
        )..forward(),
      ),
    );
    setState(() {
      _messages.insertAll(0, history);
    });
  }

  void _escucharMensaje(dynamic payload) {
    ChatMessage message = ChatMessage(
      message: payload['mensaje'],
      uid: payload['de'],
      animationController: AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300),
      ),
    );
    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final usuarioPara = chatService?.usuarioPara;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          spacing: 5,
          children: [
            CircleAvatar(
              maxRadius: 15,
              child: Text(
                usuarioPara!.nombre.substring(0, 2).toUpperCase(),
                style: TextStyle(fontSize: 12),
              ),
            ),
            Text(
              usuarioPara.nombre,
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
                itemCount: _messages.length,
                itemBuilder: (_, index) => _messages[index],
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
                    if (texto.trim().isNotEmpty) {
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
    if (texto.isEmpty) return;

    _textController.clear();
    _focusNode.requestFocus();

    final newMessage = ChatMessage(
      uid: authService!.usuario!.uid,
      message: texto,
      animationController: AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300),
      ),
    );
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();

    setState(() {
      _isWriting = false;
    });

    //enviar el socket
    socketService?.socket.emit('mensaje-personal', {
      'de': authService?.usuario!.uid,
      'para': chatService?.usuarioPara!.uid,
      'mensaje': texto,
    });
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    socketService?.socket.off('mensaje-personal');
    super.dispose();
  }
}

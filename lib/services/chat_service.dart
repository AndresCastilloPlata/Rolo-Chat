import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rolo_chat/global/environment.dart';
import 'package:rolo_chat/models/mensajes_response.dart';
import 'package:rolo_chat/models/usuario.dart';
import 'package:rolo_chat/services/services.dart';

class ChatService with ChangeNotifier {
  Usuario? usuarioPara;

  Future<List<Mensaje>> getChat(String usuarioID) async {
    final resp = await http.get(
      Uri.parse('${Environment.apiUrl}/mensajes/$usuarioID'),
      headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken() ?? '',
      },
    );

    final mensajeResp = mensajesResponseFromJson(resp.body);

    return mensajeResp.mensajes;
  }
}

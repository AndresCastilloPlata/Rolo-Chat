import 'package:http/http.dart' as http;
import 'package:rolo_chat/global/environment.dart';
import 'package:rolo_chat/models/usuario.dart';
import 'package:rolo_chat/models/usuarios_response.dart';
import 'package:rolo_chat/services/auth_service.dart';

class UsuariosService {
  Future<List<Usuario>> getUsuarios() async {
    try {
      final resp = await http.get(
        Uri.parse('${Environment.apiUrl}/usuarios'),
        headers: {
          'Content-Type': 'application/json',
          'x-token': await AuthService.getToken() ?? '',
        },
      );

      final usuariosResponse = usuarioResponseFromJson(resp.body);
      return usuariosResponse.usuarios;
    } catch (e) {
      return [];
    }
  }
}

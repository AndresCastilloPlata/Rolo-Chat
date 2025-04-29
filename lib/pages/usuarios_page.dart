import 'package:flutter/material.dart';
import 'package:rolo_chat/models/usuario.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({super.key});

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  final usuarios = [
    Usuario(uid: '1', nombre: 'Andres', email: 'test1@test.com', online: true),
    Usuario(uid: '2', nombre: 'Marina', email: 'test2@test.com', online: false),
    Usuario(uid: '3', nombre: 'Adan', email: 'test3@test.com', online: true),
    Usuario(uid: '4', nombre: 'Aquiles', email: 'test4@test.com', online: true),
    Usuario(uid: '5', nombre: 'Freia', email: 'test5@test.com', online: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Nombre'),
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: () {},
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Icon(Icons.check_circle_rounded),
            // child: Icon(Icons.offline_bolt_rounded),
          ),
        ],
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder:
            (_, index) => ListTile(
              title: Text(usuarios[index].nombre),
              leading: CircleAvatar(
                child: Text(usuarios[index].nombre.substring(0, 2)),
              ),
              trailing: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color:
                      usuarios[index].online
                          ? Colors.greenAccent[400]
                          : Colors.redAccent[700],
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
        separatorBuilder: (_, index) => const Divider(),
        itemCount: usuarios.length,
      ),
    );
  }
}

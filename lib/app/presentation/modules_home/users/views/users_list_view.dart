import 'package:flutter/material.dart';
import 'package:mi_app/app/domain/global_provider/session_provider.dart';
import 'package:provider/provider.dart';

import 'package:mi_app/app/domain/models/models.dart';
import 'package:mi_app/app/presentation/modules_home/users/bloc/bloc.dart';
import 'package:mi_app/app/presentation/modules_home/users/views/user_view.dart';
import 'package:mi_app/app/presentation/modules_home/users/widgets/card_listview.dart';
import 'package:mi_app/app/presentation/theme/app_theme.dart';
import 'package:mi_app/app/presentation/widgets/widgets.dart';

class UsersListView extends StatefulWidget {
  final String holding;
  const UsersListView({
    Key? key,
    required this.holding,
  }) : super(key: key);

  @override
  State<UsersListView> createState() => _UsersListViewState();
}

class _UsersListViewState extends State<UsersListView> {
  late String holding = widget.holding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: ChangeNotifierProvider(
        create: (_) => UserBloc(
          userRepository: context.read(),
        )..usuariosList(holding),
        builder: (context, _) {
          final UserBloc bloc = context.watch();
          SessionProvider sessionProvider = context.watch();
          Usuario? usuario = sessionProvider.usuario;
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Usuarios"),
            ),
            drawer: SideMenu(
              urlLogo: usuario!.urlLogo ??
                  'https://res.cloudinary.com/dmpdnoked/image/upload/v1684947001/foo4fd1ptdnn8i1mon5t.png',
            ),

            //Desplegar lista de usuarios
            body: bloc.state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              failed: (failure) => Center(child: Text(failure.name)),
              error: (errors) {
                final String msg = errors
                    .toString()
                    .replaceAll("body[", "\n")
                    .replaceAll("[", "")
                    .replaceAll("]", "");
                return Center(child: Text(msg));
              },
              loaded: (usuarios) => _listview(usuarios),
              loadedByHoldings: (_) => null,
            ),

            //Boton crear nuevo usuario
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () async {
                //Para acturlizar la lista de usuarios y no tener que
                //realizar una peticion http
                //Se recupera la lista y si no es null se actualiza
                List<Usuario> usuarios = bloc.usuarios;
                List<Holding> holdings = bloc.holdings;

                Usuario user = Usuario(
                  uuid: '',
                  rut: '',
                  nombre: '',
                  correo: '',
                  password: '',
                  rol: '',
                  estado: true,
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                  imageUrl: '',
                );
                final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserView(
                              usuario: user,
                              holdings: holdings,
                            )));

                //Si no es null se agrega el nuevo usuario a la lista
                if (result != null) {
                  usuarios.add(result);
                }
                setState(() {});
              },
            ),
          );
        },
      ),
    );
  }

  ListView _listview(List<Usuario> usuarios) {
    return ListView.builder(
        itemCount: usuarios.length,
        itemBuilder: (BuildContext context, index) {
          Usuario user = usuarios[index];
          return GestureDetector(
            onTap: () async {
              //Con push no es necesario crar una ruta se llama directamente
              //ademas pasamos el usuario como parametro a la segunda pagina
              //y en la segunda agina si utilizamos provider para el formulario

              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserView(
                            usuario: user,
                            holdings: const [],
                          )));
              setState(() {});
            },
            child: CardListView(
              usuario: user,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 0),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor: const Color(0xffd1e299),
                        child: Container(
                          // width: MediaQuery.of(context).size.width * 0.9,
                          padding: const EdgeInsets.only(bottom: 0.0),
                          child: _nombre(user),
                        ),
                      ),
                    ),
                    // const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.nombre,
                          style: const TextStyle(fontSize: 15),
                        ),
                        Text(
                          user.correo,
                          style: const TextStyle(fontWeight: FontWeight.w300),
                        ),
                        Text(
                          user.rut,
                          style: const TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
    // ListView.builder(
    //   itemBuilder: (_, index) {
    //     final user = usuario[index];
    //     return ListTile(
    //       title: Text(user.nombre),
    //     );
    //   },
    //   itemCount: usuario.length,
    // );
  }

  Widget _nombre(Usuario usuario) {
    if (usuario.imageUrl == null || usuario.imageUrl == '') {
      //Recupera datos del usuario de provider y
      //realiza un split para obtener el primer caracter del
      //nombre y el apellido
      final displayName = usuario.nombre;
      final List<String> listName = displayName.split(' ');
      final String letter;
      if (listName[0].isNotEmpty) {
        if (listName.length > 3) {
          letter = listName[0][0] + listName[2][0];
        } else if (listName.length > 1) {
          letter = listName[0][0] + listName[1][0];
        } else {
          letter = listName[0][0];
        }
      } else {
        letter = "";
      }

      return Text(letter,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 18,
            // fontWeight: FontWeight.bold,
          ));
    }

    return ClipOval(
      child: Image.network(
        usuario.imageUrl!,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return const CircularProgressIndicator(
            color: Apptheme.primary,
          );
        },
        width: 60,
        height: 60,
        fit: BoxFit.cover,
      ),
    );
  }
}

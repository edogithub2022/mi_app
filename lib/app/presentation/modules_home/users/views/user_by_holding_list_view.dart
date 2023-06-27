import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mi_app/app/domain/global_provider/session_provider.dart';
import 'package:mi_app/app/domain/models/login/usuario_by_holding.dart';
import 'package:mi_app/app/domain/models/models.dart';
import 'package:mi_app/app/presentation/helpers/preferences.dart';
import 'package:mi_app/app/presentation/modules_home/users/bloc/bloc.dart';
import 'package:mi_app/app/presentation/modules_home/users/views/users_list_view.dart';
import 'package:mi_app/app/presentation/widgets/widgets.dart';
import 'package:provider/provider.dart';

class UserByHoldingView extends StatelessWidget {
  const UserByHoldingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ChangeNotifierProvider(
          create: (_) => UserBloc(
            userRepository: context.read(),
          )..init(),
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
              //Desplegar lista de ordenCompraTotales
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
                loaded: (_) => null,
                loadedByHoldings: (usuariosByHolding) => _Listview(
                  bloc: bloc,
                  usuarioByHolding: usuariosByHolding,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Listview extends StatelessWidget {
  final List<UsuarioByHolding> usuarioByHolding;
  final UserBloc bloc;

  const _Listview({
    required this.bloc,
    required this.usuarioByHolding,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: usuarioByHolding.isNotEmpty ? usuarioByHolding.length : 0,
      itemBuilder: (BuildContext context, index) {
        var item = usuarioByHolding[index];
        // OrdenCompraTotales ordenCompraTotal = ordenCompraTotales[index];
        return GestureDetector(
          onTap: () async {
            // final result =
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UsersListView(
                  holding: item.holding,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: _cardBorders(),
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        item.holding,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    // const SizedBox(width: 15),
                    Stack(children: [
                      const Icon(
                        Icons.notifications_none_outlined,
                        color: Colors.black45,
                        size: 35,
                      ),
                      Positioned(
                        top: 0.0,
                        right: 0.0,
                        child: Container(
                          alignment: Alignment.center,
                          width: 24,
                          height: 24,
                          decoration: const BoxDecoration(
                            color: Colors.redAccent,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            NumberFormat('#,##0').format(item.total),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                        ),
                      )
                    ]),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  BoxDecoration _cardBorders() {
    return BoxDecoration(
      color: Preferences.isDarkmode ? Colors.black12 : Colors.white,
      borderRadius: const BorderRadius.only(
        // bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
        topLeft: Radius.circular(15),
        // topRight: Radius.circular(15),
      ),
      boxShadow: [
        BoxShadow(
          color: Preferences.isDarkmode
              ? Colors.white12
              : const Color.fromRGBO(209, 196, 233, 1),
          offset: const Offset(0, 6),
          blurRadius: 4,
        )
      ],
    );
  }
}

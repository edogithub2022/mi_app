import 'package:flutter/material.dart';
import 'package:mi_app/app/domain/models/models.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:mi_app/app/domain/global_provider/session_provider.dart';
import 'package:mi_app/app/presentation/helpers/notifications_helper.dart';
import 'package:mi_app/app/presentation/helpers/preferences.dart';
import 'package:mi_app/app/presentation/helpers/regext_string.dart';
import 'package:mi_app/app/presentation/helpers/tipo_input.dart';
import 'package:mi_app/app/presentation/modules_home/singup/bloc/bloc.dart';
import 'package:mi_app/app/presentation/modules_home/users/bloc/bloc.dart';
import 'package:mi_app/app/presentation/theme/app_theme.dart';
import 'package:mi_app/app/presentation/modules_home/users/widgets/show_input_dialog_user.dart';
import 'package:mi_app/app/presentation/widgets/widgets.dart';

class UserView extends StatelessWidget {
  final Usuario? usuario;
  final List<Holding> holdings;
  const UserView({
    Key? key,
    this.usuario,
    required this.holdings,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SessionProvider sessionProvider = context.watch();
    Usuario? user = sessionProvider.usuario;

    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => UserBloc(
          userRepository: context.read(),
        ),
        child: _ListView(
          usuario: usuario ?? user!,
          desde: usuario == null ? "perfil" : "",
          holdings: holdings,
        ),
      ),
    );
  }
}

class _ListView extends StatelessWidget {
  final Usuario usuario;
  final String desde;
  final List<Holding> holdings;

  const _ListView({
    required this.usuario,
    required this.desde,
    required this.holdings,
  });
  @override
  Widget build(BuildContext context) {
    final UserBloc bloc = context.watch();
    //.copy para romper la referencia y no afecte hasta que persista en la bd
    bloc.selectedUser = usuario.copy();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ListView(
        children: [
          const SizedBox(height: 10),

          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              //Flecha para ir a la pagina anterior
              Positioned(
                top: 10,
                left: 10,
                child: IconButton(
                  onPressed: () {
                    if (desde == "perfil") {
                      Navigator.pushReplacementNamed(context, "home");
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                  // onPressed: () => Navigator.pop(context, usuario),
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    size: 30,
                    color: Preferences.isDarkmode
                        ? Colors.white70
                        : Colors.black45,
                  ),
                ),
              ),

              //Boton Camara
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  onPressed: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? foto =
                        await picker.pickImage(source: ImageSource.camera);
                    if (foto == null) {
                      return;
                    }

                    //Guardar path en provider
                    bloc.updateSelectedUserImage(foto.path);
                    //Si es un registro nuevo la foto se guardara al
                    //final en el boton guradar
                    if (bloc.selectedUser.uuid == '') {
                      return;
                    }

                    // ignore: use_build_context_synchronously
                    ProgressDialog.show(context);

                    //subir imagen a ClouDinary
                    await bloc.uploadImage();

                    await bloc.updateUsuario(
                      uuid: bloc.selectedUser.uuid,
                      nombre: bloc.selectedUser.nombre,
                      rut: bloc.selectedUser.rut,
                      correo: bloc.selectedUser.correo,
                      password: bloc.selectedUser.password,
                      rol: bloc.selectedUser.rol,
                      estado: bloc.selectedUser.estado,
                      imageUrl: bloc.selectedUser.imageUrl,
                      holding: bloc.selectedUser.holding,
                    );

                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);

                    final state = bloc.state;
                    state.when(
                      loading: () => '',
                      failed: (failure) =>
                          NotificationsHelper.showSnacbar(failure.name),
                      error: (errors) {
                        final String msg = errors
                            .toString()
                            .replaceAll("body[", "\n")
                            .replaceAll("[", "")
                            .replaceAll("]", "");
                        displayDialogIOS(context, msg);
                      },
                      loaded: (user) {
                        usuario.imageUrl = bloc.selectedUser.imageUrl;
                        NotificationsHelper.showSnacbar(
                            "Imagen actualizada!!!");
                      },
                      loadedByHoldings: (_) => null,
                    );
                  },
                  icon: Icon(
                    Icons.camera_alt_outlined,
                    size: 30,
                    color: Preferences.isDarkmode
                        ? Colors.white70
                        : Colors.black45,
                  ),
                ),
              ),

              //Cargar Imagen o Siglas del usuario
              Container(
                  child: getImage(
                      bloc.newPickerFile?.path ?? bloc.selectedUser.imageUrl)),
            ],
          ),

          //Datos del usuario
          usuario.uuid != ''
              ? _ModificaUser(usuario: usuario)
              : ChangeNotifierProvider(
                  create: (_) => SingUpBloc(
                    authenticationRepository: context.read(),
                  ),
                  child: _SingUpUser(
                    bloc.newPickerFile?.path,
                    holdings,
                  ),
                ),
        ],
      ),
    );
  }

  Widget getImage(String? picture) {
    if (picture == null || picture == '') {
      return CircleAvatar(
        backgroundColor: Apptheme.primary,
        radius: 75.0,
        child: _siglasImg(),
      );
    }

    if (picture.startsWith('http')) {
      return ClipOval(
        child: Image.network(
          usuario.imageUrl!,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return const Padding(
              padding: EdgeInsets.all(82.0),
              child: CircularProgressIndicator(
                color: Apptheme.primary,
              ),
            );
          },
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
      );
    }

    return CircleAvatar(
      backgroundColor: Apptheme.primary,
      backgroundImage: FileImage(File(picture)),
      radius: 75.0,
    );
  }

  Text _siglasImg() {
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
          fontSize: 40,
          // fontWeight: FontWeight.bold,
        ));
  }
}

class _LabelButton extends StatelessWidget {
  final String label, value;
  final VoidCallback? onPressed;
  const _LabelButton({
    required this.label,
    required this.value,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      leading: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 5),
          Icon(
            Icons.chevron_right_outlined,
            size: 25,
            color: getColorIconOnPressed(onPressed),
          ),
        ],
      ),
    );
  }

  Color getColorIconOnPressed(VoidCallback? onPressed) {
    if (onPressed == null) return Colors.transparent;

    if (Preferences.isDarkmode) return Colors.white;

    return Colors.black45;
  }
}

class _ModificaUser extends StatelessWidget {
  const _ModificaUser({
    required this.usuario,
  });

  final Usuario usuario;

  @override
  Widget build(BuildContext context) {
    SessionProvider sessionProvider = context.watch();
    final UserBloc bloc = context.watch();

    void updateDisplayInput(
      BuildContext context, {
      required String msgErr,
      final TipoInput? tipoInput,
      final String? title,
    }) async {
      final Usuario selectedUser = bloc.selectedUser;

      var value = await showInputDialogUser(
        context,
        tipoInput: tipoInput,
        title: title,
        selectedUser: selectedUser,
      );

      if (value == '') {
        bloc.state.mapOrNull(
          loading: (_) => displayDialogIOS(
            context,
            msgErr,
          ),
        );
        value = null;
      }

      if (value != null) {
        // ignore: use_build_context_synchronously
        ProgressDialog.show(context);

        switch (tipoInput) {
          case TipoInput.nombre:
            selectedUser.nombre = value;
            break;
          case TipoInput.rut:
            selectedUser.rut = value;
            break;
          case TipoInput.estado:
            selectedUser.estado = value == 'activo' ? true : false;
            break;
          case TipoInput.dropdownButtonFormField:
            selectedUser.rol = value;
            break;
          case TipoInput.password:
            selectedUser.password = value;
            break;
          default: // Without this, you see a WARNING.
        }

        await bloc.updateUsuario(
          uuid: selectedUser.uuid,
          nombre: selectedUser.nombre,
          rut: selectedUser.rut,
          correo: selectedUser.correo,
          password: selectedUser.password,
          rol: selectedUser.rol,
          estado: selectedUser.estado,
          imageUrl: selectedUser.imageUrl,
          holding: selectedUser.holding,
        );

        // ignore: use_build_context_synchronously
        Navigator.pop(context);

        final state = bloc.state;
        state.when(
            loading: () => '',
            failed: (failure) => NotificationsHelper.showSnacbar(failure.name),
            error: (errors) {
              final String msg = errors
                  .toString()
                  .replaceAll("body[", "\n")
                  .replaceAll("[", "")
                  .replaceAll("]", "");
              displayDialogIOS(context, msg);
            },
            loaded: (user) {
              String newValue = value ?? '';
              String msg = ' :  $newValue';
              switch (tipoInput) {
                case TipoInput.nombre:
                  msg = 'Nombre actualizado -> ${usuario.nombre} $msg';
                  usuario.nombre = newValue;
                  break;
                case TipoInput.rut:
                  msg = 'Rut actualizado -> ${usuario.rut} $msg';
                  usuario.rut = newValue;
                  break;
                case TipoInput.estado:
                  msg =
                      'Estado actualizado -> ${usuario.estado ? 'activo' : 'inactivo'} $msg';
                  usuario.estado = selectedUser.estado;
                  break;
                case TipoInput.dropdownButtonFormField:
                  msg = 'Rol actualizado -> ${usuario.rol} $msg';
                  usuario.rol = selectedUser.rol;
                  break;
                case TipoInput.password:
                  msg = 'Password Actualizada';
                  usuario.rol = selectedUser.rol;
                  break;
                default:
                  msg =
                      "Sin actualizaciones"; // Without this, you see a WARNING.
              }

              NotificationsHelper.showSnacbar(msg);
            },
            loadedByHoldings: (_) => null);
      }
    }

    return Column(
      children: [
        //Titulo
        const SizedBox(height: 10),
        Center(
          child: Text(
            usuario.nombre,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Center(child: Text(usuario.correo)),

        //Datos del Usuario
        const SizedBox(height: 20),
        _LabelButton(
          label: 'Nombre',
          value: usuario.nombre,
          onPressed: sessionProvider.access['usuarios'] ?? false
              ? () => updateDisplayInput(
                    context,
                    msgErr: 'Ingrese un nombre valido ej.:Nom Apell',
                    tipoInput: TipoInput.nombre,
                    title: "Ingrese nuevo valor para:",
                  )
              : null,
        ),
        _LabelButton(
          label: 'Correo',
          value: usuario.correo,
        ),
        _LabelButton(
          label: 'Rut',
          value: usuario.rut,
          onPressed: sessionProvider.access['usuarios'] ?? false
              ? () => updateDisplayInput(context,
                  msgErr: 'Ingrese un rut valido ej:11111111-1',
                  tipoInput: TipoInput.rut,
                  title: "Ingrese nuevo valor para:")
              : null,
        ),
        _LabelButton(
          label: 'Rol',
          value: usuario.rol,
          onPressed: sessionProvider.access['usuariosPlus'] ?? false
              ? () => updateDisplayInput(
                    context,
                    msgErr: 'Ingrese un Rol valido',
                    tipoInput: TipoInput.dropdownButtonFormField,
                    title: "Ingrese nuevo Rol:",
                  )
              : null,
        ),
        _LabelButton(
          label: 'Estado',
          value: usuario.estado ? 'Activo' : 'Inactivo',
          onPressed: sessionProvider.access['usuariosPlus'] ?? false
              ? () => updateDisplayInput(context,
                  msgErr: 'Error en estado',
                  tipoInput: TipoInput.estado,
                  title: "Seleccione Estado")
              : null,
        ),
        _LabelButton(
          label: 'Password',
          value: "******",
          onPressed: () => updateDisplayInput(
            context,
            msgErr: 'Password no coinciden',
            tipoInput: TipoInput.password,
            title: "Ingrese nueva password:",
          ),
        ),
      ],
    );
  }
}

class _SingUpUser extends StatelessWidget {
  final String? filePath;
  final List<Holding> holdings;
  const _SingUpUser(
    this.filePath,
    this.holdings,
  );

  @override
  Widget build(BuildContext context) {
    final singUpForm = Provider.of<SingUpBloc>(context);
    final SingUpBloc bloc = context.watch();
    // final List listHolding = ['Agrosoft', 'Margozzini'];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: singUpForm.formKey,
            child: Column(
              children: [
                CustomInputField(
                  textCapitalization: TextCapitalization.words,
                  labelText: "Nombre",
                  hintText: "Nombre del Usuario",
                  formProperty: 'nombre',
                  formValues: singUpForm.formValues,
                  validator: (val) {
                    if (!val.isValidName) {
                      return 'Ingrese un nombre valido ej.:Nom Apell';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                CustomInputField(
                  labelText: "Rut",
                  hintText: "Rut del Usuario 11111111-1",
                  formProperty: 'rut',
                  formValues: singUpForm.formValues,
                  validator: (val) {
                    if (!val.isRut) {
                      return 'Ingrese un rut valido ej:11111111-1';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                CustomInputField(
                  autocorrect: false,
                  labelText: "Correo",
                  hintText: "Correo del Usuario",
                  keyboardType: TextInputType.emailAddress,
                  formProperty: 'correo',
                  formValues: singUpForm.formValues,
                  validator: (val) {
                    if (val != null && !val.isValidEmail) {
                      return 'Ingrese un correo valido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                CustomInputField(
                  labelText: "Password",
                  hintText: "Password del Usuario",
                  obscureText: true,
                  suffixIcon: Icons.visibility,
                  formProperty: 'password',
                  formValues: singUpForm.formValues,
                  validator: (val) {
                    if (!val.isValidPassword) {
                      return 'De largo 6, entre May,Min  y un !@#><*~';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                CustomInputField(
                  labelText: "Verificación de Password",
                  hintText: "Verificación",
                  obscureText: true,
                  suffixIcon: Icons.visibility,
                  formProperty: 'vPassword',
                  formValues: singUpForm.formValues,
                  validator: (val) {
                    if (singUpForm.formValues['password'].toString() != val) {
                      return 'La contraseña no coincide';
                    }
                    if (!val.isValidPassword) {
                      return 'De largo 6, entre May,Min  y un !@#><*~';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField(
                  dropdownColor: Preferences.isDarkmode ? Colors.white : null,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  hint: Text(
                    "Seleccione un Rol de usuario",
                    style: Preferences.isDarkmode
                        ? const TextStyle(color: Colors.black)
                        : null,
                  ),
                  items: [
                    DropdownMenuItem(
                        value: 'SUPERADMIN_ROLE',
                        child: Text(
                          'SUPERADMIN_ROLE',
                          style: TextStyle(
                              color:
                                  Preferences.isDarkmode ? Colors.black : null),
                        )),
                    DropdownMenuItem(
                        value: 'ADMIN_ROLE',
                        child: Text(
                          'ADMIN_ROLE',
                          style: TextStyle(
                              color:
                                  Preferences.isDarkmode ? Colors.black : null),
                        )),
                    DropdownMenuItem(
                        value: 'USER_ROLE',
                        child: Text(
                          'USER_ROLE',
                          style: TextStyle(
                              color:
                                  Preferences.isDarkmode ? Colors.black : null),
                        )),
                    DropdownMenuItem(
                        value: 'GUEST_ROLE',
                        child: Text(
                          'GUEST_ROLE',
                          style: TextStyle(
                              color:
                                  Preferences.isDarkmode ? Colors.black : null),
                        )),
                  ],
                  onChanged: (value) {
                    singUpForm.formValues['rol'] = value ?? 'USER_ROLE';
                  },
                  validator: (value) {
                    if (!value.isNotNull) {
                      return 'Seleccione un Rol';
                    }
                    return null;
                  },
                ),

                //H O L D I N G
                const SizedBox(height: 10),
                DropdownButtonFormField(
                  dropdownColor: Preferences.isDarkmode ? Colors.white : null,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  hint: Text(
                    "Seleccione un Holding",
                    style: Preferences.isDarkmode
                        ? const TextStyle(color: Colors.black)
                        : null,
                  ),
                  items: holdings.map((list) {
                    return DropdownMenuItem(
                      value: list.holding,
                      child: Text(
                        list.holding,
                        style: TextStyle(
                            color:
                                Preferences.isDarkmode ? Colors.black : null),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    singUpForm.formValues['holding'] = value.toString();
                  },
                  validator: (value) {
                    if (!value.toString().isNotNull) {
                      return 'Seleccione un Holding';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: Apptheme.primary,
                  onPressed: bloc.state is SingUpStateLoading
                      ? null
                      : () async {
                          //Cerrar teclado
                          //cuando se emula con chrome se cae
                          FocusScope.of(context).unfocus();

                          // Lanza las validaciones
                          if (!singUpForm.isValidForm()) return;

                          ProgressDialog.show(context);

                          final String? imageUrl =
                              await singUpForm.uploadImage(filePath);
                          // print(imageUrl);

                          await singUpForm.submit(
                              singUpForm.formValues['nombre'].toString(),
                              singUpForm.formValues['rut'].toString(),
                              singUpForm.formValues['correo'].toString(),
                              singUpForm.formValues['password'].toString(),
                              singUpForm.formValues['rol'].toString(),
                              imageUrl,
                              singUpForm.formValues['holding'].toString());

                          // if (!mounted) {
                          //   return;
                          // }
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);

                          final state = bloc.state;

                          state.when(
                            loading: () => '',
                            failed: (failure) =>
                                NotificationsHelper.showSnacbar(failure.name),
                            error: (errors) {
                              final String msg = errors
                                  .toString()
                                  .replaceAll("body[", "\n")
                                  .replaceAll("[", "")
                                  .replaceAll("]", "");
                              displayDialogIOS(context, msg);
                            },
                            loaded: (usuario) {
                              NotificationsHelper.showSnacbar(
                                  "Usuario Registrado");
                              // Navigator.of(context).pop();
                              Navigator.pop(context, usuario);
                            },
                            inicia: () {},
                          );
                        },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                    child: Text(
                      bloc.state is SingUpStateLoading
                          ? 'Espere ...'
                          : 'Grabar',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

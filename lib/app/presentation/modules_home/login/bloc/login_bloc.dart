import 'package:flutter/material.dart';

import 'package:mi_app/app/domain/inputs/inputs.dart';
import 'package:mi_app/app/domain/repositories/authentication_repository.dart';
import 'package:mi_app/app/domain/result/get_usuarios/get_usuarios_resul.dart';
import 'package:mi_app/app/presentation/modules_home/login/bloc/bloc.dart';

class LoginBloc extends ChangeNotifier {
  final AuthenticationRepository authenticationRepository;

  LoginBloc({
    required this.authenticationRepository,
  });

  final GlobalKey<FormState> formKey = GlobalKey();

  final Map<String, String> formValues = {
    'correo': '',
    'password': '',
  };

  LoginState _state = LoginStateInicia();

  LoginState get state => _state;

  Future<void> submit(
    String correo,
    String password,
  ) async {
    if (state is! LoginStateLoading) {
      _state = LoginStateLoading();
      notifyListeners();
    }

    final result = await authenticationRepository.postLogin(
      LoginData(
        correo: correo,
        password: password,
      ),
    );

    if (result is GetUsuarioSuccess) {
      _state = LoginStateLoaded(result.usuario);
      // usuario = result.usuarios;
    } else if (result is GetUsuariosFailure) {
      _state = LoginStateFailed(result.failure);
    } else if (result is GetUsuariosValidationError) {
      _state = LoginStateError(result.validationError);
    }
    notifyListeners();
  }

  //Lanza las validaciones en el formulario
  bool isValidForm() {
    // print(formValues);
    return formKey.currentState?.validate() ?? false;
  }
}

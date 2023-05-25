import 'package:flutter/material.dart';

import 'package:mi_app/app/domain/inputs/inputs.dart';
import 'package:mi_app/app/domain/repositories/authentication_repository.dart';
import 'package:mi_app/app/domain/result/get_usuarios/get_usuarios_resul.dart';
import 'package:mi_app/app/presentation/modules_home/reset_password/bloc/bloc.dart';

class ResetPasswordBloc extends ChangeNotifier {
  ResetPasswordBloc({
    required this.authenticationRepository,
  });

  final AuthenticationRepository authenticationRepository;

  final GlobalKey<FormState> formKey = GlobalKey();

  final Map<String, String> formValues = {
    'correo': '',
  };

  ResetPasswordState _state = ResetPasswordStateInicia();

  ResetPasswordState get state => _state;

  Future<void> submit(
    String correo,
  ) async {
    if (state is! ResetPasswordStateLoading) {
      _state = ResetPasswordStateLoading();
      notifyListeners();
    }

    final result = await authenticationRepository.postResetPassword(
      ResetPasswordData(
        correo: correo,
      ),
    );

    if (result is GetUsuarioSuccess) {
      _state = ResetPasswordStateLoaded(result.usuario);
    } else if (result is GetUsuariosFailure) {
      _state = ResetPasswordStateFailed(result.failure);
    } else if (result is GetUsuariosValidationError) {
      _state = ResetPasswordStateError(result.validationError);
    }
    notifyListeners();
  }

  //Lanza las validaciones en el formulario
  bool isValidForm() {
    // print(formValues);
    return formKey.currentState?.validate() ?? false;
  }
}

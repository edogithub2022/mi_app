import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mi_app/app/domain/inputs/inputs.dart';
import 'package:mi_app/app/domain/repositories/authentication_repository.dart';
import 'package:mi_app/app/domain/result/get_usuarios/get_usuarios_resul.dart';
import 'package:mi_app/app/presentation/modules_home/singup/bloc/bloc.dart';

class SingUpBloc extends ChangeNotifier {
  SingUpBloc({
    required this.authenticationRepository,
  });

  final AuthenticationRepository authenticationRepository;

  final GlobalKey<FormState> formKey = GlobalKey();

  final Map<String, String> formValues = {
    'nombre': '',
    'rut': '',
    'correo': '',
    'password': '',
    'vPassword': '',
    'rol': '',
    'holding': '',
  };

  SingUpState _state = SingUpStateInicia();

  SingUpState get state => _state;

  Future<void> submit(
    String nombre,
    String rut,
    String correo,
    String password,
    String rol,
    String? urlImage,
    String? holding,
  ) async {
    if (state is! SingUpStateLoading) {
      _state = SingUpStateLoading();
      notifyListeners();
    }

    final result = await authenticationRepository.createUser(
      SingUpData(
        nombre: nombre,
        rut: rut,
        correo: correo,
        password: password,
        rol: rol,
        urlImage: urlImage ?? '',
        holding: holding ?? '',
      ),
    );

    if (result is GetUsuarioSuccess) {
      _state = SingUpStateLoaded(result.usuario);
    } else if (result is GetUsuariosFailure) {
      _state = SingUpStateFailed(result.failure);
    } else if (result is GetUsuariosValidationError) {
      _state = SingUpStateError(result.validationError);
    }
    notifyListeners();
  }

  //Lanza las validaciones en el formulario
  bool isValidForm() {
    // print(formValues);
    return formKey.currentState?.validate() ?? false;
  }

  Future<String?> uploadImage(
    String? filePath,
  ) async {
    if (state is! SingUpStateLoading) {
      _state = SingUpStateLoading();
      notifyListeners();
    }
    if (filePath == null) return null;

    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dmpdnoked/image/upload?upload_preset=usuarios');

    final imageUploadRequest = http.MultipartRequest('POST', url);

    final file = await http.MultipartFile.fromPath('file', filePath);

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      return null;
    }

    final decodeData = json.decode(resp.body);

    return decodeData['secure_url'];
  }
}

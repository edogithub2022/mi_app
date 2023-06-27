import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mi_app/app/domain/inputs/inputs.dart';
import 'package:mi_app/app/domain/models/models.dart';
import 'package:mi_app/app/domain/repositories/user_repository.dart';
import 'package:mi_app/app/domain/result/get_maestros/get_holding_result.dart';
import 'package:mi_app/app/domain/result/get_usuarios/get_usuarios_resul.dart';
import 'package:mi_app/app/presentation/modules_home/users/bloc/bloc.dart';

class UserBloc extends ChangeNotifier {
  final UserRepository userRepository;
  UserBloc({required this.userRepository});

  late List<Holding> holdings;
  late Usuario selectedUser;
  late List<Usuario> usuarios;
  File? newPickerFile;

  updateEstado(bool value) {
    selectedUser.estado = value;
    notifyListeners();
  }

  UserState _state = UserStateLoading();

  UserState get state => _state;

  Future<void> init() async {
    if (state is! UserStateLoading) {
      _state = UserStateLoading();
      notifyListeners();
    }

    final result = await userRepository.getUsuariosByHolding();

    if (result is GetUsuariosByHoldingSuccess) {
      _state = UserStateLoadedHolding(result.usuarios);
    } else if (result is GetUsuariosFailure) {
      _state = UserStateFailed(result.failure);
    } else if (result is GetUsuariosValidationError) {
      _state = UserStateError(result.validationError);
    }
    notifyListeners();
  }

  Future<void> usuariosList(String holding) async {
    if (state is! UserStateLoading) {
      _state = UserStateLoading();
      notifyListeners();
    }

    final result = await userRepository.getUsuarios();

    if (result is GetUsuariosSuccess) {
      _state = UserStateLoaded(result.usuarios);

      //Se guarda en una lista de holding
      final resultHolding = await userRepository.getHoldings();
      if (resultHolding is GetHoldingsSuccess) {
        holdings = resultHolding.holdings;
      }
      //Se guarda la lista de usuarios solo para cuando
      //se agregue un nuevo usuario poderlo agregar a la lista
      //y no realizar una nueva peticion http
      usuarios = result.usuarios;
    } else if (result is GetUsuariosFailure) {
      _state = UserStateFailed(result.failure);
    } else if (result is GetUsuariosValidationError) {
      _state = UserStateError(result.validationError);
    }
    notifyListeners();
  }

  Future<void> updateUsuario({
    required String uuid,
    required String nombre,
    required String rut,
    required String correo,
    required String password,
    required String rol,
    required bool estado,
    required String? imageUrl,
    required String? holding,
  }) async {
    if (state is! UserStateLoading) {
      _state = UserStateLoading();
      notifyListeners();
    }

    final result = await userRepository.putUsuario(UpdateUserData(
      uuid: uuid,
      nombre: nombre,
      rut: rut,
      correo: correo,
      password: password,
      rol: rol,
      estado: estado,
      imageUrl: imageUrl ?? '',
      holding: holding ?? '',
    ));

    if (result is GetUsuariosSuccess) {
      _state = UserStateLoaded(result.usuarios);
    } else if (result is GetUsuariosFailure) {
      _state = UserStateFailed(result.failure);
    } else if (result is GetUsuariosValidationError) {
      _state = UserStateError(result.validationError);
    }
    notifyListeners();
  }

  void updateSelectedUserImage(String path) {
    newPickerFile = File.fromUri(Uri(path: path));
    notifyListeners();
  }

  Future<String?> uploadImage() async {
    try {
      if (state is! UserStateLoading) {
        _state = UserStateLoading();
        notifyListeners();
      }
      if (newPickerFile == null) return null;

      final url = Uri.parse(
          'https://api.cloudinary.com/v1_1/dmpdnoked/image/upload?upload_preset=usuarios');

      final imageUploadRequest = http.MultipartRequest('POST', url);

      final file =
          await http.MultipartFile.fromPath('file', newPickerFile!.path);

      imageUploadRequest.files.add(file);

      final streamResponse = await imageUploadRequest.send();
      final resp = await http.Response.fromStream(streamResponse);

      if (resp.statusCode != 200 && resp.statusCode != 201) {
        return null;
      }

      final decodeData = json.decode(resp.body);
      selectedUser.imageUrl = decodeData['secure_url'];
      return decodeData['secure_url'];
    } catch (e) {
      return null;
    }
  }
}

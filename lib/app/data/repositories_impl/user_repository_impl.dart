import 'package:mi_app/app/data/services/remote/api_login.dart';
import 'package:mi_app/app/domain/inputs/inputs.dart';
import 'package:mi_app/app/domain/repositories/user_repository.dart';
import 'package:mi_app/app/domain/result/get_usuarios/get_usuarios_resul.dart';

class UserRepositoryImpl implements UserRepository {
  final LoginApi _api;

  UserRepositoryImpl(this._api);

  @override
  Future<GetUsuariosResult> getReadVeriyToken() {
    return _api.getReadVeriyToken();
  }

  @override
  Future<GetUsuariosResult> getUsuarios() {
    return _api.getUsuarios();
  }

  @override
  Future<GetUsuariosResult> putUsuario(UpdateUserData data) {
    return _api.updateUser(
      uuid: data.uuid,
      nombre: data.nombre,
      rut: data.rut,
      correo: data.correo,
      rol: data.rol,
      estado: data.estado,
      imageUrl: data.imageUrl,
    );
  }
}

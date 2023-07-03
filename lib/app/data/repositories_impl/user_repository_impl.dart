import 'package:mi_app/app/data/services/remote/api_login.dart';
import 'package:mi_app/app/domain/inputs/inputs.dart';
import 'package:mi_app/app/domain/repositories/user_repository.dart';
import 'package:mi_app/app/domain/result/get_maestros/get_holding_result.dart';
import 'package:mi_app/app/domain/result/get_usuarios/get_usuarios_resul.dart';

class UserRepositoryImpl implements UserRepository {
  final LoginApi _api;

  UserRepositoryImpl(this._api);

  @override
  Future<GetUsuariosResult> getReadVeriyToken() {
    return _api.getReadVeriyToken();
  }

  @override
  Future<GetUsuariosResult> getUsuarios(String holding) {
    return _api.getUsuarios(holding: holding);
  }

  @override
  Future<GetUsuariosResult> putUsuario(UpdateUserData data) {
    return _api.updateUser(
      uuid: data.uuid,
      nombre: data.nombre,
      rut: data.rut,
      correo: data.correo,
      password: data.password,
      rol: data.rol,
      estado: data.estado,
      imageUrl: data.imageUrl,
    );
  }

  @override
  Future<GetHoldingResult> getHoldings() {
    return _api.getHoldings();
  }

  @override
  Future<GetUsuariosResult> getUsuariosByHolding() {
    return _api.getUsuariosByHolding();
  }
}

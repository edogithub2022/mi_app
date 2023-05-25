import 'package:mi_app/app/data/services/remote/api_login.dart';
import 'package:mi_app/app/domain/inputs/login.dart';
import 'package:mi_app/app/domain/inputs/reset_password.dart';
import 'package:mi_app/app/domain/inputs/singup.dart';
import 'package:mi_app/app/domain/repositories/authentication_repository.dart';
import 'package:mi_app/app/domain/result/get_usuarios/get_usuarios_resul.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final LoginApi _api;

  AuthenticationRepositoryImpl(this._api);

  @override
  Future<GetUsuariosResult> postLogin(LoginData data) {
    return _api.postLogin(
      correo: data.correo,
      password: data.password,
    );
  }

  @override
  Future<GetUsuariosResult> postResetPassword(ResetPasswordData data) {
    return _api.postResetPassword(
      correo: data.correo,
    );
  }

  @override
  Future<GetUsuariosResult> createUser(SingUpData data) {
    return _api.createUser(
      nombre: data.nombre,
      rut: data.rut,
      correo: data.correo,
      password: data.password,
      rol: data.rol,
      imageUrl: data.urlImage,
    );
  }
}

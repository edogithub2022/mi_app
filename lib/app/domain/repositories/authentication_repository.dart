import 'package:mi_app/app/domain/inputs/inputs.dart';
import 'package:mi_app/app/domain/result/get_usuarios/get_usuarios_resul.dart';

abstract class AuthenticationRepository {
  Future<GetUsuariosResult> postLogin(LoginData data);
  Future<GetUsuariosResult> postResetPassword(ResetPasswordData data);
  Future<GetUsuariosResult> createUser(SingUpData data);
}

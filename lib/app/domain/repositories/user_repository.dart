import 'package:mi_app/app/domain/inputs/inputs.dart';
import 'package:mi_app/app/domain/result/get_usuarios/get_usuarios_resul.dart';

abstract class UserRepository {
  Future<GetUsuariosResult> getReadVeriyToken();
  Future<GetUsuariosResult> getUsuarios();
  Future<GetUsuariosResult> putUsuario(UpdateUserData data);
}

import 'package:mi_app/app/domain/inputs/inputs.dart';
import 'package:mi_app/app/domain/result/get_maestros/get_holding_result.dart';
import 'package:mi_app/app/domain/result/get_usuarios/get_usuarios_resul.dart';

abstract class UserRepository {
  Future<GetUsuariosResult> getUsuariosByHolding();
  Future<GetHoldingResult> getHoldings();
  Future<GetUsuariosResult> getReadVeriyToken();
  Future<GetUsuariosResult> getUsuarios(String holding);
  Future<GetUsuariosResult> putUsuario(UpdateUserData data);
}

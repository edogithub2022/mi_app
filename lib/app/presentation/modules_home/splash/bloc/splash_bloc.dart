import 'package:flutter/widgets.dart';

import 'package:mi_app/app/domain/result/get_usuarios/get_usuarios_resul.dart';
import 'package:mi_app/app/domain/repositories/user_repository.dart';
import 'package:mi_app/app/presentation/modules_home/splash/bloc/bloc.dart';

class SplashBloc extends ChangeNotifier {
  SplashBloc({
    required this.splashRepository,
  });

  final UserRepository splashRepository;

  SplashState _state = SplashStateLoading();

  SplashState get state => _state;

  Future<void> init() async {
    if (state is! SplashStateLoading) {
      _state = SplashStateLoading();
      notifyListeners();
    }

    final result = await splashRepository.getReadVeriyToken();

    if (result is GetUsuarioSuccess) {
      _state = SplashStateLoaded(result.usuario);
    } else if (result is GetUsuariosFailure) {
      _state = SplashStateFailed(result.failure);
    } else if (result is GetUsuariosValidationError) {
      _state = SplashStateError(result.validationError);
    }
    notifyListeners();
  }
}

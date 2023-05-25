import 'package:flutter/material.dart';

import 'package:mi_app/app/domain/models/models.dart';

class SessionProvider with ChangeNotifier {
  Usuario? _usuario;

  int _indexBtnNav = 0;

  Map<String, bool> _access = {
    'usuarios': false,
    'usuariosPlus': false,
  };

  Usuario? get usuario => _usuario;
  get indexBtnNav => _indexBtnNav;
  Map<String, bool> get access => _access;

  void setUsuario({required Usuario usuario}) async {
    _usuario = usuario;
    notifyListeners();
  }

  void setIndexBtnNav({required int indexBtnNav}) async {
    _indexBtnNav = indexBtnNav;
    notifyListeners();
  }

  void setAccess({required Map<String, bool> access}) async {
    _access = access;
    notifyListeners();
  }
}

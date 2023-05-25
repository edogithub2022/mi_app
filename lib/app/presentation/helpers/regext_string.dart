extension ExtString on String? {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this!);
  }

  ///el nombre debe tener una mayuscula mas Apellido
  bool get isValidName {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-zñÑ]{1,}([\.,] |[-']| ))+[A-Za-zñÑ]+\.?\s*$");

    return nameRegExp.hasMatch(this!);
  }

  ///La password debe tener a lo menos una mayuscula mas caracter !@#\><*~ y minimo 6 caracteres
  bool get isValidPassword {
    final passwordRegExp =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#><*~]).{6,}');
    return passwordRegExp.hasMatch(this!);
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this!);
  }

  ///Valida rut, sin separador de miles y con guion para el digito verificado
  bool get isRut {
    var rutCompleto = this;

    if (rutCompleto != '') {
      rutCompleto = rutCompleto?.replaceAll("‐", "-");
      final rutRegExp = RegExp(r"!/^[0-9]+[-|‐]{1}[0-9kK]{1}$/");
      if (rutRegExp.hasMatch(this!)) {
        return false;
      }

      final tmp = rutCompleto?.split('-');
      if (tmp?.length == 1) {
        return false;
      }

      final tmpRegExp = RegExp(r"^([0-9])*$");
      if (!tmpRegExp.hasMatch(tmp![0])) {
        return false;
      }

      var digv = tmp[1];
      var rut = int.parse(tmp[0]);
      if (digv == 'K') digv = 'k';

      var M = 0;
      var S = 1;

      for (; rut > 0; rut = (rut / 10).floor()) {
        S = (S + rut % 10 * (9 - M++ % 6)) % 11;
      }

      final String digito;

      if (S == 0) {
        digito = 'k';
      } else {
        digito = (S - 1).toString();
      }

      if (digito == digv) {
        return true;
      }

      return false;
    }

    return false;
  }
}

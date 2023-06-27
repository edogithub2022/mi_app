import 'dart:io';
import 'dart:async';

import 'package:mi_app/app/domain/models/login/usuario_by_holding.dart';
import 'package:mi_app/app/domain/models/login/usuarios_by_holding_response.dart';
import 'package:mi_app/app/domain/models/models.dart';
import 'package:mi_app/app/domain/models/login/usuarios_response.dart';
import 'package:mi_app/app/domain/result/get_maestros/get_holding_result.dart';
import 'package:mi_app/app/domain/result/get_usuarios/get_usuarios_resul.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mi_app/app/domain/failures/http_request_failure.dart';

import 'package:mi_app/app/data/helpers/http.dart';
import 'package:mi_app/app/data/helpers/http_method.dart';

class LoginApi {
  final Http _http;
  LoginApi(this._http);

  final storage = const FlutterSecureStorage();

//TOKEN: usando la clase http
  Future<GetUsuariosResult> getReadVeriyToken() async {
    try {
      final token = await readToken();
      if (token == '') throw HttpRequestFailure.notoken;

      Map<String, String> authHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token
      };

      final resul = await _http.request(
        '/api/v1/auth/verifytoken',
        method: HttpMethod.get,
        headers: authHeaders,
      );

      final UsuarioResponse usuarioResponse;

      //si no hay errores la peticion termino de forma exitosa
      if (resul.error == null) {
        //Token Valido
        // print(resul.data);
        usuarioResponse = UsuarioResponse.fromJson(resul.data);

        return GetUsuarioSuccess(usuarioResponse.data!.usuario);
      }

      //Aca ya sabemos que result.error no es nulo, lo que quiere decir que,
      //la solicitud termino pero la api devolvio un codigo de error
      //indicandonos que hemos pasado credenciales incorrectas
      if (resul.statusCode >= 400 && resul.statusCode < 500) {
        //Borrar token del storage
        logout();
        throw HttpRequestFailure.accessDenied;
      }

      if (resul.statusCode >= 500) {
        throw HttpRequestFailure.serverError;
      }

      if (resul.statusCode == -1) {
        throw HttpRequestFailure.networkError;
      }

      throw HttpRequestFailure.unknownError;
    } catch (e) {
      late HttpRequestFailure failure;

      if (e is HttpRequestFailure) {
        failure = e;
      } else if (e is SocketException || e is TimeoutException) {
        //La peticion no termino de forma exitosa debido tal vez que a un problema
        //de conexion a internet o la peticion tardo demasiado en responder
        failure = HttpRequestFailure.networkError;
      } else {
        //Sino retorna un error desconocido que por ejemplo puede ser que
        //estemos parseando mal el dato
        failure = HttpRequestFailure.unknownError;
      }

      return GetUsuariosFailure(failure);
    }
  }

  //Recuperar Usuarios: usando la clase http
  Future<GetUsuariosResult> getUsuarios() async {
    try {
      final token = await readToken();
      if (token == '') throw HttpRequestFailure.notoken;

      List<Usuario> usuarios = [];

      Map<String, String> authHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token
      };

      final resul = await _http.request(
        '/api/v1/usuarios',
        method: HttpMethod.get,
        headers: authHeaders,
      );

      final UsuariosResponse usuariosResponse;

      //si no hay errores la peticion termino de forma exitosa
      if (resul.error == null) {
        //Token Valido
        usuariosResponse = UsuariosResponse.fromJson(resul.data);
        usuarios = usuariosResponse.data!;
        return GetUsuariosSuccess(usuarios);
        // throw HttpRequestFailure.accessDenied;
      }

      //Aca ya sabemos que result.error no es nulo, lo que quiere decir que,
      //la solicitud termino pero la api devolvio un codigo de error
      //indicandonos que hemos pasado credenciales incorrectas
      if (resul.statusCode >= 400 && resul.statusCode < 500) {
        //Borrar token del storage
        logout();
        throw HttpRequestFailure.accessDenied;
      }

      if (resul.statusCode >= 500) {
        throw HttpRequestFailure.serverError;
      }

      if (resul.statusCode == -1) {
        throw HttpRequestFailure.networkError;
      }

      throw HttpRequestFailure.unknownError;
    } catch (e) {
      late HttpRequestFailure failure;

      if (e is HttpRequestFailure) {
        failure = e;
      } else if (e is SocketException || e is TimeoutException) {
        //La peticion no termino de forma exitosa debido tal vez que a un problema
        //de conexion a internet o la peticion tardo demasiado en responder
        failure = HttpRequestFailure.networkError;
      } else {
        //Sino retorna un error desconocido que por ejemplo puede ser que
        //estemos parseando mal el dato
        failure = HttpRequestFailure.unknownError;
      }

      return GetUsuariosFailure(failure);
    }
  }

  //Recuperar Usuarios: usando la clase http
  Future<GetUsuariosResult> getUsuariosByHolding() async {
    try {
      final token = await readToken();
      if (token == '') throw HttpRequestFailure.notoken;

      List<UsuarioByHolding> usuarios = [];

      Map<String, String> authHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token
      };

      final resul = await _http.request(
        '/api/v1/usuarios/userbyholding',
        method: HttpMethod.get,
        headers: authHeaders,
      );

      final UsuariosByHoldingResponse usuariosByHoldingResponse;

      //si no hay errores la peticion termino de forma exitosa
      if (resul.error == null) {
        //Token Valido
        usuariosByHoldingResponse =
            UsuariosByHoldingResponse.fromJson(resul.data);
        usuarios = usuariosByHoldingResponse.data;
        return GetUsuariosByHoldingSuccess(usuarios);
        // throw HttpRequestFailure.accessDenied;
      }

      //Aca ya sabemos que result.error no es nulo, lo que quiere decir que,
      //la solicitud termino pero la api devolvio un codigo de error
      //indicandonos que hemos pasado credenciales incorrectas
      if (resul.statusCode >= 400 && resul.statusCode < 500) {
        //Borrar token del storage
        logout();
        throw HttpRequestFailure.accessDenied;
      }

      if (resul.statusCode >= 500) {
        throw HttpRequestFailure.serverError;
      }

      if (resul.statusCode == -1) {
        throw HttpRequestFailure.networkError;
      }

      throw HttpRequestFailure.unknownError;
    } catch (e) {
      late HttpRequestFailure failure;

      if (e is HttpRequestFailure) {
        failure = e;
      } else if (e is SocketException || e is TimeoutException) {
        //La peticion no termino de forma exitosa debido tal vez que a un problema
        //de conexion a internet o la peticion tardo demasiado en responder
        failure = HttpRequestFailure.networkError;
      } else {
        //Sino retorna un error desconocido que por ejemplo puede ser que
        //estemos parseando mal el dato
        failure = HttpRequestFailure.unknownError;
      }

      return GetUsuariosFailure(failure);
    }
  }

//LOGIN: usando la clase http
  Future<GetUsuariosResult> postLogin({
    required String correo,
    required String password,
  }) async {
    try {
      final Map<String, String> authData = {
        'correo': correo,
        'password': password,
      };

      final resul = await _http.request(
        '/api/v1/auth/login',
        method: HttpMethod.post,
        body: authData,
      );

      final UsuarioResponse usuarioResponse;

      //si no hay errores la peticion termino de forma exitosa
      if (resul.error == null) {
        usuarioResponse = UsuarioResponse.fromJson(resul.data);
        await storage.write(key: 'token', value: usuarioResponse.data!.token);
        // print(usuarioResponse.data!.token);
        return GetUsuarioSuccess(usuarioResponse.data!.usuario);
      }

      //Aca ya sabemos que result.error no es nulo, lo que quiere decir que,
      //la solicitud termino pero la api devolvio un codigo de error
      //indicandonos que hemos pasado credenciales incorrectas
      if (resul.statusCode >= 400 && resul.statusCode < 500) {
        usuarioResponse = UsuarioResponse.fromJson(resul.error?.data);
        return GetUsuariosValidationError(usuarioResponse.errors);
      }

      if (resul.statusCode >= 500) {
        throw HttpRequestFailure.serverError;
      }

      if (resul.statusCode == -1) {
        throw HttpRequestFailure.networkError;
      }

      throw HttpRequestFailure.unknownError;
    } catch (e) {
      late HttpRequestFailure failure;

      if (e is HttpRequestFailure) {
        failure = e;
      } else if (e is SocketException || e is TimeoutException) {
        //La peticion no termino de forma exitosa debido tal vez que a un problema
        //de conexion a internet o la peticion tardo demasiado en responder
        failure = HttpRequestFailure.networkError;
      } else {
        //Sino retorna un error desconocido que por ejemplo puede ser que
        //estemos parseando mal el dato
        failure = HttpRequestFailure.unknownError;
      }

      return GetUsuariosFailure(failure);
    }
  }

//Reset: usando la clase http
  Future<GetUsuariosResult> postResetPassword({required String correo}) async {
    try {
      final Map<String, String> resetData = {
        'correo': correo,
      };

      final resul = await _http.request(
        '/api/v1/auth/reset_password',
        method: HttpMethod.post,
        body: resetData,
      );

      final UsuarioResponse usuarioResponse;

      //si no hay errores la peticion termino de forma exitosa
      if (resul.error == null) {
        usuarioResponse = UsuarioResponse.fromJson(resul.data);

        return GetUsuarioSuccess(usuarioResponse.data!.usuario);
      }

      //Aca ya sabemos que result.error no es nulo, lo que quiere decir que,
      //la solicitud termino pero la api devolvio un codigo de error
      //indicandonos que hemos pasado credenciales incorrectas
      if (resul.statusCode >= 400 && resul.statusCode < 500) {
        usuarioResponse = UsuarioResponse.fromJson(resul.error?.data);
        return GetUsuariosValidationError(usuarioResponse.errors);
      }

      if (resul.statusCode >= 500) {
        throw HttpRequestFailure.serverError;
      }

      if (resul.statusCode == -1) {
        throw HttpRequestFailure.networkError;
      }

      throw HttpRequestFailure.unknownError;
    } catch (e) {
      late HttpRequestFailure failure;

      if (e is HttpRequestFailure) {
        failure = e;
      } else if (e is SocketException || e is TimeoutException) {
        //La peticion no termino de forma exitosa debido tal vez que a un problema
        //de conexion a internet o la peticion tardo demasiado en responder
        failure = HttpRequestFailure.networkError;
      } else {
        //Sino retorna un error desconocido que por ejemplo puede ser que
        //estemos parseando mal el dato
        failure = HttpRequestFailure.unknownError;
      }

      return GetUsuariosFailure(failure);
    }
  }

//REGISTRAR: usando la clase http
  Future<GetUsuariosResult> createUser({
    required String nombre,
    required String rut,
    required String correo,
    required String password,
    required String rol,
    required String imageUrl,
    required String holding,
  }) async {
    try {
      final Map<String, String> authData = {
        'nombre': nombre,
        'rut': rut,
        'correo': correo,
        'password': password,
        'rol': rol,
        'imageUrl': imageUrl,
        'holding': holding,
      };

      final token = await readToken();
      if (token == '') throw HttpRequestFailure.notoken;

      Map<String, String> authHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token
      };

      final resul = await _http.request(
        '/api/v1/auth/registrar',
        method: HttpMethod.post,
        body: authData,
        headers: authHeaders,
      );

      final UsuarioResponse usuarioResponse;

      //si no hay errores la peticion termino de forma exitosa
      if (resul.error == null) {
        usuarioResponse = UsuarioResponse.fromJson(resul.data);
        return GetUsuarioSuccess(usuarioResponse.data!.usuario);
      }

      //Aca ya sabemos que result.error no es nulo, lo que quiere decir que,
      //la solicitud termino pero la api devolvio un codigo de error
      //indicandonos que hemos pasado credenciales incorrectas
      if (resul.statusCode >= 400 && resul.statusCode < 500) {
        usuarioResponse = UsuarioResponse.fromJson(resul.error?.data);
        return GetUsuariosValidationError(usuarioResponse.errors);
      }

      if (resul.statusCode >= 500) {
        throw HttpRequestFailure.serverError;
      }

      if (resul.statusCode == -1) {
        throw HttpRequestFailure.networkError;
      }

      throw HttpRequestFailure.unknownError;
    } catch (e) {
      late HttpRequestFailure failure;

      if (e is HttpRequestFailure) {
        failure = e;
      } else if (e is SocketException || e is TimeoutException) {
        //La peticion no termino de forma exitosa debido tal vez que a un problema
        //de conexion a internet o la peticion tardo demasiado en responder
        failure = HttpRequestFailure.networkError;
      } else {
        //Sino retorna un error desconocido que por ejemplo puede ser que
        //estemos parseando mal el dato
        failure = HttpRequestFailure.unknownError;
      }

      return GetUsuariosFailure(failure);
    }
  }

//Modificar usuario: usando la clase http
  Future<GetUsuariosResult> updateUser({
    required String uuid,
    required String nombre,
    required String rut,
    required String correo,
    required String password,
    required String rol,
    required bool estado,
    required String imageUrl,
  }) async {
    try {
      final Map<String, dynamic> userData = {
        'nombre': nombre,
        'rut': rut,
        // 'correo': correo,
        'password': password,
        'rol': rol,
        'estado': estado,
        'imageUrl': imageUrl,
      };

      final token = await readToken();
      if (token == '') throw HttpRequestFailure.notoken;

      List<Usuario> usuarios = [];

      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token
      };

      final resul = await _http.request(
        '/api/v1/usuarios/$uuid',
        method: HttpMethod.put,
        body: userData,
        headers: headers,
      );

      final UsuariosResponse usuariosResponse;

      //si no hay errores la peticion termino de forma exitosa
      if (resul.error == null) {
        usuariosResponse = UsuariosResponse.fromJson(resul.data);
        usuarios = usuariosResponse.data!;
        return GetUsuariosSuccess(usuarios);
      }

      //Aca ya sabemos que result.error no es nulo, lo que quiere decir que,
      //la solicitud termino pero la api devolvio un codigo de error
      //indicandonos que hemos pasado credenciales incorrectas
      if (resul.statusCode >= 400 && resul.statusCode < 500) {
        usuariosResponse = UsuariosResponse.fromJson(resul.error?.data);
        return GetUsuariosValidationError(usuariosResponse.errors);
      }

      if (resul.statusCode >= 500) {
        throw HttpRequestFailure.serverError;
      }

      if (resul.statusCode == -1) {
        throw HttpRequestFailure.networkError;
      }

      throw HttpRequestFailure.unknownError;
    } catch (e) {
      late HttpRequestFailure failure;

      if (e is HttpRequestFailure) {
        failure = e;
      } else if (e is SocketException || e is TimeoutException) {
        //La peticion no termino de forma exitosa debido tal vez que a un problema
        //de conexion a internet o la peticion tardo demasiado en responder
        failure = HttpRequestFailure.networkError;
      } else {
        //Sino retorna un error desconocido que por ejemplo puede ser que
        //estemos parseando mal el dato
        failure = HttpRequestFailure.unknownError;
      }

      return GetUsuariosFailure(failure);
    }
  }

  //Recuperar Holding: usando la clase http
  Future<GetHoldingResult> getHoldings() async {
    try {
      final token = await readToken();
      if (token == '') throw HttpRequestFailure.notoken;

      List<Holding> holdings = [];

      Map<String, String> authHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token
      };

      final resul = await _http.request(
        '/api/v1/holdings',
        method: HttpMethod.get,
        headers: authHeaders,
      );

      final HoldingsResponse holdingsResponse;

      //si no hay errores la peticion termino de forma exitosa
      if (resul.error == null) {
        //Token Valido
        holdingsResponse = HoldingsResponse.fromJson(resul.data);
        holdings = holdingsResponse.data;
        return GetHoldingsSuccess(holdings);
        // throw HttpRequestFailure.accessDenied;
      }

      //Aca ya sabemos que result.error no es nulo, lo que quiere decir que,
      //la solicitud termino pero la api devolvio un codigo de error
      //indicandonos que hemos pasado credenciales incorrectas
      if (resul.statusCode >= 400 && resul.statusCode < 500) {
        //Borrar token del storage
        logout();
        throw HttpRequestFailure.accessDenied;
      }

      if (resul.statusCode >= 500) {
        throw HttpRequestFailure.serverError;
      }

      if (resul.statusCode == -1) {
        throw HttpRequestFailure.networkError;
      }

      throw HttpRequestFailure.unknownError;
    } catch (e) {
      late HttpRequestFailure failure;

      if (e is HttpRequestFailure) {
        failure = e;
      } else if (e is SocketException || e is TimeoutException) {
        //La peticion no termino de forma exitosa debido tal vez que a un problema
        //de conexion a internet o la peticion tardo demasiado en responder
        failure = HttpRequestFailure.networkError;
      } else {
        //Sino retorna un error desconocido que por ejemplo puede ser que
        //estemos parseando mal el dato
        failure = HttpRequestFailure.unknownError;
      }

      return GetHoldingFailure(failure);
    }
  }

  Future logout() async {
    await storage.delete(key: 'token');
    return;
  }

  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
  }
}

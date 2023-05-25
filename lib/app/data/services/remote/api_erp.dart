import 'dart:io';
import 'dart:async';

import 'package:mi_app/app/data/helpers/http_method.dart';
import 'package:mi_app/app/data/helpers/http.dart';
import 'package:mi_app/app/domain/failures/http_request_failure.dart';
import 'package:mi_app/app/domain/models/erp/orden_compra/orden_compra_cab.dart';
import 'package:mi_app/app/domain/models/erp/orden_compra/orden_compra_response.dart';
import 'package:mi_app/app/domain/models/models.dart';
import 'package:mi_app/app/domain/result/get_orden_compra/get_orden_compra_resul.dart';
import 'package:mi_app/app/domain/result/get_orden_compra/get_orden_compra_totales_resul.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ErpApi {
  final Http _http;
  ErpApi(this._http);

  final storage = const FlutterSecureStorage();

//Recuperar OC aprobadas
  Future<GetOrdenCompraTotalesResult> getOCTotales({
    required String codempresa,
    required String estado,
  }) async {
    try {
      final token = await readToken();
      if (token == '') throw HttpRequestFailure.notoken;

      List<OrdenCompraTotales> ordenCompraTotales = [];

      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token
      };
      Map<String, String> query = {
        'cod_empresa': codempresa,
        'estado': estado,
      };

      final resul = await _http.request(
        '/api/v1/orden-compras/totales/',
        method: HttpMethod.get,
        headers: headers,
        queryParameters: query,
      );

      final OrdenCompraTotalesResponse ordenCompraTotalesResponse;

      //si no hay errores la peticion termino de forma exitosa
      if (resul.error == null) {
        //Token Valido
        ordenCompraTotalesResponse =
            OrdenCompraTotalesResponse.fromJson(resul.data);
        ordenCompraTotales = ordenCompraTotalesResponse.data;
        return GetOrdenComprasTotalesSuccess(ordenCompraTotales);
        // throw HttpRequestFailure.accessDenied;
      }

      //Aca ya sabemos que result.error no es nulo, lo que quiere decir que,
      //la solicitud termino pero la api devolvio un codigo de error
      //indicandonos que hemos pasado credenciales incorrectas
      if (resul.statusCode >= 400 && resul.statusCode < 500) {
        //Borrar token del storage
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

      return GetOrdenCompraTotalesFailure(failure);
    }
  }

//Recuperar Detalle OC
  Future<GetOrdenCompraResult> getOCDetalle({
    required String codempresa,
    required String correlativo,
  }) async {
    try {
      final token = await readToken();
      if (token == '') throw HttpRequestFailure.notoken;

      List<OrdenCompraCab> ordenCompraCab = [];

      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token
      };
      Map<String, String> query = {
        'cod_empresa': codempresa,
      };

      final resul = await _http.request(
        '/api/v1/orden-compras/$correlativo',
        method: HttpMethod.get,
        headers: headers,
        queryParameters: query,
      );

      final OrdenCompraResponse ordenCompraResponse;

      //si no hay errores la peticion termino de forma exitosa
      if (resul.error == null) {
        //Token Valido
        ordenCompraResponse = OrdenCompraResponse.fromJson(resul.data);
        ordenCompraCab = ordenCompraResponse.data;
        return GetOrdenComprasSuccess(ordenCompraCab);
        // throw HttpRequestFailure.accessDenied;
      }

      //Aca ya sabemos que result.error no es nulo, lo que quie5re decir que,
      //la solicitud termino pero la api devolvio un codigo de error
      //indicandonos que hemos pasado credenciales incorrectas
      if (resul.statusCode >= 400 && resul.statusCode < 500) {
        //Borrar token del storage
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

      return GetOrdenCompraFailure(failure);
    }
  }

//Actualizar Estado OC
  Future<GetOrdenCompraTotalesResult> putOCEstado({
    required String codempresa,
    required String correlativo,
    required String motivoRechazo,
    required String estado,
  }) async {
    try {
      final token = await readToken();
      if (token == '') throw HttpRequestFailure.notoken;

      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token
      };
      Map<String, String> query = {
        'cod_empresa': codempresa,
      };
      Map<String, String> body = {
        'ESTADO_RECEPCION': estado,
        'MOTIVO_RECHAZO': motivoRechazo,
      };

      final resul = await _http.request(
        '/api/v1/orden-compras/$correlativo',
        method: HttpMethod.put,
        headers: headers,
        queryParameters: query,
        body: body,
      );

      List<OrdenCompraCabReturning> ordenCompraCabReturning = [];

      final OrdenCompraReturningResponse ordenCompraReturningResponse;

      //si no hay errores la peticion termino de forma exitosa
      if (resul.error == null) {
        //Token Valido
        ordenCompraReturningResponse =
            OrdenCompraReturningResponse.fromJson(resul.data);
        ordenCompraCabReturning = ordenCompraReturningResponse.data;
        return GetOrdenCompraCabReturningSuccess(ordenCompraCabReturning);
        // throw HttpRequestFailure.accessDenied;
      }

      //Aca ya sabemos que result.error no es nulo, lo que quie5re decir que,
      //la solicitud termino pero la api devolvio un codigo de error
      //indicandonos que hemos pasado credenciales incorrectas
      if (resul.statusCode >= 400 && resul.statusCode < 500) {
        //Borrar token del storage
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

      return GetOrdenCompraTotalesFailure(failure);
    }
  }

  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
  }
}

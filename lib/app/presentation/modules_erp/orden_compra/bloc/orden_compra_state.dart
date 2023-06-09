import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mi_app/app/domain/failures/http_request_failure.dart';
import 'package:mi_app/app/domain/models/erp/orden_compra/ocbyempresa.dart';
import 'package:mi_app/app/domain/models/models.dart';
import 'package:mi_app/app/domain/models/erp/orden_compra/orden_compra_cab.dart';

part 'orden_compra_state.freezed.dart';

@freezed
class OrdenCompraState with _$OrdenCompraState {
  factory OrdenCompraState.loading() = OrdenCompraStateLoading;
  factory OrdenCompraState.failed(HttpRequestFailure failure) =
      OrdenCompraStateFailed;
  factory OrdenCompraState.error(List<String> errors) = OrdenCompraStateError;
  factory OrdenCompraState.loadeds(
      List<OrdenCompraTotales> ordenCompraTotales) = OrdenComprasStateLoadeds;
  factory OrdenCompraState.loaded(OrdenCompraTotales ordenCompraTotales) =
      OrdenCompraStateLoaded;
  factory OrdenCompraState.loadedDET(List<OrdenCompraCab> ordenCompraDet) =
      OrdenCompraStateLoadedDET;
  factory OrdenCompraState.loadedByEmpresas(
          List<OcByEmpresa> ordenCompraByEmpresas) =
      OrdenCompraStateLoadedByEmpresas;
  factory OrdenCompraState.loadedReturning(
          List<OrdenCompraCabReturning> ordenCompraCabReturning) =
      OrdenCompraStateLoadedReturning;
}

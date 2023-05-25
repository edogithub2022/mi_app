import 'package:mi_app/app/data/services/remote/api_erp.dart';
import 'package:mi_app/app/domain/inputs/inputs.dart';
import 'package:mi_app/app/domain/repositories/erp_repository.dart';
import 'package:mi_app/app/domain/result/get_orden_compra/get_orden_compra_resul.dart';
import 'package:mi_app/app/domain/result/get_orden_compra/get_orden_compra_totales_resul.dart';

class ErpRepositoryImpl implements ErpRepository {
  final ErpApi _api;

  ErpRepositoryImpl(this._api);

  @override
  Future<GetOrdenCompraTotalesResult> getOCTotales(OrdenCompraData data) {
    return _api.getOCTotales(
      codempresa: data.codempresa ?? "",
      estado: data.estado ?? '',
    );
  }

  @override
  Future<GetOrdenCompraResult> getOCDetalle(OrdenCompraData data) {
    return _api.getOCDetalle(
      codempresa: data.codempresa ?? "",
      correlativo: data.correlativo ?? '0',
    );
  }

  @override
  Future<GetOrdenCompraTotalesResult> putOCEstado(OrdenCompraData data) {
    return _api.putOCEstado(
        codempresa: data.codempresa ?? "",
        motivoRechazo: data.motivoRechazo ?? '',
        correlativo: data.correlativo ?? '0',
        estado: data.estado ?? 'PENDIENTE');
  }
}

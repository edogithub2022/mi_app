import 'package:mi_app/app/domain/inputs/inputs.dart';
import 'package:mi_app/app/domain/result/get_orden_compra/get_orden_compra_by_empresas_result.dart';
import 'package:mi_app/app/domain/result/get_orden_compra/get_orden_compra_resul.dart';
import 'package:mi_app/app/domain/result/get_orden_compra/get_orden_compra_totales_resul.dart';

abstract class ErpRepository {
  Future<GetOrdenCompracByEmpresasResult> getOcByEmpresas(OrdenCompraData data);
  Future<GetOrdenCompraTotalesResult> getOCTotales(OrdenCompraData data);
  Future<GetOrdenCompraResult> getOCDetalle(OrdenCompraData data);
  Future<GetOrdenCompraTotalesResult> putOCEstado(OrdenCompraData data);
}

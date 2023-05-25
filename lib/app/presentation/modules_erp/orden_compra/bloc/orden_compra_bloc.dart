import 'package:mi_app/app/domain/result/get_orden_compra/get_orden_compra_resul.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';

import 'package:mi_app/app/domain/result/get_orden_compra/get_orden_compra_totales_resul.dart';
import 'package:mi_app/app/domain/repositories/repositories.dart';
import 'package:mi_app/app/domain/inputs/inputs.dart';
import 'package:mi_app/app/domain/models/models.dart';
import 'package:mi_app/app/presentation/modules_erp/orden_compra/bloc/bloc.dart';

class OrdenCompraBloc extends ChangeNotifier {
  final ErpRepository erpRepository;
  OrdenCompraBloc({
    required this.erpRepository,
  });

  late OrdenCompraTotales selectedOrdenCompraTotales;
  late List<OrdenCompraTotales> ordenCompraTotales;
  File? newPickerFile;

  OrdenCompraState _state = OrdenCompraStateLoading();

  OrdenCompraState get state => _state;

  Future<void> init({
    required String? codempresa,
    required String estado,
  }) async {
    if (state is! OrdenCompraStateLoading) {
      _state = OrdenCompraStateLoading();
      notifyListeners();
    }

    final result = await erpRepository.getOCTotales(
      OrdenCompraData(
        codempresa: codempresa ?? "",
        estado: estado,
      ),
    );

    if (result is GetOrdenComprasTotalesSuccess) {
      _state = OrdenComprasStateLoadeds(result.ordenCompraTotales);
      //Se guarda la lista de oc solo para cuando
      //se agregue un nuevo usuario poder agregarlo a la lista
      //y no realizar una nueva peticion http
      ordenCompraTotales = result.ordenCompraTotales;
    } else if (result is GetOrdenCompraTotalesFailure) {
      _state = OrdenCompraStateFailed(result.failure);
    } else if (result is GetOrdenCompraTotalesValidationError) {
      _state = OrdenCompraStateError(result.validationError);
    }
    notifyListeners();
  }

  Future<void> getOcDet({
    required String codempresa,
    required String correlativo,
  }) async {
    if (state is! OrdenCompraStateLoading) {
      _state = OrdenCompraStateLoading();
      notifyListeners();
    }

    final result = await erpRepository.getOCDetalle(
      OrdenCompraData(codempresa: codempresa, correlativo: correlativo),
    );

    if (result is GetOrdenComprasSuccess) {
      _state = OrdenCompraStateLoadedDET(result.ordenCompraCab);
    } else if (result is GetOrdenCompraFailure) {
      _state = OrdenCompraStateFailed(result.failure);
    } else if (result is GetOrdenCompraValidationError) {
      _state = OrdenCompraStateError(result.validationError);
    }
    notifyListeners();
  }

  Future<void> updateEstadoOc({
    required String codempresa,
    required String correlativo,
    required String motivoRechazo,
    required String estado,
  }) async {
    if (state is! OrdenCompraStateLoading) {
      _state = OrdenCompraStateLoading();
      notifyListeners();
    }

    final result = await erpRepository.putOCEstado(OrdenCompraData(
      codempresa: codempresa,
      correlativo: correlativo,
      estado: estado,
      motivoRechazo: motivoRechazo,
    ));

    if (result is GetOrdenCompraCabReturningSuccess) {
      _state = OrdenCompraStateLoadedReturning(result.ordenCompraCabReturning);
    } else if (result is GetOrdenCompraTotalesFailure) {
      _state = OrdenCompraStateFailed(result.failure);
    } else if (result is GetOrdenCompraTotalesValidationError) {
      _state = OrdenCompraStateError(result.validationError);
    }
    notifyListeners();
  }
}

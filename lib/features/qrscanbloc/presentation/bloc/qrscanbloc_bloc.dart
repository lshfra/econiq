import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:checker/features/qrscanbloc/data/models/qr_scan_model.dart';
import 'package:checker/features/qrscanbloc/data/repositories/qr_scan_repository.dart';
import 'package:equatable/equatable.dart';

part 'qrscanbloc_event.dart';
part 'qrscanbloc_state.dart';

class QrscanblocBloc extends Bloc<QrscanblocEvent, QrscanblocState> {
  final QrScanRepository qrScanRepository;

  QrscanblocBloc({required this.qrScanRepository}) : super(QrscanblocInitial());

  @override
  Stream<QrscanblocState> mapEventToState(QrscanblocEvent event) async* {
    if (event is ValidateQrCode) {
      yield QrscanblocLoading();
      try {
        final result = await qrScanRepository.validateQrCode(event.qrCode);
      } catch (e) {
        yield QrScanblocError(message: e.toString());
      }
    }
  }
}

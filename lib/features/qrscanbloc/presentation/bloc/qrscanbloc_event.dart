part of 'qrscanbloc_bloc.dart';

abstract class QrscanblocEvent extends Equatable {
  const QrscanblocEvent();

  @override
  List<Object> get props => [];
}

class ValidateQrCode extends QrscanblocEvent {
  final String qrCode;

  ValidateQrCode({required this.qrCode});

  @override
  List<Object> get props => [qrCode];
}
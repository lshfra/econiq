part of 'qrscanbloc_bloc.dart';

abstract class QrscanblocState extends Equatable {
  const QrscanblocState();  

  @override
  List<Object> get props => [];
}
class QrscanblocInitial extends QrscanblocState {}
class QrscanblocLoading extends QrscanblocState {}
class QrscanblocSuccess extends QrscanblocState {
  final QrScanModel result;

  QrscanblocSuccess({required this.result});

    @override
  List<Object> get props => [result];

}

class QrScanblocError extends QrscanblocState {
  final String message;

  QrScanblocError({required this.message});
    @override
  List<Object> get props => [message];
}

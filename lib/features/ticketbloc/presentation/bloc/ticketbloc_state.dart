part of 'ticketbloc_bloc.dart';

@immutable
abstract class TicketblocState {
  final List<ScanData> scanList;

  TicketblocState({required this.scanList});
}
class TicketblocInitial extends TicketblocState {
  TicketblocInitial() : super(scanList: []);
}

class TicketdataUpdate extends TicketblocState {
  TicketdataUpdate ({required List<ScanData> scanList}) : super(scanList: scanList);
}

class TicketblocError extends TicketblocState {
  final String message;

  TicketblocError(this.message) : super(scanList: []);

}

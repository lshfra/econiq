part of 'ticketbloc_bloc.dart';


@immutable
abstract class TicketblocEvent  {}
class AddScanData extends TicketblocEvent {
  final String qrCode;

  AddScanData(this.qrCode);
}

class SyncToServer extends TicketblocEvent{
  final ScanData scanData;

  SyncToServer(this.scanData);
}

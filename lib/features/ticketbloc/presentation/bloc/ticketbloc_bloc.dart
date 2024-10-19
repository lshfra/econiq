import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:checker/features/ticketbloc/data/models/scan_data.dart';
import 'package:checker/features/ticketbloc/data/repositories/ticket_repository.dart';
import 'package:flutter/material.dart';

part 'ticketbloc_event.dart';
part 'ticketbloc_state.dart';

class TicketblocBloc extends Bloc<TicketblocEvent, TicketblocState> {
  final TicketRepository ticketRepository;

  TicketblocBloc(this.ticketRepository) : super(TicketblocInitial());

  @override
  Stream<TicketblocState> mapEventToState(TicketblocEvent event) async* {
    if (event is AddScanData) {
      yield* _mapAddScanDataToState(event);
    } else if (event is SyncToServer) {
      yield* _mapSyncToServerState(event);
    }
  }

  Stream<TicketblocState> _mapAddScanDataToState(AddScanData event) async* {
    final newScan = ScanData(event.qrCode, DateTime.now(), false);
    yield TicketdataUpdate(scanList: List.from(state.scanList)..add(newScan));
  }

  Stream<TicketblocState> _mapSyncToServerState(SyncToServer event) async* {
    try {
      //tambahkan logika untuk menyinkronkan ke server di sini
      yield TicketdataUpdate(scanList: List.from(state.scanList)..remove(event.scanData));
    } catch (error) {
      yield TicketblocError(error.toString());
    }
  }
}

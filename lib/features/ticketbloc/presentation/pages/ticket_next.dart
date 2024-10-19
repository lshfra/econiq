import '../../data/repositories/ticket_repository.dart';
import '../bloc/ticketbloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class TicketNext extends StatelessWidget {
  const TicketNext({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TicketblocBloc(TicketRepository()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('List Tiket Scan', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            }, 
            ),
        ),
        body: Padding(padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<TicketblocBloc, TicketblocState>(
          builder: (context, state) {
            if (state is TicketblocError) {
            return Center(
              child: Text(state.message));
            }
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Text('Total: ${state.scanList.length}',
                      style: TextStyle(fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: Icon(Icons.download),
                      color: Colors.black,
                      onPressed: () {
                        //implementasi download pdf
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(child: ListView.builder(
                  itemCount: state.scanList.length,
                  itemBuilder: (context, index) {
                    final scan = state.scanList[index];
                    return Card(
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: const  Icon(Icons.confirmation_num,
                        color: Colors.green,
                        ),
                        title: Text('Tiket terusan: ${scan.isSynced ? "Terferifikasi" : "Belum Terverifikasi"}'),
                        subtitle: Text('Waktu ${DateFormat('dd MM yy, HH:mm:ss').format(scan.scanTime)}'
                        ),
                        trailing: scan.isSynced ? const Icon(Icons.check_circle,
                        color: Colors.green) : 
                        IconButton(  
                          icon: const Icon(
                            Icons.sync_problem, 
                          color: Colors.red, 
                          ),
                          onPressed: () {
                            context.read<TicketblocBloc>().add(SyncToServer(scan));
                          },
                          ),
                      ),
                    );
                  },
                ),
                ),
              ],
            );
          },
        ),
        ),
      ),
    );
  }
}
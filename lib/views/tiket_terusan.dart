import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class TiketTerusanPage extends StatefulWidget {
  const TiketTerusanPage({super.key});

  @override
  _TiketTerusanPageState createState() => _TiketTerusanPageState();
}

class _TiketTerusanPageState extends State<TiketTerusanPage> {
  final DateTime currentDate = DateTime.now();
  late String _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = _formatTime(DateTime.now());
    _updateTime();
  }

  String _formatTime(DateTime time) {
    return DateFormat('HH:mm:ss').format(time);
  }

  void _updateTime() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (mounted) {
        setState(() {
          _currentTime = _formatTime(DateTime.now());
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Laporan Tiket Terusan',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF016236),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Tanggal dan waktu dengan desain estetik
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDateCard(),
                  _buildTimeCard(),
                ],
              ),
              const SizedBox(height: 20),

              // Daftar (ListView) untuk menampilkan data statistik tiket
              const Text(
                'Statistik Kunjungan Wisatawan',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF016236),
                ),
              ),
              const SizedBox(height: 10),

              // Data statistik dalam bentuk list
              _buildStatisticList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateCard() {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              const Icon(Icons.calendar_today, color: Color(0xFF016236)),
              const SizedBox(width: 10),
              Text(
                DateFormat('dd MMMM yyyy').format(currentDate),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF016236),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeCard() {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              const Icon(Icons.access_time, color: Color(0xFF016236)),
              const SizedBox(width: 10),
              Text(
                _currentTime,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF016236),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membuat daftar statistik
  Widget _buildStatisticList() {
    // Data dummy, sesuaikan dengan data aslinya nanti
    final List<Map<String, dynamic>> statistikData = [
      {'jenisTiket': 'Tiket Terusan', 'jumlah': 25},
      {'jenisTiket': 'Tiket P7', 'jumlah': 20},
    ];

    return ListView.builder(
      shrinkWrap: true,  // Agar ListView dapat menyesuaikan tinggi
      physics: const NeverScrollableScrollPhysics(),  // Nonaktifkan scroll internal
      itemCount: statistikData.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: Icon(Icons.confirmation_number, color: Colors.green[400]),
            title: Text(
              statistikData[index]['jenisTiket'],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Text(
              '${statistikData[index]['jumlah']} tiket',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
            ),
          ),
        );
      },
    );
  }
}

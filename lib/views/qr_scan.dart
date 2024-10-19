import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QrScan extends StatefulWidget {
  const QrScan({super.key});

  @override
  State<QrScan> createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool isFlashOn = false;
  bool isBackCamera = true;
  bool hasScaned = false;

  @override
  void reassemble() {
    super.reassemble();
    // Restart kamera ketika aplikasi di-reassemble (misalnya ketika minimize dan kembali)
    if (controller != null) {
      controller!.pauseCamera();
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Scan QR Tiket"
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(isFlashOn ? Icons.flash_on : Icons.flash_off),
            onPressed: () async {
              // Aksi untuk tombol pengaturan (opsional)
              await controller?.toggleFlash();
              setState(() {
                isFlashOn = !isFlashOn;
              });
            },
          ),
          IconButton(icon: Icon(Icons.cameraswitch),
          onPressed: () async {
            await controller?.flipCamera();
            setState(() {
              isBackCamera = !isBackCamera;
            });
          }, 
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.blue,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 250, // Ukuran area untuk pemindaian
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: hasScaned ? const SizedBox.shrink()
                  : const Text('Arahkan QR code ke kotak untuk memindai'),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      if (!hasScaned) {
      setState(() {
        result = scanData;
        hasScaned = true;
      });
      _validateQRCode(scanData.code);
      }
    });
  }



Future<void> _validateQRCode(String? qrCode) async {
  final url = Uri.parse('https://econique-perhutani-default-rtdb.firebaseio.com/falidasiLULU.json?auth=oahZAHcmPhj9gDp0HdkDFaCuGRt2pPZrX05YsdIl');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      //cek apakah qr code dipindai ada di db

      if (data.containsKey(qrCode)) {
        _showResultDialog(qrCode, isValid: true);
      } else {
        _showResultDialog(qrCode, isValid: false);
      }
      } else {
        _showResultDialog("Error connecting to the server", isValid: false);
      }
      } catch (e) {
        _showResultDialog("failed to connect to the server", isValid: false);
      }
    }
    //menampilkan dialog berdasarkan hasil validasi 
    void _showResultDialog(String? qrCode, {required bool isValid}){
      showDialog(context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isValid ? "QR berhasil terverifikasi" : "QR tidak valid", textAlign: TextAlign.center,
        ),
          content: Text("Data: $qrCode"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                controller?.resumeCamera();
                setState(() {
                  hasScaned = false;
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

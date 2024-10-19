import 'package:checker/features/qrscanbloc/presentation/bloc/qrscanbloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanPage extends StatefulWidget {
  const QrScanPage({super.key});

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool hasScaned = false;
  bool isFlashOn =false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Scan QR Ticket"),
        backgroundColor: const Color(0xFF016236),
        actions: [
          IconButton(icon: Icon(isFlashOn ? Icons.flash_off : Icons.flash_on,
          ), 
          onPressed: () {
            setState(() {
              isFlashOn = !isFlashOn;
              if (controller != null) {
                controller!.toggleFlash();
              }
            });
          }, )
        ],
      ),
      body: BlocConsumer<QrscanblocBloc, QrscanblocState>(
        listener: (context, state) {
          if (state is QrscanblocSuccess) {
            _showResultDialog(state.result.qrCode,
                isValid: state.result.isValid);
          }
        },
        builder: (context, state) {
          return Column(
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
                    cutOutSize: 250,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: hasScaned
                      ? const SizedBox.shrink()
                      : const Text("Arahkan Qr code ke kota untuk memindai"),
                ),
              ),
            ],
          );
        },
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
          hasScaned = true;
        });

        BlocProvider.of<QrscanblocBloc>(context)
            .add(ValidateQrCode(qrCode: scanData.code!));
      }
    });
  }

    void _showResultDialog(String qrCode, {required bool isValid}) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(isValid
                ? "Qr berhasil terverifikasi"
                : "QR tidak berhasil terberifikasi"),
            content: Text("Data: $qrCode"),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                  controller?.resumeCamera();
                  setState(
                    () {
                      hasScaned = false;
                    },
                  );
                },
              ),
            ],
          );
        },
      );
    }
  }

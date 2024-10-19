import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:checker/features/qrscanbloc/data/models/qr_scan_model.dart';

class QrScanRepository {
  final String _baseUrl =
      'https://econique-perhutani-default-rtdb.firebaseio.com/falidasiLULU.json?auth=oahZAHcmPhj9gDp0HdkDFaCuGRt2pPZrX05YsdIl';

  Future<QrScanModel> validateQrCode(String qrCode) async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data.containsKey(qrCode)) {
        return QrScanModel(qrCode: qrCode, isValid: true);
      } else {
        return QrScanModel(qrCode: qrCode, isValid: false);
      }
    } else {
      throw Exception("Failed to connect to server");
    }
  }
}

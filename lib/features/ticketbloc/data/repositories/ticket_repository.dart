import 'dart:convert';
import 'package:http/http.dart' as http;

class TicketRepository {
  final String apiUrl = 'https://your-api-url.com/validate'; // Ganti dengan URL API kamu

  Future<bool> validateQrCode(String qrCode) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode({'qrCode': qrCode}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['valid']; //misal response JSON mengandung kunci valid
    } else {
      throw Exception('Failed to validate QR code');
    }
  }
}
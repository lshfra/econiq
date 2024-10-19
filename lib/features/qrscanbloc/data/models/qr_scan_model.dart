class QrScanModel {
  final String qrCode;
  final bool isValid;

  QrScanModel({required this.qrCode, required this.isValid});

  factory QrScanModel.fromJson(Map<String, dynamic> json) {
    return QrScanModel(qrCode: json['qrCode'], isValid: json['isValid'],
    );
  }
}
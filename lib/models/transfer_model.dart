class TransferModel {
  String id;
  final String name;
  final int value;
  final DateTime dateTransfer;

  TransferModel({
    this.id = '',
    required this.name,
    required this.value,
    required this.dateTransfer,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'value': value,
      'dateTransfer': dateTransfer,
    };
  }

  static TransferModel fromJson(Map<String, dynamic> json) => TransferModel(
        id: json['id'],
        name: json['name'],
        value: json['value'],
        dateTransfer: json['dateTransfer'].toDate(),
      );
}

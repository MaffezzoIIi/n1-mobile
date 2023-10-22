import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transfer extends StatelessWidget {
  Transfer({Key? key}) : super(key: key);

  final contaDestino = TextEditingController();
  final valorTransfer = TextEditingController();
  final dataController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Transferência  '),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: contaDestino,
                decoration: const InputDecoration(
                  labelText: 'Conta de destino',
                  hintText: 'Número da conta',
                ),
              ),
              TextField(
                controller: valorTransfer,
                decoration: const InputDecoration(
                  labelText: 'Valor',
                  hintText: '0.00',
                ),
                keyboardType: TextInputType.number,
              ),
              // create a date picker widget
              DateTimeField(
                controller: dataController,
                decoration: const InputDecoration(
                  labelText: 'Data da transferência',
                  hintText: 'dd/mm/aaaa',
                ),
                onShowPicker: (context, currentValue) async {
                  final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                    initialDate: currentValue ?? DateTime.now(),
                  );
                  return date;
                },
                format: DateFormat('yyyy-MM-dd'),
              ),

              ElevatedButton(
                onPressed: () {
                  final name = contaDestino.text;
                  final value = int.tryParse(valorTransfer.text) ?? 0;
                  final dateTransfer = dataController.text;

                  final TransferModel transferModel = TransferModel(
                    name: name,
                    value: value,
                    dateTransfer: DateTime.parse(dateTransfer),
                  );

                  createUser(transferModel);
                },
                child: const Text('Transferir'),
              ),
            ],
          ),
        ));
  }

  void setState(Null Function() param0) {}

  Future createUser(TransferModel transferModel) async {
    final docTransfer =
        FirebaseFirestore.instance.collection('transfers').doc();
    transferModel.id = docTransfer.id;

    final json = transferModel.toJson();

    await docTransfer.set(json);
  }
}

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

  factory TransferModel.fromMap(Map<String, dynamic> map) {
    return TransferModel(
      name: map['name'] as String,
      value: map['value'] as int,
      dateTransfer: map['dateTransfer'] as DateTime,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'value': value,
      'dateTransfer': dateTransfer,
    };
  }
}

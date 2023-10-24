import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:n1mobile/models/transfer_model.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class CreateTransfer extends StatefulWidget {
  const CreateTransfer({Key? key}) : super(key: key);

  @override
  CreateTransferState createState() => CreateTransferState();
}

class CreateTransferState extends State<CreateTransfer> {
  final _formKey = GlobalKey<FormState>();
  final _contaDestinoController = TextEditingController();
  final _valorTransferController = TextEditingController();
  final _dataController = TextEditingController();

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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _contaDestinoController,
                  decoration: const InputDecoration(
                    labelText: 'Número da conta',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Número da conta obrigatório';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _valorTransferController,
                  decoration: const InputDecoration(
                    labelText: 'Valor',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Valor obrigatório';
                    }
                    return null;
                  },
                ),
                DateTimeField(
                  controller: _dataController,
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
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final transferModel = TransferModel(
                        name: _contaDestinoController.text,
                        value: int.parse(_valorTransferController.text),
                        dateTransfer: DateTime.parse(_dataController.text),
                      );

                      createUser(transferModel);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Transferência realizada')),
                      );

                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Transferir'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future createUser(TransferModel transferModel) async {
    final docTransfer =
        FirebaseFirestore.instance.collection('transfers').doc();
    transferModel.id = docTransfer.id;

    final json = transferModel.toJson();

    await docTransfer.set(json);
  }
}

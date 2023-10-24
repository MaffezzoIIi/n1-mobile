import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:n1mobile/models/transfer_model.dart';
import 'package:n1mobile/pages/Transfer/create_transfer.dart';

class AlterTransfers extends StatefulWidget {
  const AlterTransfers({super.key});

  @override
  State<StatefulWidget> createState() => AlterTransfersState();
}

class AlterTransfersState extends State<AlterTransfers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Transferências'),
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
      body: StreamBuilder<List<TransferModel>>(
          stream: readTransfers(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("Erro ao carregar");
            } else if (snapshot.hasData) {
              final transfers = snapshot.data!;

              return ListView(
                children: transfers.map(buildTransfer).toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CreateTransfer(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Stream<List<TransferModel>> readTransfers() => FirebaseFirestore.instance
      .collection("transfers")
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => TransferModel.fromJson(doc.data()))
          .toList());

  Widget buildTransfer(TransferModel transfer) {
    final contaDestinoController = TextEditingController(text: transfer.name);
    final valorTransferController =
        TextEditingController(text: transfer.value.toString());
    final dataController =
        TextEditingController(text: transfer.dateTransfer.toString());

    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(transfer.value.toString()),
        subtitle: Text(transfer.name.toString()),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                deleteTransfer(transfer.id);
              },
              icon: const Icon(Icons.delete),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Editar transferência"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Nome',
                            ),
                            controller: contaDestinoController,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Nome obrigatório';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Valor',
                            ),
                            keyboardType: TextInputType.number,
                            controller: valorTransferController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Valor obrigatório';
                              }
                              return null;
                            },
                          ),
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
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Cancelar"),
                        ),
                        TextButton(
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection("transfers")
                                .doc(transfer.id)
                                .update({
                              "name": contaDestinoController.text,
                              "value":
                                  int.tryParse(valorTransferController.text),
                              "dateTransfer":
                                  DateTime.tryParse(dataController.text),
                            });

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Transferência atualizada')),
                            );

                            Navigator.of(context).pop();
                          },
                          child: const Text("Salvar"),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
      ),
    );
  }

  void deleteTransfer(String id) {
    FirebaseFirestore.instance.collection("transfers").doc(id).delete();
  }
}

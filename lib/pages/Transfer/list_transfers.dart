import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:n1mobile/models/transfer_model.dart';
import 'package:n1mobile/pages/Transfer/create_transfer.dart';

class ListTransfers extends StatefulWidget {
  const ListTransfers({super.key});

  @override
  State<StatefulWidget> createState() => ListTransfersState();
}

class ListTransfersState extends State<ListTransfers> {
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
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(transfer.value.toString()),
        subtitle: Text(transfer.dateTransfer.toString()),
      ),
    );
  }
}

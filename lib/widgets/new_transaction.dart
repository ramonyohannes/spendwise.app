import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  NewTransaction(this.addTx, {super.key});

  final _textController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(hintText: "Title"),
              controller: _textController,
            ),
            TextField(
              decoration: const InputDecoration(hintText: "Amount"),
              controller: _amountController,
            ),
            TextButton(
              onPressed: () => addTx(
                _textController.text,
                double.parse(_amountController.text),
              ),
              child: const Text("Add Transaction"),
            ),
          ],
        ),
      ),
    );
  }
}

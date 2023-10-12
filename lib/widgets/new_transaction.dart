import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  NewTransaction(this.addTx, {super.key});

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void submitTx(BuildContext context) {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTx(
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context).pop();
  }

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
              controller: _titleController,
              onSubmitted: (_) => submitTx(context),
            ),
            TextField(
              decoration: const InputDecoration(hintText: "Amount"),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitTx(context),
            ),
            TextButton(
              onPressed: () => submitTx(context),
              child: const Text("Add Transaction"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Function deleteTransaction;
  final double transactionAmount;
  final String transctionTitle;
  final DateTime tranactionDate;
  final String transactionId;
  const TransactionItem(this.deleteTransaction, this.transactionAmount,
      this.transctionTitle, this.transactionId, this.tranactionDate,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          maxRadius: 30,
          backgroundColor: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "\$${transactionAmount.toStringAsFixed(1)}",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
        title: Text(
          transctionTitle,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(
            tranactionDate,
          ),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: IconButton(
          onPressed: () => deleteTransaction(transactionId),
          icon: Icon(
            Icons.delete,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
    );
  }
}

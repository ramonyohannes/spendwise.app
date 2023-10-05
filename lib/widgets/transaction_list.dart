import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spendwise/model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  const TransactionList(this.userTransactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...userTransactions.map((tx) {
          return Card(
            elevation: 5,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.purple,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "\$${tx.amount}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tx.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMd().format(tx.date),
                    )
                  ],
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}

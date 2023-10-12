import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spendwise/model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;
  const TransactionList(this.userTransactions, this.deleteTransaction,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: userTransactions.isEmpty
          ? Center(
              child: Column(
                children: [
                  Text(
                    "No Transactions !",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 300,
                    child: Image.asset(
                      "lib/assets/images/waiting.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: userTransactions.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      maxRadius: 30,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "\$${userTransactions[index].amount.toStringAsFixed(1)}",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                    title: Text(
                      userTransactions[index].title,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(
                        userTransactions[index].date,
                      ),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    trailing: IconButton(
                      onPressed: () =>
                          deleteTransaction(userTransactions[index].id),
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

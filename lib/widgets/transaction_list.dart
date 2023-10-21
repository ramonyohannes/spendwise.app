import 'package:flutter/material.dart';
import 'package:spendwise/model/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;
  const TransactionList(this.userTransactions, this.deleteTransaction,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: userTransactions.isEmpty
          ? LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Center(
                  child: Column(
                    children: [
                      Text(
                        "No Transactions !",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.05,
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.5,
                        child: Image.asset(
                          "lib/assets/images/waiting.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          : ListView.builder(
              itemCount: userTransactions.length,
              itemBuilder: (BuildContext context, int index) {
                return TransactionItem(
                    deleteTransaction,
                    userTransactions[index].amount,
                    userTransactions[index].title,
                    userTransactions[index].id,
                    userTransactions[index].date);
              },
            ),
    );
  }
}

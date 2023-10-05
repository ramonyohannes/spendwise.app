import 'package:flutter/material.dart';

import '../model/transaction.dart';
import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({super.key});

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: DateTime.now().toString(),
      title: "New Shoe",
      amount: 23.3,
      date: DateTime.now(),
    ),
    Transaction(
      id: DateTime.now().toString(),
      title: "Kitchen Pan",
      amount: 52.1,
      date: DateTime.now(),
    ),
    Transaction(
      id: DateTime.now().toString(),
      title: "Pair Trousers",
      amount: 98.4,
      date: DateTime.now(),
    ),
  ];

  void addTransaction(String txTitle, double txAmount) {
    var newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}

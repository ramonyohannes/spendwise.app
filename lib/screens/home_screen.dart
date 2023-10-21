import 'package:flutter/material.dart';
import '../model/transaction.dart';
import '../widgets/new_transaction.dart';

import '../widgets/transaction_list.dart';
import '../widgets/chart.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];

  void addTransaction(String txTitle, double txAmount, DateTime selectedDate) {
    var newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: selectedDate,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String transactionId) {
    setState(() {
      _userTransactions.removeWhere(
        (traId) => traId.id == transactionId,
      );
    });
  }

  void startAddNewTrasaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return NewTransaction(addTransaction);
      },
    );
  }

  List<Transaction> get _recentTransaction {
    return _userTransactions
        .where((tx) =>
            tx.date.isAfter(DateTime.now().subtract(const Duration(days: 7))))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: const Text(
        'SpendWise',
      ),
      actions: [
        IconButton(
          onPressed: () => startAddNewTrasaction(context),
          icon: const Icon(Icons.add),
          color: Colors.black,
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top -
                      MediaQuery.of(context).padding.bottom) *
                  0.25,
              child: Chart(_recentTransaction),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top -
                      MediaQuery.of(context).padding.bottom) *
                  0.75,
              child: TransactionList(_userTransactions, _deleteTransaction),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => startAddNewTrasaction(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

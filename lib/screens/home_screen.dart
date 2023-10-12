import 'package:flutter/material.dart';
import '../model/transaction.dart';
import '../widgets/new_transaction.dart';

import '../widgets/transaction_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void startAddNewTrasaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return NewTransaction(addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SpendWise',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => startAddNewTrasaction(context),
            icon: const Icon(Icons.add),
            color: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Card(
              child: Text("Chart"),
            ),
            TransactionList(_userTransactions),
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

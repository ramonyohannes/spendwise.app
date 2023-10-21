import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spendwise/model/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  const Chart(this.recentTransactions, {super.key});

  List<Map<String, Object>> get recentTransaction {
    DateTime today = DateTime.now();

    return List.generate(7, (index) {
      DateTime date = today.subtract(Duration(days: index));
      double dailyTotal = recentTransactions
          .where((transaction) =>
              transaction.date.year == date.year &&
              transaction.date.month == date.month &&
              transaction.date.day == date.day)
          .fold(0, (previous, transaction) => previous + transaction.amount);

      return {
        "Day": DateFormat.E().format(date).substring(0, 1),
        "Amount": dailyTotal,
      };
    }).reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Column()],
        ),
      ),
    );
  }
}

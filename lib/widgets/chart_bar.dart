import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String transactionPrice;
  final String transactionDate;
  final double hightPersontage;

  const ChartBar(
      this.transactionDate, this.transactionPrice, this.hightPersontage,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          FittedBox(
            fit: BoxFit.cover,
            child: Text(transactionPrice.toString()),
          ),
          const SizedBox(height: 5),
          Container(
            height: 80,
            width: 15,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: hightPersontage,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Text(transactionDate)
        ],
      ),
    );
  }
}

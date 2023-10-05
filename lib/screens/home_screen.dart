import 'package:flutter/material.dart';

import '../widgets/user_transaction.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Column(
        children: const [
          Card(
            child: Text("Chart"),
          ),
          UserTransaction(),
        ],
      ),
    );
  }
}

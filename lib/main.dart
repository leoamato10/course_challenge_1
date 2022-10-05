import 'package:course_challenge_1/models/transaction.dart';
import 'package:course_challenge_1/widgets/chart.dart';
import 'package:course_challenge_1/widgets/new_transaction.dart';
import 'package:course_challenge_1/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePagetState();
}

class _MyHomePagetState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(id: "1", amount: 10, date: DateTime.now(), title: "new Shoes"),
    // Transaction(
    //     id: "2", amount: 20, date: DateTime.now(), title: "semanal groceries")
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        amount: amount,
        date: DateTime.now(),
        title: title);

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: ((_) {
          return GestureDetector(
            child: NewTransaction(_addNewTransaction),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Personal Expenses"),
          actions: [
            IconButton(
                onPressed: () => _startNewTransaction(context),
                icon: Icon(Icons.add))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Chart(_recentTransactions),
                TransactionList(_userTransactions),
              ]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startNewTransaction(context),
        ));
  }
}

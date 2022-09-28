import 'package:course_challenge_1/models/transaction.dart';
import 'package:course_challenge_1/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Transaction> transactions = [
      Transaction(
          id: "1", amount: 10, date: DateTime.now(), title: "new Shoes"),
      Transaction(
          id: "2", amount: 20, date: DateTime.now(), title: "semanal groceries")
    ];

    // String titleInput = "";
    // String amountInput = "";

    final titleController = TextEditingController();
    final amountController = TextEditingController();

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text("My Flutter App")),
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Card(
                    color: Colors.blue,
                    elevation: 5,
                    child: Text('CHART!'),
                  ),
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextField(
                          decoration: InputDecoration(labelText: "Title"),
                          controller: titleController,
                          // onChanged: (val) {
                          //   titleInput = val;
                          // },
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: "Amount"),
                          controller: amountController,
                          // onChanged: (val) {
                          //   amountInput = val;
                          // },
                        ),
                        ElevatedButton(
                          onPressed: () {
                            print(titleController);
                          },
                          child: Text("Add transaction"),
                        )
                      ],
                    ),
                  ),
                ),
                TransactionList()
              ])),
    );
  }
}

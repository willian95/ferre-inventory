import 'package:flutter/material.dart';
import 'package:inventory/components/item_list_widget.dart';
import 'package:inventory/pages/scanner.dart';

class Landing extends StatefulWidget {
  static String id = 'scanner';

  const Landing({super.key});

  @override
  State<StatefulWidget> createState() => _Landing();
}

class _Landing extends State<Landing> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ItemListWidget(title: "Clavos", code: "ARB-25", price: 3),
              ]
            )   
          ),
        ),
        bottomNavigationBar: Container(
          height: 90,
          color: Colors.orange[900],
          child: Center(
            child: ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Scanner()),
                )
              },
              child: const Text("Scanner"),
            ),
          ),
        ),
      )
    );
  }
}

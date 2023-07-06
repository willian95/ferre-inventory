import 'package:flutter/material.dart';

class ItemListWidget extends StatelessWidget {
  final String title;
  final String code;
  final double price;

  const ItemListWidget({
    Key? key,
    required this.title,
    required this.code,
    required this.price
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      child: ListTile(
        shape: RoundedRectangleBorder( //<-- SEE HERE
          side: const BorderSide(width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(title),
        subtitle: Text(code),
        trailing: Text("\$ $price", style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

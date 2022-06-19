import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/screens/category_screen.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({Key? key, required this.snapshot}) : super(key: key);

  final DocumentSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final data = snapshot.data() as Map<String, dynamic>;
    return ListTile(
      leading: CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(data['icon']),
      ),
      title: Text(data['title']),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => CategoryScreen(snapshot: snapshot)),
        );
      },
    );
  }
}

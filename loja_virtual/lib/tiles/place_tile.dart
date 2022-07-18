import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceTile extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;

  const PlaceTile({Key? key, required this.documentSnapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = documentSnapshot.data() as Map<String, dynamic>;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 100.0,
            child: Image.network(
              data["image"],
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data["title"],
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                      color: Theme.of(context).primaryColor),
                ),
                Text(
                  data["address"],
                  textAlign: TextAlign.start,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                      onPressed: () {
                        launchUrl(Uri.parse(
                            "https://www.google.com/maps/search/?api=1&query=${data["lat"]},${data["long"]}"));
                      },
                      child: const Text("Ver no Mapa"),
                      textColor: Colors.blue,
                      padding: EdgeInsets.zero,
                    ),
                    FlatButton(
                      onPressed: () {
                        launchUrl(Uri.parse("tel:${data["phone"]}"));
                      },
                      child: const Text("Ligar"),
                      textColor: Colors.blue,
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

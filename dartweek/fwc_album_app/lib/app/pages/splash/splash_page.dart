import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/styles/colors_app.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text('Splash Page'),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyles.i.yellowButton,
            child: Text("Salvar"),
          ),
          OutlinedButton(
            onPressed: () {},
            style: ButtonStyles.i.yellowOutlineButton,
            child: Text("Salvar"),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyles.i.primaryButton,
            child: Text("Salvar"),
          ),
          OutlinedButton(
            onPressed: () {},
            style: ButtonStyles.i.primaryOutlineButton,
            child: Text("Salvar"),
          ),
          TextField()
        ],
      )),
    );
  }
}

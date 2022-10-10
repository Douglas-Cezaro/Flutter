import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/helpers/loader.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/core/ui/widgets/rounded_button.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with Loader {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Page'),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              showLoader();

              await Future.delayed(Duration(seconds: 2));

              hideLoader();
            },
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
          TextField(),
          Button(
            style: ButtonStyles.i.primaryButton,
            labelStyle: context.textStyles.textPrimaryFontBold,
            label: "Salvar",
            onPressed: (() {}),
          ),
          RoundedButton(icon: Icons.add_sharp, onPressed: () {})
        ],
      )),
    );
  }
}

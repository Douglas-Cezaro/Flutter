import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_intro/value_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GetX Intro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final textController = TextEditingController();

  final valueController = ValueController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Valor
            GetX<ValueController>(
              init: valueController,
              builder: (ctrl) {
                return Text("Valor definido: ${ctrl.definedValue}");
              },
            ),
            // Campo de texto
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: TextField(
                controller: textController,
              ),
            ),
            // Botão
            GetX<ValueController>(
                init: valueController,
                builder: (ctrl) {
                  return ctrl.isLoading.value
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            String value = textController.text;
                            ctrl.setValue(value);
                          },
                          child: const Text("Confirmar"),
                        );
                })
          ],
        ),
      ),
    );
  }
}

import 'package:bq_health/src/components/form_imc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: containerTitle,
              width: MediaQuery.of(context).size.width,
              child: const Center(child: Text('Cáculo IMC', style: styleText,
              )),
            ),
            Container(
              decoration: containerForm,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: FormImc(

              ),
            ),
          ],
        ),
      ),
    );
  }
}

const containerTitle = BoxDecoration(
  color: Color.fromARGB(255, 255, 255, 255),
);

const containerForm = BoxDecoration(
    color: Color.fromARGB(255, 176, 215, 246),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15),
    ));

const styleText = TextStyle(
  fontSize: 24,
);

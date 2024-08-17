import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FormImc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormImcPage(),
    );
  }
}

class FormImcPage extends StatefulWidget {
  @override
  _FormImcPageState createState() => _FormImcPageState();
}

class _FormImcPageState extends State<FormImcPage> {

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  late String gResultSum;
  late String gResultText;

  Future<void> sendDataToAPI() async {

    final double height = double.tryParse(heightController.text) ?? 0;
    final double weight = double.tryParse(weightController.text) ?? 0;

    
    final response = await http.post(
      Uri.parse('http://172.16.2.37:3001/api/Calculeitor/v1/sumIMC'),
      headers: {
        "content-type" : "application/json",
        "accept": "application/json"
      },
      body: jsonEncode(
        <String, double>
        {
            "height": height,
            "weight": weight
        }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
     
      setState(() {
        gResultSum = jsonResponse['res']['resultSum'].toString();
        gResultText = jsonResponse['res']['resultText'];
      });
    } else {
      throw Exception('Falha ao carregar os dados.');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gResultSum = "";
    gResultText = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: heightController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Altura',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: weightController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Peso',
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: sendDataToAPI,
                icon: Icon(Icons.add, size: 18),
                label: Text("Enviar"),
              ),
            ),
            Text(
              gResultSum
            ),
            Text(
              gResultText
            ),
          ],
        ),
      ),
    );
  }
}

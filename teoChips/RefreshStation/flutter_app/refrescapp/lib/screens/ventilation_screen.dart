import 'package:flutter/material.dart';

class VentilationScreen extends StatelessWidget {
  const VentilationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Seleccione su brisa refrescante',
          style: TextStyle(color: Colors.white), // Ajuste del color del texto
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(child: VentilationButton(text: '15 seg')),
            SizedBox(height: 16.0),
            Expanded(child: VentilationButton(text: '30 seg')),
            SizedBox(height: 16.0),
            Expanded(child: VentilationButton(text: '1 min')),
            SizedBox(height: 16.0),
            Expanded(child: VentilationButton(text: '2 min')),
            SizedBox(height: 16.0),
            Expanded(child: VentilationButton(text: 'Atomizar agua')),
          ],
        ),
      ),
    );
  }
}

class VentilationButton extends StatelessWidget {
  final String text;
  const VentilationButton({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16.0),
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            //side: BorderSide(color: Colors.tealAccent),
          ),
        ),
        onPressed: () {
          print(text);
        },
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.greenAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HydrationScreen extends StatelessWidget {
  const HydrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Seleccione la cantidad de agua refrescante',
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
            Expanded(child: HydrationButton(text: '100 ml')),
            SizedBox(height: 16.0),
            Expanded(child: HydrationButton(text: '250 ml')),
            SizedBox(height: 16.0),
            Expanded(child: HydrationButton(text: '350 ml')),
          ],
        ),
      ),
    );
  }
}

class HydrationButton extends StatelessWidget {
  final String text;
  const HydrationButton({required this.text, super.key});

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
          ),
        ),
        onPressed: () {
          print(text);
        },
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.blueAccent],
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

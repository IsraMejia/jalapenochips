import 'package:flutter/material.dart';
import '../screens/ventilation_screen.dart';

class VentSection extends StatelessWidget {
  const VentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
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
            print("Ventilar");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VentilationScreen()),
            );
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.air, size: 50.0, color: Colors.white),
                  SizedBox(width: 16.0),
                  Text(
                    'Ventilar',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

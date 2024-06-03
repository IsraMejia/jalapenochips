import 'package:flutter/material.dart';
import '../widgets/water_section.dart';
import '../widgets/vent_section.dart';

class RefreshStation extends StatelessWidget {
  const RefreshStation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Refresh Station',
          style: TextStyle(color: Colors.white), // Ajuste del color del texto
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings,
                color: Colors.white), // Ajuste del color del ícono
            onPressed: () {
              // Acción del botón de configuración
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            WaterSection(),
            SizedBox(height: 16.0),
            VentSection(),
          ],
        ),
      ),
    );
  }
}

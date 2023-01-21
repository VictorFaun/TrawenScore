import 'package:flutter/material.dart';

class Settings extends StatefulWidget {

  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configuración"),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: CheckboxListTile(
              title: const Text('Diferencia de 2 puntos'),
              value: true,
              onChanged: (bool? value) {},
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(30, 5, 10, 10),
            child: const Text("Nro maximo de puntos: "),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(30, 5, 10, 10),
            child: const Text("Nombre equipo local: "),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(30, 5, 10, 10),
            child: const Text("Nombre equipo visita: "),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

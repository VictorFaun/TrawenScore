import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Config extends StatefulWidget {
  const Config({super.key});

  @override
  State<Config> createState() => _ConfigState();
}

class _ConfigState extends State<Config> {

  final _nameLocal = TextEditingController(text: "Local");
  final _nameVisita = TextEditingController(text: "Visita");
  final _maxPoint = TextEditingController(text: "25");
  bool _differenceTwo = true;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    
    Object? parametros = ModalRoute.of(context)?.settings.arguments;
    
    if(parametros != null){
      (parametros as Map);
      setState(() {
        _nameLocal.text = (parametros)['nameLocal'];
        _nameVisita.text = (parametros)['nameVisita'];
        _maxPoint.text = (parametros)['maxPoint'];
        _differenceTwo = (parametros)['differenceTwo'];
        
      });
    }

    return WillPopScope(
        onWillPop: () => _onWillPop(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green[900],
            title: const Text("Configuración"),
            actions: [
              IconButton(
                onPressed: () => _onSave(),
                icon: SvgPicture.asset('assets/floppy-disk-regular.svg',
                    color: Colors.white, height: 20),
              )
            ],
            leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/home");
              },
              icon: SvgPicture.asset('assets/angle-left-solid.svg',
                  color: Colors.white, height: 20),
            ),
          ),
          body: ListView(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: CheckboxListTile(
                  title: const Text('Diferencia de 2 puntos'),
                  value: _differenceTwo,
                  onChanged: (bool? value) {
                    setState(() {
                      _differenceTwo = !_differenceTwo;
                    });
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 5, 10, 10),
                child: const Text("Numero maximo de puntos: "),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: TextFormField(
                  controller: _maxPoint,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
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
                child: TextFormField(
                  controller: _nameLocal,
                  decoration: const InputDecoration(
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
                child: TextFormField(
                  controller: _nameVisita,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                child: ElevatedButton(
                    onPressed: () => _onSave(), child: const Text("Guardar")),
              ),
            ],
          ),
        ));
  }

  _onSave() {
    Navigator.pushNamed(context, "/home", arguments: {"nameLocal": _nameLocal.text, "nameVisita":_nameVisita.text, "maxPoint": _maxPoint.text, "differenceTwo":_differenceTwo});
    
  }

  _onWillPop() {
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: const Text("¿Seguro que quieres volver?"),
            content: const Text("Tienes configuración sin guardar!"),
            actions: [
              FloatingActionButton.small(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("No"),
              ),
              FloatingActionButton.small(
                onPressed: () {
                  Navigator.pushNamed(context, "/home");
                },
                child: const Text("Si"),
              ),
            ],
          );
        }));
  }
}

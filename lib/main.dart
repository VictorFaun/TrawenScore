import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [],
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _countLocal = 0;
  int _countVista = 0;
  int _maxPoint = 25;
  String _nameLocal = "Local";
  String _nameVisita = "Visita";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fondo.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 30.0),
        child: Row(
          children: [
            marcadorIzq(context),
            settings(context),
            marcadorDer(context),
          ],
        ),
      ),
    );
  }

  Widget marcadorIzq(context) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 45,
              child: Center(
                child: Text(
                  _nameLocal,
                  style: const TextStyle(color: Colors.white, fontSize: 20, fontFamily: "YesevaOne"),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                child: FittedBox(
                  child: Text(
                    _countLocal.toString(),
                    style: const TextStyle(
                        color: Colors.white, fontFamily: "YesevaOne"),
                  ),
                ),
                onTap: () {
                  setState(() {
                    _countLocal++;
                  });
                },
                onLongPress: () {
                  setState(() {
                    if (_countLocal != 0) {
                      _countLocal--;
                    }
                  });
                },
              ),
            ),
            const SizedBox(
              height: 45,
              child: Center(
                child: Text(
                  "Ganador",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget marcadorDer(context) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 45,
              child: Center(
                child: Text(
                  _nameVisita,
                  style: const TextStyle(color: Colors.white, fontSize: 20, fontFamily: "YesevaOne"),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                child: FittedBox(
                  child: Text(
                    _countVista.toString(),
                    style: const TextStyle(
                        color: Colors.white, fontFamily: "YesevaOne"),
                  ),
                ),
                onTap: () {
                  setState(() {
                    _countVista++;
                  });
                },
                onLongPress: () {
                  setState(() {
                    if (_countVista != 0) {
                      _countVista--;
                    }
                  });
                },
              ),
            ),
            const SizedBox(
              height: 45,
              child: Center(
                child: Text(
                  "Ganador",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget settings(context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: 100.0,
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(10)),
      child: const Text("Settings"),
    );
  }
}

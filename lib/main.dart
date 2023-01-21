import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:trawenscore/settings.dart';

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
  int _countVisita = 0;

  int _setsLocal = 0;
  int _setsVisita = 0;

  int _maxPoint = 25;

  String _nameLocal = "Local";
  String _nameVisita = "Visita";

  bool _localWin = false;
  bool _visitaWin = false;

  bool _differenceTwo = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
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
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: (MediaQuery.of(context).size.height)),
                  width: 90,
                  height: 85,
                  child: Image.asset("assets/logoTrawenBorde.png"),
                ),
              ],
            ),
          ],
        ));
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
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "YesevaOne"),
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
                    if (!_localWin) {
                      _countLocal++;

                      if (_countLocal >= _maxPoint) {
                        if ((_countLocal - _countVisita) >= 2 ||
                            !_differenceTwo) {
                          _localWin = true;
                        } else {
                          _localWin = false;
                        }
                      } else {
                        _localWin = false;
                      }

                      if (_countVisita >= _maxPoint) {
                        if ((_countVisita - _countLocal) >= 2 ||
                            !_differenceTwo) {
                          _visitaWin = true;
                        } else {
                          _visitaWin = false;
                        }
                      } else {
                        _visitaWin = false;
                      }
                    }
                  });
                },
                onLongPress: () {
                  setState(() {
                    if (_countLocal != 0) {
                      _countLocal--;

                      if (_countLocal >= _maxPoint) {
                        if ((_countLocal - _countVisita) >= 2 ||
                            !_differenceTwo) {
                          _localWin = true;
                        } else {
                          _localWin = false;
                        }
                      } else {
                        _localWin = false;
                      }

                      if (_countVisita >= _maxPoint) {
                        if ((_countVisita - _countLocal) >= 2 ||
                            !_differenceTwo) {
                          _visitaWin = true;
                        } else {
                          _visitaWin = false;
                        }
                      } else {
                        _visitaWin = false;
                      }
                    }
                  });
                },
              ),
            ),
            _localWin
                ? SizedBox(
                    height: 45,
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _setsLocal++;
                            _countLocal = 0;
                            _countVisita = 0;
                            _localWin = false;
                            _visitaWin = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(4, 81, 5, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(8), // <-- Radius
                          ),
                        ),
                        child: const Text(
                          "Ganador",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(height: 45, child: null)
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
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "YesevaOne"),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                child: FittedBox(
                  child: Text(
                    _countVisita.toString(),
                    style: const TextStyle(
                        color: Colors.white, fontFamily: "YesevaOne"),
                  ),
                ),
                onTap: () {
                  setState(() {
                    if (!_visitaWin) {
                      _countVisita++;

                      if (_countVisita >= _maxPoint) {
                        if ((_countVisita - _countLocal) >= 2 ||
                            !_differenceTwo) {
                          _visitaWin = true;
                        } else {
                          _visitaWin = false;
                        }
                      } else {
                        _visitaWin = false;
                      }

                      if (_countLocal >= _maxPoint) {
                        if ((_countLocal - _countVisita) >= 2 ||
                            !_differenceTwo) {
                          _localWin = true;
                        } else {
                          _localWin = false;
                        }
                      } else {
                        _localWin = false;
                      }
                    }
                  });
                },
                onLongPress: () {
                  setState(() {
                    if (_countVisita != 0) {
                      _countVisita--;
                      if (_countVisita >= _maxPoint) {
                        if ((_countVisita - _countLocal) >= 2 ||
                            !_differenceTwo) {
                          _visitaWin = true;
                        } else {
                          _visitaWin = false;
                        }
                      } else {
                        _visitaWin = false;
                      }

                      if (_countLocal >= _maxPoint) {
                        if ((_countLocal - _countVisita) >= 2 ||
                            !_differenceTwo) {
                          _localWin = true;
                        } else {
                          _localWin = false;
                        }
                      } else {
                        _localWin = false;
                      }
                    }
                  });
                },
              ),
            ),
            _visitaWin
                ? SizedBox(
                    height: 45,
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _setsVisita++;
                            _countLocal = 0;
                            _countVisita = 0;
                            _localWin = false;
                            _visitaWin = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(4, 81, 5, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(8), // <-- Radius
                          ),
                        ),
                        child: const Text(
                          "Ganador",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(height: 45, child: null)
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
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            width: 90,
            child: const Text(""),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(3, 0, 3, 10),
                    height: 20,
                    width: 20,
                    child: InkWell(
                      child: SvgPicture.asset('assets/add-circle-outline.svg',
                          color: const Color.fromRGBO(45, 211, 111, 1),
                          semanticsLabel: 'A red up arrow'),
                      onTap: () {
                        setState(() {
                          if (!_localWin) {
                            _countLocal++;

                            if (_countLocal >= _maxPoint) {
                              if ((_countLocal - _countVisita) >= 2 ||
                                  !_differenceTwo) {
                                _localWin = true;
                              } else {
                                _localWin = false;
                              }
                            } else {
                              _localWin = false;
                            }

                            if (_countVisita >= _maxPoint) {
                              if ((_countVisita - _countLocal) >= 2 ||
                                  !_differenceTwo) {
                                _visitaWin = true;
                              } else {
                                _visitaWin = false;
                              }
                            } else {
                              _visitaWin = false;
                            }
                          }
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(3, 10, 3, 10),
                    height: 20,
                    width: 20,
                    child: InkWell(
                      child: SvgPicture.asset(
                          'assets/remove-circle-outline.svg',
                          color: const Color.fromRGBO(45, 211, 111, 1),
                          semanticsLabel: 'A red up arrow'),
                      onTap: () {
                        setState(() {
                          if (_countLocal != 0) {
                            _countLocal--;

                            if (_countLocal >= _maxPoint) {
                              if ((_countLocal - _countVisita) >= 2 ||
                                  !_differenceTwo) {
                                _localWin = true;
                              } else {
                                _localWin = false;
                              }
                            } else {
                              _localWin = false;
                            }

                            if (_countVisita >= _maxPoint) {
                              if ((_countVisita - _countLocal) >= 2 ||
                                  !_differenceTwo) {
                                _visitaWin = true;
                              } else {
                                _visitaWin = false;
                              }
                            } else {
                              _visitaWin = false;
                            }
                          }
                        });
                      },
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(6, 5, 6, 20),
                    height: 20,
                    width: 20,
                    child: InkWell(
                      child: SvgPicture.asset('assets/settings-outline.svg',
                          color: Colors.white,
                          semanticsLabel: 'A red up arrow'),
                      onTap: () {
                        //showModal();
                        //Navigator.push(
                        //  context,
                        //  MaterialPageRoute(
                        //    builder: (context) => const Settings(),

                        //  ),

                        //);
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(6, 20, 6, 20),
                    height: 20,
                    width: 20,
                    child: InkWell(
                      child: SvgPicture.asset(
                          'assets/refresh-circle-outline.svg',
                          color: Colors.white,
                          semanticsLabel: 'A red up arrow'),
                      onTap: () {
                        setState(() {
                          _setsVisita = 0;
                          _setsLocal = 0;
                          _countLocal = 0;
                          _countVisita = 0;
                          _localWin = false;
                          _visitaWin = false;
                          _maxPoint = 25;
                        });
                      },
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(3, 0, 3, 10),
                    height: 20,
                    width: 20,
                    child: InkWell(
                      child: SvgPicture.asset('assets/add-circle-outline.svg',
                          color: const Color.fromRGBO(45, 211, 111, 1),
                          semanticsLabel: 'A red up arrow'),
                      onTap: () {
                        setState(() {
                          if (!_visitaWin) {
                            _countVisita++;

                            if (_countVisita >= _maxPoint) {
                              if ((_countVisita - _countLocal) >= 2 ||
                                  !_differenceTwo) {
                                _visitaWin = true;
                              } else {
                                _visitaWin = false;
                              }
                            } else {
                              _visitaWin = false;
                            }

                            if (_countLocal >= _maxPoint) {
                              if ((_countLocal - _countVisita) >= 2 ||
                                  !_differenceTwo) {
                                _localWin = true;
                              } else {
                                _localWin = false;
                              }
                            } else {
                              _localWin = false;
                            }
                          }
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(3, 10, 3, 10),
                    height: 20,
                    width: 20,
                    child: InkWell(
                      child: SvgPicture.asset(
                          'assets/remove-circle-outline.svg',
                          color: const Color.fromRGBO(45, 211, 111, 1),
                          semanticsLabel: 'A red up arrow'),
                      onTap: () {
                        setState(() {
                          if (_countVisita != 0) {
                            _countVisita--;
                            if (_countVisita >= _maxPoint) {
                              if ((_countVisita - _countLocal) >= 2 ||
                                  !_differenceTwo) {
                                _visitaWin = true;
                              } else {
                                _visitaWin = false;
                              }
                            } else {
                              _visitaWin = false;
                            }

                            if (_countLocal >= _maxPoint) {
                              if ((_countLocal - _countVisita) >= 2 ||
                                  !_differenceTwo) {
                                _localWin = true;
                              } else {
                                _localWin = false;
                              }
                            } else {
                              _localWin = false;
                            }
                          }
                        });
                      },
                    ),
                  )
                ],
              )
            ],
          ),
          Expanded(
            child: FittedBox(
              child: Text(
                "$_setsLocal - $_setsVisita",
                style: const TextStyle(
                    color: Colors.white, fontFamily: "YesevaOne"),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 25, 0, 20),
            child: const Text(
              "",
              style: TextStyle(color: Colors.white, fontFamily: "YesevaOne"),
            ),
          ),
        ],
      ),
    );
  }

  void showModal() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return (ListView(
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
        ));
      },
    );
  }
}

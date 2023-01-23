import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _urlInsta =
    Uri.parse("https://instagram.com/trawen_nuble?igshid=YmMyMTA2M2Y=");
final Uri _urlFace = Uri.parse("https://www.facebook.com/clubTrawen");

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

  bool _isReadData = false;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Object? parametros = ModalRoute.of(context)?.settings.arguments;

    if (!_isReadData) {
      if (parametros != null) {
        (parametros as Map);
        setState(() {
          if ((parametros)['nameLocal'] != "") {
            _nameLocal = (parametros)['nameLocal'];
          }
          if ((parametros)['nameVisita'] != "") {
            _nameVisita = (parametros)['nameVisita'];
          }
          var aux = int.tryParse((parametros)['maxPoint']);
          if (aux != null) {
            _maxPoint = aux;
          }
          _differenceTwo = (parametros)['differenceTwo'];
          _isReadData = true;
        });
      }
    }

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
                )
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
                    if (!_localWin && !(_visitaWin && _countLocal == _maxPoint-1)) {
                      
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
                          "Ganador!",
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
                    if (!_visitaWin && !(_localWin && _countVisita == _maxPoint-1)) {
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
                          "Ganador!",
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
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    height: 25,
                    width: 25,
                    child: InkWell(
                      child: SvgPicture.asset(
                        'assets/add-circle-outline.svg',
                        color: const Color.fromRGBO(45, 211, 111, 1),
                      ),
                      onTap: () {
                        setState(() {
                          if (!_localWin && !(_visitaWin && _countLocal == _maxPoint-1)) {
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
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    height: 25,
                    width: 25,
                    child: InkWell(
                      child: SvgPicture.asset(
                        'assets/remove-circle-outline.svg',
                        color: const Color.fromRGBO(45, 211, 111, 1),
                      ),
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
                    margin: const EdgeInsets.fromLTRB(3, 5, 3, 20),
                    height: 25,
                    width: 25,
                    child: InkWell(
                      child: SvgPicture.asset(
                        'assets/settings-outline.svg',
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, "/config", arguments: {
                          "nameLocal": _nameLocal,
                          "nameVisita": _nameVisita,
                          "maxPoint": _maxPoint.toString(),
                          "differenceTwo": _differenceTwo
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(3, 20, 3, 20),
                    height: 25,
                    width: 25,
                    child: InkWell(
                      child: SvgPicture.asset(
                        'assets/refresh-circle-outline.svg',
                        color: Colors.white,
                      ),
                      onTap: () {
                        setState(() {
                          _setsVisita = 0;
                          _setsLocal = 0;
                          _countLocal = 0;
                          _countVisita = 0;
                          _localWin = false;
                          _visitaWin = false;
                        });
                      },
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    height: 25,
                    width: 25,
                    child: InkWell(
                      child: SvgPicture.asset(
                        'assets/add-circle-outline.svg',
                        color: const Color.fromRGBO(45, 211, 111, 1),
                      ),
                      onTap: () {
                        setState(() {
                          if (!_visitaWin  && !(_localWin && _countVisita == _maxPoint-1)) {
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
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    height: 25,
                    width: 25,
                    child: InkWell(
                      child: SvgPicture.asset(
                        'assets/remove-circle-outline.svg',
                        color: const Color.fromRGBO(45, 211, 111, 1),
                      ),
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
            margin: const EdgeInsets.fromLTRB(0, 30, 0, 15),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                  width: 20,
                  height: 20,
                  child: InkWell(
                    onTap: () => _launchUrlFace(),
                    child: Image.asset("assets/facebook.png"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  width: 20,
                  height: 20,
                  child: InkWell(
                    onTap: () => _launchUrlInsta(),
                    child: Image.asset("assets/instagram.png"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _launchUrlInsta() async {
    if (!await launchUrl(_urlInsta)) {
      throw Exception('Error instagram');
    }
  }

  void _launchUrlFace() async {
    if (!await launchUrl(_urlFace)) {
      throw Exception('Error facebook');
    }
  }
}

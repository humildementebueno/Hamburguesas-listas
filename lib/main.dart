import 'package:flutter/material.dart';
import 'package:hamburguesas/views/facturacion.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Principal(),
    );
  }
}

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  List hamburguer_image = [
    'assets/images/hconfideitos.png',
    'assets/images/hconhuevo.png',
    'assets/images/hdoble.png',
    'assets/images/hgemelas.png',
    'assets/images/hmariajuana.png',
    'assets/images/hmediokilo.png',
    'assets/images/hnormal.png',
    'assets/images/hpollo.png',
    'assets/images/hvegetal.png',
  ];
  List hamburguer_title = [
    'hamburguesa con fideitos',
    'hamburguesa con huevo',
    'hamburguesa doble',
    'hamburguesa gemelas',
    'hamburguesa mariajuana',
    'hamburguesa mediokilo',
    'hamburguesa normal',
    'hamburguesa pollo',
    'hamburguesa vegetal',
  ];
  List hamburguer_price = [
    "15",
    "13.5",
    "18",
    "21",
    "25",
    "18",
    "12",
    "12",
    "15",
  ];
  List pedidos = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  int puntero_image = 0;
  String _cantidad = "";
  String _total = "0";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        actions: [
          Row(
            children: [
              Icon(Icons.people_alt_sharp),
              SizedBox(
                width: 6,
              ),
              Text("Uguesas"),
              SizedBox(
                width: 250,
              ),
            ],
          )
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              title_home(),
              image_central(puntero_image),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "C#: ",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(_cantidad),
                  Text(
                    "Total a Pagar: ",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(_total),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  botones_home("<<", Colors.amber, 55),
                  botones_home("Comprar", Colors.amber, 120),
                  botones_home("Dev", Colors.amber, 72),
                  botones_home(">>", Colors.amber, 55),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              botones_home("Finalizar compra", Colors.amber, 200),
            ],
          ),
        ],
      ),
    );
  }

  Text title_home() {
    return Text(
      hamburguer_title[puntero_image] +
          " (" +
          hamburguer_price[puntero_image] +
          "Bs)",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 33, color: Colors.greenAccent, fontWeight: FontWeight.bold),
    );
  }

  Container botones_home(String texto, Color colores, double size) {
    return Container(
      width: size,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        color: colores,
        child: Text(
          texto,
          style: TextStyle(color: Colors.white, fontSize: 17.0),
        ),
        onPressed: () {
          //  SystemNavigator.pop();
          setState(() {
            print("el puntero es: " + puntero_image.toString());
            if (puntero_image > hamburguer_image.length) {
              print("el puntero se paso de positivo");
            } else {
              print("el puntero se paso de negativo");
            }
            if (texto == '<<') {
              print("anterior");

              if (puntero_image > 0) {
                print("> 1");
                puntero_image = puntero_image - 1;
              } else {
                print("cerooo");
                puntero_image = hamburguer_image.length - 1;
              }
            }
            if (texto == '>>') {
              print("despues");

              if (puntero_image < 8) {
                puntero_image = puntero_image + 1;
              } else {
                puntero_image = 0;
              }
            }
            if (texto == 'Comprar') {
              print("estas comprando");
              pedidos[puntero_image] = pedidos[puntero_image] + 1;
              _cantidad = pedidos[puntero_image].toString();
              _total = (double.parse(_total) +
                      double.parse(hamburguer_price[puntero_image]))
                  .toString();
            }
            if (texto == 'Dev') {
              print("estas Devolviendo");
              if (int.parse(_cantidad) > 0) {
                pedidos[puntero_image] = pedidos[puntero_image] - 1;
                _total = (double.parse(_total) -
                        double.parse(hamburguer_price[puntero_image]))
                    .toString();
              }
              _cantidad = pedidos[puntero_image].toString();
            }
            if (texto == 'Finalizar compra') {
              print("estas Devolviendo");
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return Facturacion(pedidos, hamburguer_title, _total);
              }));
            }
            print("estado del puntero es: " + puntero_image.toString());
            _cantidad = pedidos[puntero_image].toString();
          });
        },
      ),
    );
  }

  Container image_central(int puntero_image) {
    return Container(
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(hamburguer_image[puntero_image]),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

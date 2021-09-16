import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hamburguesas/views/facturacion.dart';

class Ventas extends StatefulWidget {
  List ventasRealizadasF = [];
  // List<dynamic> l1 = [];
  // List<dynamic> l2 = [];

  Facturacion fact = Facturacion("", "", [], [], "");
  Ventas(this.ventasRealizadasF, this.fact);

  @override
  _VentasState createState() => _VentasState();
}

List listventas(List ventasRealizadasF) {
  return ventasRealizadasF;
}

class _VentasState extends State<Ventas> {
  //List contenido = [];
  //contenido=w;
  // Facturacion facturacion = Facturacion(ci, apellido, PedidosF, Hamburgur_titleF, Total);
//contenido[0]= widget.ventasRealizadas;

// Text(widget.fact.apellido),
//           Text(widget.fact.ci),
//           Text(widget.fact.Total),
//           Text(widget.fact.Hamburgur_titleF[0]),
//           Text(widget.fact.PedidosF[0].toString()),

  double totalVenta = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Ventas Realizadas"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Expanded(child: _lista()),
          Text(
            "Total de Ventas: " + retornar(),
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          RaisedButton(
              color: Colors.green,
              child: Text(
                "Retornar",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              })
        ],
      ),
    );
  }

  void actualizar() {
    setState(() {
      totalVenta = totalVenta;
      totalVenta.toString();
    });
  }

  String retornar() {
    actualizar();
    return totalVenta.toString();
  }

  Widget _lista() {
    List f1 = listventas(widget.ventasRealizadasF);
    actualizar();
    // print((f1.elementAt(0)).toString() + " HOLA");
    // print((f1.elementAt(0).ci).toString() + " HOLA");
    // print((f1.length).toString() + " HOLA");
    // print("-----");
    // //List aux = [f1.elementAt(i).ci).toString()];
    for (var i = 0; i < f1.length; i++) {
      print((f1.elementAt(i).ci).toString() + " HOLA");
      //   // print((double.parse(f1.elementAt(i).Total) + totalVenta).toString());
      totalVenta = double.parse(f1.elementAt(i).Total) + totalVenta;
    }
    /***nota esto es muy importante estamos usando composiciones */

    /* final lst = [
      ListTile(
        trailing: Icon(Icons.ac_unit),
        title: Text((f1.elementAt(0).ci).toString()),
        subtitle: Text(widget.fact.apellido),
      ),
    ];*/
    return ListView.builder(
        itemCount: f1.length,
        itemBuilder: (context, i) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 22, top: 10),
                child: Text(
                  f1.elementAt(i).apellido,
                  style: TextStyle(fontSize: 25),
                ),
              ),
              ListTile(
                title: Text(
                  "CI/NIT: " + (f1.elementAt(i).ci).toString(),
                  style: TextStyle(fontSize: 22),
                ),
                subtitle: Text(
                  "Total: " + f1.elementAt(i).Total.toString() + " Bs",
                  style: TextStyle(fontSize: 15),
                ),
                leading: Icon(
                  Icons.person,
                  size: 45,
                ),
              ),
            ],
          );
        });
  }
}

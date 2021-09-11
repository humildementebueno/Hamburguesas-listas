import 'package:flutter/material.dart';

class Facturacion extends StatefulWidget {
  List PedidosF = [];
  List Hamburgur_titleF = [];
  String Total;
  // String ci = "";
  Facturacion(this.PedidosF, this.Hamburgur_titleF, this.Total);

  @override
  _FacturacionState createState() => _FacturacionState();
}

class _FacturacionState extends State<Facturacion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          table("Hamburguesas", "Cantidad"),
          //verificando(widget.PedidosF),

          if (widget.PedidosF[0] > 0)
            table(widget.Hamburgur_titleF[0], widget.PedidosF[0].toString())
          else
            SizedBox(
              height: 0.5,
            ),
          if (widget.PedidosF[1] > 0)
            table(widget.Hamburgur_titleF[1], widget.PedidosF[1].toString())
          else
            SizedBox(
              height: 0.5,
            ),
          if (widget.PedidosF[2] > 0)
            table(widget.Hamburgur_titleF[2], widget.PedidosF[2].toString())
          else
            SizedBox(
              height: 0.5,
            ),
          if (widget.PedidosF[3] > 0)
            table(widget.Hamburgur_titleF[3], widget.PedidosF[3].toString())
          else
            SizedBox(
              height: 0.5,
            ),
          if (widget.PedidosF[4] > 0)
            table(widget.Hamburgur_titleF[4], widget.PedidosF[4].toString())
          else
            SizedBox(
              height: 0.5,
            ),
          if (widget.PedidosF[5] > 0)
            table(widget.Hamburgur_titleF[5], widget.PedidosF[5].toString())
          else
            SizedBox(
              height: 0.5,
            ),
          if (widget.PedidosF[6] > 0)
            table(widget.Hamburgur_titleF[6], widget.PedidosF[6].toString())
          else
            SizedBox(
              height: 0.5,
            ),
          if (widget.PedidosF[7] > 0)
            table(widget.Hamburgur_titleF[7], widget.PedidosF[7].toString())
          else
            SizedBox(
              height: 0.5,
            ),
          if (widget.PedidosF[8] > 0)
            table(widget.Hamburgur_titleF[8], widget.PedidosF[8].toString())
          else
            SizedBox(
              height: 0.5,
            ),
          table("TOTAL", widget.Total + " Bs"),
          SizedBox(
            height: 20,
          ),
          // Text(widget.PedidosF.toString()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120),
            child: RaisedButton(
                color: Colors.green,
                child: Text(
                  "Retornar",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          )
        ],
      ),
    );
  }

  Widget verificando(List pedidos) {
    int contador = 0;
    int nro_encendidos = 0;
    List auxiliar = [];
    while (contador < 9) {
      if (widget.PedidosF[contador] != 0) {
        auxiliar[contador] = 1;
        nro_encendidos = nro_encendidos + 1;
      }
      contador = contador + 1;
    }
    contador = 0;
    print("pedidos" + widget.PedidosF[1].toString());
    return Column(
      children: [
//          table(widget.Hamburgur_titleF[0],true ? widget.PedidosF[0].toString(): ""),
        true
            ? table(widget.Hamburgur_titleF[1], widget.PedidosF[1].toString())
            : Text(""),
        // table(widget.Hamburgur_titleF[2], widget.PedidosF[2].toString()),
        // table(widget.Hamburgur_titleF[3], widget.PedidosF[3].toString()),
        // table(widget.Hamburgur_titleF[4], widget.PedidosF[4].toString()),
        // table(widget.Hamburgur_titleF[5], widget.PedidosF[5].toString()),
        // table(widget.Hamburgur_titleF[6], widget.PedidosF[6].toString()),
        // table(widget.Hamburgur_titleF[7], widget.PedidosF[7].toString()),
        // table(widget.Hamburgur_titleF[8], widget.PedidosF[8].toString()),
      ],
    );
  }

  Table table(String food, String data) {
    return Table(
      border: TableBorder.all(
          width: 2.0, color: Colors.amberAccent, style: BorderStyle.solid),
      children: [
        TableRow(children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              food,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              data,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          )
        ])
      ],
    );
  }
}

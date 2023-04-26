import 'package:flutter/material.dart';

class medicine extends StatelessWidget {
  const medicine({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white, //background color of scaffold
        appBar: AppBar(
          title:Text("ঔষধ পরিচিতি"), //title of app
          backgroundColor: Colors.green[300], //background color of app bar
        ),
        body: Container(
            padding: EdgeInsets.all(15),
            child:Table(
              border: TableBorder.all(width:1, color:Colors.black45), //table border
              children: [

                TableRow(
                    children: [
                      TableCell(child: Text("\nরোগের নাম\n",textAlign: TextAlign.center,style:TextStyle(fontWeight:FontWeight.bold),)),
                      TableCell(child: Text("\nঔষধের নাম\n",textAlign: TextAlign.center,style:TextStyle(fontWeight:FontWeight.bold))),
                      TableCell(child: Text("\nসময়\n",textAlign: TextAlign.center,style:TextStyle(fontWeight:FontWeight.bold))),
                    ]

                ),

                TableRow(
                    children: [
                      TableCell(child: Text("\nMastities",textAlign: TextAlign.center,)),
                      TableCell(child: Text(" \nRenacef - 2gm\nPifervet - 10ml\nFphpnodnyl - 10ml\n ")),
                      TableCell(child: Text("\n3 days",textAlign: TextAlign.center)),
                    ]
                ),

                TableRow(
                    children: [
                      TableCell(child: Text("\nLumphy",textAlign: TextAlign.center)),
                      TableCell(child: Text(" \nTrijonvet - 2gm\nPifervet - 10ml\nFphpnodnyl - 10ml\n ")),
                      TableCell(child: Text("\n3 days",textAlign: TextAlign.center)),

                    ]
                ),

                TableRow(
                    children: [
                      TableCell(child: Text("\nFoot and mouth",textAlign: TextAlign.center)),
                      TableCell(child: Text(" \nDia din - 50ml\nPifervet - 10ml\nFphpnodnyl - 10ml\n ")),
                      TableCell(child: Text("\n3 days",textAlign: TextAlign.center)),

                    ]
                ),
                TableRow(
                    children: [
                      TableCell(child: Text("\nBlack-Quarter",textAlign: TextAlign.center)),
                      TableCell(child: Text(" \nTrijonvet - 2gm\nPifervet - 10ml\nFphpnodnyl - 10ml\n ")),
                      TableCell(child: Text("\n3 days",textAlign: TextAlign.center)),

                    ]
                ),

              ],)
        )
    );
  }
}
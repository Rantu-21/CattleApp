
import 'package:flutter/material.dart';

import '../model/Grooming.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
class Disease_details extends StatelessWidget {
  final Diseases diseases;
  Disease_details(this.diseases);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(diseases.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),

        child: SingleChildScrollView
          (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(diseases.image),
              Padding(padding: const EdgeInsets.all(8.0),
                child: Text(diseases.description,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 18.0)
                )
                ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class Scanner extends StatefulWidget {
  static String id = 'scanner';

  const Scanner({super.key});

  @override
  State<StatefulWidget> createState() => _Scanner();
}

class _Scanner extends State<Scanner> {
  

  @override
  Widget build(BuildContext context) {

    bool dialogRaised = false;

    closeModal(){
      Navigator.of(context).pop();

      dialogRaised = false;

    }

    showModal(qrCodeCode){

      dialogRaised = true;

      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Show Alert Dialog Box"),
          content: Text("You have raised a Alert Dialog Box "+qrCodeCode),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                closeModal();
              },
              child: Text("Ok"),
            ),
          ],
        )
      );

    }

    return SafeArea(
      child: Scaffold(
        body:Stack(
          children: [
            
            MobileScanner(
              fit: BoxFit.cover,
              controller: MobileScannerController(
                detectionSpeed: DetectionSpeed.normal,
                facing: CameraFacing.back,
              ),
              onDetect: (capture) {
                final List<Barcode> barcodes = capture.barcodes;
                final Uint8List? image = capture.image;
                for (final barcode in barcodes) {
                  if(dialogRaised == false)
                    showModal(barcode.rawValue);
                }
              },
            ),
            
            Center(
              child: Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent)
                ),
                child:SizedBox(width: 200, height: 200 ,),
              ),
            )
          ],
        ),
      )
    );
  }
}

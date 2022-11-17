import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';


class GenerateQRPage extends StatefulWidget {
  @override
  _GenerateQRPageState createState() => _GenerateQRPageState();
}
class _GenerateQRPageState extends State<GenerateQRPage> {
  TextEditingController _qrcontroller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImage(
              data: _qrcontroller.text,
              size: 150,
            ),

            SizedBox(
              height: 20,
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SizedBox(
                width: 260,
                height: 40,
                child:TextField(
                  controller: _qrcontroller,
                  decoration: const InputDecoration(
                      // hintText: 'Enter Username',
                      border: OutlineInputBorder(),
                    ),
                  )
              ),),

            SizedBox(
              height: 20,
            ),

            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child:SizedBox(
                  width: 260,
                  height: 40,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                      });
                    },
                    child: const Text('Generate QR'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blueGrey,),
                  ),
                ),),
          ],
        ),
      ),
    );
  }
}
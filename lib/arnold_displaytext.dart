import 'package:flutter/material.dart';
import 'package:flutter_arnold_text_jagan/arnold_appdatatext.dart';

class DisplayText extends StatelessWidget {
  final AppDataText appDataText;
  const DisplayText({super.key, required this.appDataText});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Center(
            child: Container(
              height: 450,
              width: 380,
              margin: EdgeInsets.only(left:10,right: 10),
              child: Center(
                  child: Text(
                    appDataText.text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'riot'),
                  ),
                ),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

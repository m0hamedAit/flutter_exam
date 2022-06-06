



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/colors/light_colors.dart';
import '../widgets/App_Bar.dart';

class AboutScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const AppBarr("About"),
      body: Column(
            children: <Widget>[
        SizedBox(
        height: size.height * 0.2,  // get 0.2 of screen height
            child:Stack(
                children:<Widget>[
                  Container(
                    height: size.height * 0.2 - 20,
                    decoration: const BoxDecoration(
                        color: LightColors.kDarkBlue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        )
                    ),
                  ),
                ]
            )
        ),
              Center(
                child: Text(
                "Github : m0hamedAit",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                )
              )
            ]
      )
    );
  }

}
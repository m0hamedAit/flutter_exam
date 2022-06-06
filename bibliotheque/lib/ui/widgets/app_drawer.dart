import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../theme/colors/light_colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Column(
            children: [
              CircularPercentIndicator(
                radius: 90.0,
                lineWidth: 5.0,
                animation: true,
                percent: 1,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: LightColors.kBlue,
                backgroundColor: LightColors.kDarkYellow,
                center: const CircleAvatar(
                  backgroundColor: LightColors.kBlue,
                  radius: 35.0,
                  backgroundImage: AssetImage(
                    'assets/logo.jpg',
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Text("Biblioteca"),

            ],
          ),
          ),
          Divider(height: 5,color: Colors.black,),
          ListTile(
            title: Text("Home"),
            onTap: (){
              Navigator.pushNamed(context, "/");
            },
          ),
          ListTile(
            title: Text("Books"),
            onTap: (){
              Navigator.pushNamed(context, "/books");
            },
          ),

          ListTile(
            title: Text("Adherents"),
            onTap: (){
              Navigator.pushNamed(context, "/adherents");
            },
          ),
          ListTile(
            title: Text("About"),
            onTap: (){
              Navigator.pushNamed(context, "/about");
            },
          )
        ],
      ),
    );
  }
}
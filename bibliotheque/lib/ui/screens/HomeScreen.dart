

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child :Column(
        children: <Widget>[

          GridView.count(
            crossAxisCount: 2,
            children: [
              InkWell(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      Text("Home", style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.of(context).pushNamed("/");
                },
              ),

              InkWell(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.book,
                        color: Colors.white,
                      ),
                      Text("Books",
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.of(context).pushNamed("/books");
                },
              ),

              InkWell(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.supervised_user_circle,
                        color: Colors.white,
                      ),
                      Text("Adherents", style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.of(context).pushNamed("/adherents");
                },
              ),

              InkWell(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.error,
                        color: Colors.white,
                      ),
                      Text("About", style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.of(context).pushNamed("/about");
                },
              ),
            ],
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          )
        ],
      )
      ),


    );
  }

}
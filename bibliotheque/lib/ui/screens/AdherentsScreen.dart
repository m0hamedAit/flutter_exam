
import 'package:bibliotheque/blocs/Adherent/adherent_bloc.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/Adherent/adherent_event.dart';
import '../../blocs/Adherent/adherent_state.dart';
import '../../blocs/Books/book_bloc.dart';
import '../../blocs/Books/book_state.dart';
import '../../models/enums/RequestStatus.dart';
import '../../theme/colors/light_colors.dart';
import '../widgets/App_Bar.dart';

class AdherentsScreen extends StatelessWidget{

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    context.read<AdherentBloc>().add(AllAdherentsEvent());
    return Scaffold(
      appBar: const AppBarr("Adherents"),
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
          BlocBuilder<AdherentBloc,AdherentState>(
              builder: (context, state) {
                if (state.requestStatus == RequestStatus.LOADING) {
                  return const CircularProgressIndicator();
                } else if (state.requestStatus == RequestStatus.LOADED) {
                  if (state.adherents.isEmpty) {
                    return const Text("There is no adherents");
                  } else {
                    return
                      Expanded(
                      child: ListView.builder(
                          itemCount: state.adherents.length,
                          itemBuilder: (context, index) {
                            return
                              ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: LightColors.kDarkBlue,
                                    child: Text(state.adherents[index].nom.substring(0, 2)),
                                  ),//Text
                                  title: RichText(
                                    text: TextSpan(children: <TextSpan>[
                                      TextSpan(
                                          text:
                                           state.adherents[index].nom + " "+ state.adherents[index].nom + "\n",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          )),

                                      TextSpan(
                                          text:
                                          "Email : " + state.adherents[index].email + "\n",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          )),

                                      TextSpan(
                                          text:
                                          "Tel : " + state.adherents[index].tel + "\n",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ]),
                                  ),
                                  trailing: SizedBox.fromSize(
                                    size: Size(40, 40),
                                    child: ClipOval(
                                      child: Material(
                                        color: Colors.grey,
                                        child: InkWell(

                                          onTap: () {
                                            context.read<AdherentBloc>().add(DeleteAdherentEvent(state.adherents[index].id_adherent));
                                          },
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: const <Widget>[
                                              Icon(Icons.delete_outline_outlined), // <-- Icon// <-- Text
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                              );






                          }),
                    );

                  }
                }
                else if (state.requestStatus == RequestStatus.NONE) {
                  return const Text("");
                } else {
                  return Column(
                    children: [
                      Text(" ${state.errorMessage}"),
                      ElevatedButton(onPressed: () {
                      }, child: const Text("reload"))
                    ],
                  );
                }
              }
          )

        ],

      ),

    );
  }

}


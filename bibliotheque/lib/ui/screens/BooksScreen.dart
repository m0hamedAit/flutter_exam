


import 'package:bibliotheque/blocs/Books/book_bloc.dart';
import 'package:bibliotheque/models/enums/RequestStatus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/Books/book_event.dart';
import '../../blocs/Books/book_state.dart';
import '../../theme/colors/light_colors.dart';
import '../widgets/App_Bar.dart';

class BooksScreen extends StatelessWidget{
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    context.read<BookBloc>().add(AllBooksEvent());

    return Scaffold(
      appBar: const AppBarr("Books"),
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

                    Container(
                        height:40,
                        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        child: Stack(
                          children: [
                            TextFormField(
                              controller: textController,
                              decoration: InputDecoration(
                                  labelText: "keyword...",
                                  labelStyle: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 1, color: Colors.white),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 1, color: LightColors.kDarkYellow),
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                            )

                          ],
                        )

                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child:InkWell( // make container clickable
                            child: Container(
                              padding: const EdgeInsets.all(9.0),
                              margin: const EdgeInsets.symmetric(horizontal: 100),
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0,10),
                                      blurRadius: 50,
                                      color: LightColors.kBlue.withOpacity(0.3),
                                    ),
                                  ]
                              ),
                              child: const Text(
                                'Search',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            // ignore: avoid_print
                            onTap:() {
                              context.read<BookBloc>().add(findBooksEvent(textController.text));
                            }

                        )

                    )

                  ]
              )
          ),
                        BlocBuilder<BookBloc,BookState>(
            builder: (context, state) {
                if (state.requestStatus == RequestStatus.LOADING) {
                return const CircularProgressIndicator();
                } else if (state.requestStatus == RequestStatus.LOADED) {
                          if (state.books.isEmpty) {
                          return const Text("There is no books");
                          } else {
                          return
                            Expanded(
                          child: ListView.builder(
                          itemCount: state.books.length,
                          itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: LightColors.kDarkBlue,
                              child: Text(state.books[index].title.substring(0, 2)),
                            ),//Text
                          title: RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text:
                                  "Title : " + state.books[index].title + "\n",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  )),

                              TextSpan(
                                  text:
                                  "ISBN : " + state.books[index].isbn + "\n",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  )),

                              TextSpan(
                                  text:
                                  "Author : " + state.books[index].author + "\n",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  )),

                              TextSpan(
                                  text:
                                  "Price : " + state.books[index].price.toString() + "\n",
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
                            context.read<BookBloc>().add(DeleteBookEvent(state.books[index].id_book));
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
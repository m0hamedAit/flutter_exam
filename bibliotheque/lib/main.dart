import 'package:bibliotheque/blocs/Adherent/adherent_bloc.dart';
import 'package:bibliotheque/blocs/Books/book_bloc.dart';
import 'package:bibliotheque/repositories/AdherendRepository.dart';
import 'package:bibliotheque/repositories/BookRepository.dart';
import 'package:bibliotheque/theme/colors/light_colors.dart';
import 'package:bibliotheque/ui/screens/AboutScreen.dart';
import 'package:bibliotheque/ui/screens/AdherentsScreen.dart';
import 'package:bibliotheque/ui/screens/BooksScreen.dart';
import 'package:bibliotheque/ui/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/Adherent/adherent_state.dart';
import 'blocs/Books/book_state.dart';
import 'models/enums/RequestStatus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create:(context)=>BookBloc(initialState : BookState([],RequestStatus.NONE,""), bookRepository: BookRepository())),
          BlocProvider(create:(context)=>AdherentBloc(initialState : AdherentState([],RequestStatus.NONE,""), adherentRepository: AdherentRepository())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,  // remove debug banner
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Theme.of(context).textTheme.apply(
                bodyColor: LightColors.kDarkBlue,
                displayColor: LightColors.kDarkBlue,
                fontFamily: 'Poppins'
            ),
          ),
          routes: {
            "/": (context)=> HomeScreen(),
            "/books":(context) => BooksScreen(),
            "/adherents":(context) => AdherentsScreen(),
            "/about":(context) => AboutScreen(),
          },
          // initialRoute: '/contacts',
          // home: HomePage(),  // specifier page home
        )
    );
  }
}

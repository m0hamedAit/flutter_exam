import 'dart:async';

import 'package:bibliotheque/blocs/Books/book_event.dart';
import 'package:bibliotheque/blocs/Books/book_state.dart';
import 'package:bibliotheque/models/Book.dart';
import 'package:bibliotheque/repositories/BookRepository.dart';
import 'package:bloc/bloc.dart';

import '../../models/enums/RequestStatus.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookRepository bookRepository;

  BookBloc({required BookState initialState, required this.bookRepository}) : super(initialState){
    on<BookEvent>((event, emit) async{
      if(event is AllBooksEvent){
        emit(BookState([], RequestStatus.LOADING, ""));
        try{
          List<Book> books = await bookRepository.allBooks();
          emit(BookState(books, RequestStatus.LOADED, ""));
        }catch(e){
          emit(BookState([], RequestStatus.ERROR, e.toString()));
        }
      }

      else if(event is findBooksEvent){
          emit(BookState([], RequestStatus.LOADING, ""));
          try{
            List<Book> books = await bookRepository.findBooks(event.keyword);
            emit(BookState(books, RequestStatus.LOADED, ""));
          }catch(e){
            emit(BookState([], RequestStatus.ERROR, "No books found !"));
          }
      }


      else if(event is DeleteBookEvent){
        try{
          bookRepository.deleteBook(event.id_book);
          List<Book> books = await bookRepository.allBooks();
          emit(BookState(books, RequestStatus.LOADED, ""));
        }catch(e){
          emit(BookState([], RequestStatus.ERROR, e.toString()));
        }
      }
    });
  }
}


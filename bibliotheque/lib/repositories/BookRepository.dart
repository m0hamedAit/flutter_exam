

import 'package:faker/faker.dart';

import '../models/Book.dart';

class BookRepository{
    List<Book> books = List.generate(20, (i)=> Book( i+1, faker.internet.macAddress(),
        faker.company.name(), faker.person.name(), DateTime.now(), random.integer(100), random.decimal()));


    Future<List<Book>> allBooks() async{
      var future = await Future.delayed(const Duration(seconds: 2));
      return books;
    }

    Future<List<Book>> findBooks(String keyword) async{
      var future = await Future.delayed(const Duration(seconds: 2));
      return books.where((book) => book.title.toLowerCase().contains(keyword.toLowerCase())).toList();
    }

    void deleteBook(int idBook){
      books.removeWhere((book) => book.id_book == idBook);
    }

}


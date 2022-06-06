

abstract class BookEvent{}

class AllBooksEvent extends BookEvent{}
class findBooksEvent extends BookEvent{
  String keyword;

  findBooksEvent(this.keyword);
}

class DeleteBookEvent extends BookEvent{
  int id_book;

  DeleteBookEvent(this.id_book);
}

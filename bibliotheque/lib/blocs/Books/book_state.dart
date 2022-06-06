

import '../../models/Book.dart';
import '../../models/enums/RequestStatus.dart';

class BookState {
  List<Book> books;
  RequestStatus requestStatus;
  String errorMessage;

  BookState(this.books, this.requestStatus, this.errorMessage);

}

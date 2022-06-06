

import 'package:bibliotheque/models/Adherent.dart';

import '../../models/enums/RequestStatus.dart';

class AdherentState {
  List<Adherent> adherents;
  RequestStatus requestStatus;
  String errorMessage;

  AdherentState(this.adherents, this.requestStatus, this.errorMessage);
}
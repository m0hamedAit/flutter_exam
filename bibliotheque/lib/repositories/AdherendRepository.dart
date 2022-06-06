

import 'package:bibliotheque/models/Adherent.dart';
import 'package:faker/faker.dart';

class AdherentRepository{
  List<Adherent> adherents = List.generate(20, (i)=> Adherent( i+1, faker.person.lastName(), faker.person.firstName(), faker.internet.email(), faker.phoneNumber.toString()));


  Future<List<Adherent>> allAdherent() async{
    var future = await Future.delayed(const Duration(seconds: 2));
    return adherents;
  }

  void deleteAdherent(int idAdherent){
    adherents.removeWhere((adherent) => adherent.id_adherent == idAdherent);
  }

}

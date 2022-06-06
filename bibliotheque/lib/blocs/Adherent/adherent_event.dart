


abstract class AdherentEvent{}

class AllAdherentsEvent extends AdherentEvent{}
class DeleteAdherentEvent extends AdherentEvent{
  int id_adherent;

  DeleteAdherentEvent(this.id_adherent);
}

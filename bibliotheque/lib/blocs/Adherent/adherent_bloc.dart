import 'dart:async';

import 'package:bibliotheque/blocs/Adherent/adherent_event.dart';
import 'package:bibliotheque/blocs/Adherent/adherent_state.dart';
import 'package:bibliotheque/models/Adherent.dart';
import 'package:bibliotheque/models/enums/RequestStatus.dart';
import 'package:bibliotheque/repositories/AdherendRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


class AdherentBloc extends Bloc<AdherentEvent, AdherentState> {
  AdherentRepository adherentRepository;

  AdherentBloc({required AdherentState initialState, required this.adherentRepository}) : super(initialState){
    on<AdherentEvent>((event, emit) async{
      if(event is AllAdherentsEvent){
        emit(AdherentState([], RequestStatus.LOADING, ""));
        try{
          List<Adherent> adherents = await adherentRepository.allAdherent();
          emit(AdherentState(adherents, RequestStatus.LOADED, ""));
        }catch(e){
          emit(AdherentState([], RequestStatus.ERROR, e.toString()));        
        }
      }

      else if(event is DeleteAdherentEvent){
        try{
          adherentRepository.deleteAdherent(event.id_adherent);
          List<Adherent> adherents = await adherentRepository.allAdherent();
          emit(AdherentState(adherents, RequestStatus.LOADED, ""));
        }catch(e){
          emit(AdherentState([], RequestStatus.ERROR, e.toString()));
        }
      }
    });
  }
}

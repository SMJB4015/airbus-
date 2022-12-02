import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:airbus_app/blocs/news/news_events.dart';
import 'package:airbus_app/blocs/news/news_states.dart';
import 'package:airbus_app/repo/news_repo.dart';

import 'codes_events.dart';
import 'codes_states.dart';


class CodesBloc extends Bloc<CodesEvents,CodesStates>{
  NewsRepo repo ;

  CodesBloc(CodesStates initialState,this.repo) : super(initialState) {
    on<StartCodes>((event, emit) async {
      var data = await repo.fetchNews();
      emit(SuccessCodes(cde:data)) ;

    });
  }
}
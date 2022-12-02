import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:airbus_app/blocs/news/news_events.dart';
import 'package:airbus_app/blocs/news/news_states.dart';
import 'package:airbus_app/repo/news_repo.dart';


class NewsBloc extends Bloc<NewsEvents,NewsStates>{
  NewsRepo repo ;

  NewsBloc(NewsStates initialState,this.repo) : super(initialState) {
    on<StartNews>((event, emit) async {
      var data = await repo.fetchNews();
      emit(SuccessNews(news:data)) ;

    });
  }
}
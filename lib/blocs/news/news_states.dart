import 'package:equatable/equatable.dart';
import '../../models/user.dart';

class NewsStates extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];

}
class InitialState extends NewsStates{}
class Loading extends NewsStates{}

class SuccessNews extends NewsStates{
  List<News> ?news ;
  SuccessNews({this.news}) ;
}
class Error extends NewsStates {
  String ?message ;
  Error({this.message});
}
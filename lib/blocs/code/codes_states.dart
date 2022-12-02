import 'package:equatable/equatable.dart';
import '../../models/code.dart';
import '../../models/user.dart';

class CodesStates extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];

}
class InitialState extends CodesStates{}
class Loading extends CodesStates{}

class SuccessCodes extends CodesStates{
  Code ?cde ;
  SuccessCodes({this.cde}) ;
}
class Error extends CodesStates {
  String ?message ;
  Error({this.message});
}
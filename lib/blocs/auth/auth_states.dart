import 'package:equatable/equatable.dart';

class AuthStates extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];

}
class LoginInitState extends AuthStates{}

class LoginLoadingState extends AuthStates{}

class EntreInState extends AuthStates{
  final String? nom ;
  final String? email ;

  EntreInState({required this.nom, required this.email});
}
class CustmInState extends AuthStates{
  final String? nom ;
  final String? email ;

  CustmInState({required this.nom, required this.email});
}
class VisiteurState extends AuthStates{}

class UserRegisterSuccessState extends AuthStates{}

class UserUpdateSuccessState extends AuthStates{}

class UserLoginSuccessState extends AuthStates{}


class LoginErrorState extends AuthStates{
  final String message ;

  LoginErrorState({ required this.message});
}


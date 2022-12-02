import 'package:airbus_app/blocs/auth/auth_events.dart';
import 'package:airbus_app/blocs/auth/auth_states.dart';
import 'package:airbus_app/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc extends Bloc<AuthEvents,AuthStates>{
  AuthRepo repo;
  AuthBloc(AuthStates LoginInitState,this.repo) : super(LoginInitState){
    on<StartAEvent>((event, emit) async {
      var pref= await SharedPreferences.getInstance();
      if(pref.getString('nom')!=''&& pref.getString('entrep')!='true'){
        emit(EntreInState(nom: pref.getString('nom') ,email: pref.getString('email')));
      }else if(pref.getString('nom')!=''&& pref.getString('entrep')!='true'){
        emit(CustmInState(nom: pref.getString('nom') ,email: pref.getString('email')));
      }

    });
    on<LoginButtonPressed>((event, emit) async {
      var pref= await SharedPreferences.getInstance();
      emit(LoginLoadingState()) ;
      var data = await repo.login(event.email,event.password);
      print(data) ;
      if(data==true){
        var data = await repo.login2(event.email);
        print(data) ;
        pref.setString('nom', data.userName);
        //pref.setString('place', data['place']);
        pref.setString('email', data.email);
        if(data.role==true){
          emit(EntreInState(nom: data.userName,email: data.email));
        }else{
          emit(CustmInState(nom: data.userName,email: data.email));
        }


    }else {
        emit(LoginErrorState(message: 'Password is Wrong'));
      }
    });
    on<RegisterButtonPressed>((event, emit) async {
      var pref= await SharedPreferences.getInstance();
      var data = await repo.register(event.email,event.password,event.nom,event.role);
      emit(LoginLoadingState()) ;
      if(data['email']==event.email){
        emit(UserRegisterSuccessState());

      }else{
        emit(LoginErrorState(message: data['error']));
      }
    });
  }
}



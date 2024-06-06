import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
part 'internet_state.dart';

class InternetCubit extends Cubit<InternetStatus> {
  InternetCubit() : super(const InternetStatus(ConectivityStatus.disconnected));
  void checkConnectivity()async {
    var connectivityResult = await Connectivity().checkConnectivity();
    _updateConnectivityStatus(connectivityResult as ConnectivityResult);

  }
  void _updateConnectivityStatus(ConnectivityResult result )
  {
    if(result==ConnectivityResult.none){
    emit(const InternetStatus(ConectivityStatus.disconnected));
    }
  else
  {
    emit(const InternetStatus(ConectivityStatus.connected));
  }
 }
late  StreamSubscription<ConnectivityResult> _subscription;
 void trackConnectivityChange(){
  _subscription=Connectivity().onConnectivityChanged.listen((result) {
    _updateConnectivityStatus(result as ConnectivityResult);
   }
   ) as StreamSubscription<ConnectivityResult>;
 }

 void dispose(){
  _subscription.cancel();
 }
}
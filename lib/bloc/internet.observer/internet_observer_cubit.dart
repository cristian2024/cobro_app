import 'package:cobro_app/helpers/internet.observer/internet_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetObserverCubit extends Cubit<ConnectivityData> {
  InternetObserverCubit() : super(ConnectivityData.initial());

  void changeDate(ConnectivityData data) {
    emit(data);
  }
}

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetObserverCubit extends Cubit<ConnectivityDataState> {
  InternetObserverCubit() : super(const ConnectivityDataState.initial());

  void changeDate(ConnectivityDataState data) {
    emit(data);
  }
}

class ConnectivityDataState extends Equatable {
  final ConnectivityResult connectivity;
  final bool isOnline;
  const ConnectivityDataState({
    required this.connectivity,
    required this.isOnline,
  });

  const ConnectivityDataState.initial()
      : connectivity = ConnectivityResult.none,
        isOnline = false;

  bool get verifyOnline {
    return (connectivity == ConnectivityResult.mobile ||
            connectivity == ConnectivityResult.wifi) &&
        isOnline;
  }

  @override
  List<Object?> get props => [
        connectivity,
        isOnline,
      ];
}

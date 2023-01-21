// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cobro_app/config/environment.dart';

class CobroApi {
  static final CobroApi _singleton = CobroApi._internal();

  factory CobroApi() {
    return _singleton;
  }

  CobroApi._internal() {
    _endpoints = CobroEndpoints(
      baseServer: EnvironmentConfig().values.cobroBack,
    );
  }

  late CobroEndpoints _endpoints;

  CobroEndpoints get endpoints => _endpoints;
}

class CobroEndpoints {
  String baseServer;
  CobroEndpoints({
    required this.baseServer,
  });
}

import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

import '../../constant/constant.dart';
import '../model/response_character.dart';

import 'package:http/http.dart' as http;

class AppApi {
  Future<Either<Failer, ResponseCharacter>> getAllCharacterDetails() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(baseUrl, characterDetailsScreen);
      var response = await http.get(url);
      return Right(ResponseCharacter.fromJson(jsonDecode(response.body)));
    } else {
      return Left(Failer(massage: 'No Internet Connection'));
    }
  }
}

class Failer {
  String? massage;
  Failer({required this.massage});
}

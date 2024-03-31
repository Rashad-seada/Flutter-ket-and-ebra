import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../config/app_consts.dart';
import '../../../../di/app_module.dart';
import '../../../../errors/exception.dart';
import '../../../../infrastructure/api/api.dart';
import '../../entities/get_all_cities_response.dart';

abstract class CoreFeaturesRemoteDataSource {

  Future<GetAllCitiesResponse> getAllCities();

}

class CoreFeaturesRemoteDataSourceImpl implements CoreFeaturesRemoteDataSource{

  final _client = getIt<Api>();

  @override
  Future<GetAllCitiesResponse> getAllCities() async  {
    try {

      Response response = await _client.get(
        AppConsts.url + AppConsts.getAllSellersEndPoint,
      );

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }

      Map<String,dynamic> responseData = response.data;

      return GetAllCitiesResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

}
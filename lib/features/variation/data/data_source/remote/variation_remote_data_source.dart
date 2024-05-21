import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:smart_soft/features/variation/data/entities/get_all_sellers_response.dart';
import 'package:smart_soft/features/variation/data/entities/get_button_response.dart';
import 'package:smart_soft/features/variation/data/entities/get_chest_response.dart';
import 'package:smart_soft/features/variation/data/entities/get_collar_response.dart';
import 'package:smart_soft/features/variation/data/entities/get_embroidery_response.dart';
import 'package:smart_soft/features/variation/data/entities/get_front_pocket_response.dart';
import 'package:smart_soft/features/variation/data/entities/get_sleeve_response.dart';

import '../../../../../core/config/app_consts.dart';
import '../../../../../core/di/app_module.dart';
import '../../../../../core/errors/exception.dart';
import '../../../../../core/infrastructure/api/api.dart';
import '../../entities/get_fabric_response.dart';

abstract class VariationRemoteDataSource {
  Future<GetAllSellersResponse> getAllSellers();

  Future<GetAllSellersResponse> getSellersByLocationId(int id);

  Future<GetFabricResponse> getFabricBySellerId(int id);

  Future<GetCollarResponse> getCollarBySellerId(int id);

  Future<GetChestResponse> getChestBySellerId(int id);

  Future<GetFrontPocketResponse> getFrontPocketBySellerId(int id);

  Future<GetSleeveResponse> getSleeveBySellerId(int id);

  Future<GetButtonResponse> getButtonBySellerId(int id);

  Future<GetEmbroideryResponse> getEmbroideryBySellerId(int id);
}

class VariationRemoteDataSourceImpl implements VariationRemoteDataSource {

  final _client = getIt<Api>();


  @override
  Future<GetAllSellersResponse> getAllSellers() async {
    try {

      Response response = await _client.get(
          AppConsts.url + AppConsts.getAllSellersEndPoint,
      );

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }

      Map<String,dynamic> responseData = response.data;

      print(responseData);

      return GetAllSellersResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<GetButtonResponse> getButtonBySellerId(int id) async {
    try {

      Response response = await _client.get(
          AppConsts.url + AppConsts.getButtonEndPoint,
          queryParameters: {
            "SellerId": id
          }
      );

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }

      Map<String,dynamic> responseData = response.data;

      return GetButtonResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<GetChestResponse> getChestBySellerId(int id) async {
    try {

      Response response = await _client.get(
          AppConsts.url + AppConsts.getChestEndPoint,
          queryParameters: {
            "SellerId": id
          }
      );

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }

      Map<String,dynamic> responseData = response.data;

      return GetChestResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<GetCollarResponse> getCollarBySellerId(int id) async {
    try {

      Response response = await _client.get(
          AppConsts.url + AppConsts.getCollarEndPoint,
          queryParameters: {
            "SellerId": id
          }
      );

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }

      Map<String,dynamic> responseData = response.data;

      return GetCollarResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<GetEmbroideryResponse> getEmbroideryBySellerId(int id) async {
    try {

      Response response = await _client.get(
          AppConsts.url + AppConsts.getEmbroideryEndPoint,
          queryParameters: {
            "SellerId": id
          }
      );

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }

      Map<String,dynamic> responseData = response.data;

      return GetEmbroideryResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<GetFabricResponse> getFabricBySellerId(int id) async {
    try {

      Response response = await _client.get(
          AppConsts.url + AppConsts.getFabricEndPoint,
          queryParameters: {
            "SellerId": id
          }
      );

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }

      Map<String,dynamic> responseData = response.data;

      print(response.data);

      return GetFabricResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<GetFrontPocketResponse> getFrontPocketBySellerId(int id) async {
    try {

      Response response = await _client.get(
          AppConsts.url + AppConsts.getFrontPocketEndPoint,
          queryParameters: {
            "SellerId": id
          }
      );

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }

      Map<String,dynamic> responseData = response.data;

      return GetFrontPocketResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<GetAllSellersResponse> getSellersByLocationId(int id) async {
    try {

      Response response = await _client.get(
        AppConsts.url + AppConsts.getSellersByLocationIdEndPoint,
          queryParameters: {
            "CityId": id
          }
      );

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }

      Map<String,dynamic> responseData = response.data;

      return GetAllSellersResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<GetSleeveResponse> getSleeveBySellerId(int id) async {
    try {

      Response response = await _client.get(
          AppConsts.url + AppConsts.getSleeveEndPoint,
          queryParameters: {
              "SellerId": id
          }
      );

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }

      Map<String,dynamic> responseData = response.data;

      return GetSleeveResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }
}
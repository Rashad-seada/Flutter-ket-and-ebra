import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../../../../../../core/config/app_consts.dart';
import '../../../../../../core/di/app_module.dart';
import '../../../../../../core/errors/exception.dart';
import '../../../../../../core/infrastructure/api/api.dart';
import '../../entities/create_variation_response.dart';

abstract class SellerVariationRemoteDataSource {

  Future<CreateVariationResponse> createCollar({required String token, required String title,required String description,required XFile? image});

  Future<CreateVariationResponse> createChest({required String token, required String title,required String description,required XFile? image});

  Future<CreateVariationResponse> createFrontPocket({required String token, required String title,required String description,required XFile? image});

  Future<CreateVariationResponse> createSleeve({required String token, required String title,required String description,required XFile? image});

  Future<CreateVariationResponse> createEmbroidery({required String token, required String title,required String description,required double price,required XFile? image});

  Future<CreateVariationResponse> createFabric({required String token, required String title,required String description,required double price,required XFile? image});

  Future<CreateVariationResponse> createButton({required String token, required String title,required String description,required double price,required XFile? image});

}

class SellerVariationRemoteDataSourceImpl implements SellerVariationRemoteDataSource {

  final _client = getIt<Api>();

  @override
  Future<CreateVariationResponse> createButton({required String token, required String title, required String description,required double price, XFile? image}) async {
    try {

      FormData requestData = FormData.fromMap({
        "Name": title,
        "Description": description,
        "Price": price,

        if(image != null)
        "ButtonImg": await MultipartFile.fromFile(image.path, filename: basename(image.path)),
      });

      final response = await _client.post(
          AppConsts.url + AppConsts.createButtonEndPoint,
          headers: {
            'Authorization': 'Bearer $token',
          },
          data: requestData
      );

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }

      Map<String,dynamic> responseData = response.data;

      print(responseData);

      return CreateVariationResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<CreateVariationResponse> createChest({required String token, required String title, required String description, XFile? image}) async {
    try {

      FormData requestData = FormData.fromMap({
        "Name": title,
        "Description": description,

        if(image != null)
          "ChestImg": await MultipartFile.fromFile(image.path, filename: basename(image.path)),
      });

      final response = await _client.post(
          AppConsts.url + AppConsts.createChestEndPoint,
          headers: {
            'Authorization': 'Bearer $token',
          },
          data: requestData
      );

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }

      Map<String,dynamic> responseData = response.data;

      return CreateVariationResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<CreateVariationResponse> createCollar({required String token, required String title, required String description, XFile? image}) async {
    try {

      FormData requestData = FormData.fromMap({
        "Name": title,
        "Description": description,

        if(image != null)
          "YakaImg": await MultipartFile.fromFile(image.path, filename: basename(image.path)),
      });

      final response = await _client.post(
          AppConsts.url + AppConsts.createCollarEndPoint,
          headers: {
            'Authorization': 'Bearer $token',
          },
          data: requestData
      );

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }

      Map<String,dynamic> responseData = response.data;
      print(responseData);

      return CreateVariationResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<CreateVariationResponse> createEmbroidery({required String token, required String title, required String description,required double price, XFile? image}) async {
    try {

      FormData requestData = FormData.fromMap({
        "Name": title,
        "Description": description,
        "Price": price,

        if(image != null)
          "EmbroideryImg": await MultipartFile.fromFile(image.path, filename: basename(image.path)),
      });

      final response = await _client.post(
          AppConsts.url + AppConsts.createEmbroideryEndPoint,
          headers: {
            'Authorization': 'Bearer $token',
          },
          data: requestData
      );

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }

      Map<String,dynamic> responseData = response.data;
      print(responseData);

      return CreateVariationResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<CreateVariationResponse> createFabric({required String token, required String title, required String description,required double price,required XFile? image}) async {
    try {


      FormData requestData = FormData.fromMap({
        "Name": title,
        "Description": description,
        "Price": price,

        if(image != null)
          "TextureImg": await MultipartFile.fromFile(image.path, filename: basename(image.path)),
      });

      final response = await _client.post(
          AppConsts.url + AppConsts.createFabricEndPoint,
          headers: {
            'Authorization': 'Bearer $token',
          },
          data: requestData
      );


      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }

      Map<String,dynamic> responseData = response.data;

      return CreateVariationResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<CreateVariationResponse> createFrontPocket({required String token, required String title, required String description, XFile? image}) async {
    try {

      FormData requestData = FormData.fromMap({
        "Name": title,
        "Description": description,

        if(image != null)
          "PocketImg": await MultipartFile.fromFile(image.path, filename: basename(image.path)),
      });

      final response = await _client.post(
          AppConsts.url + AppConsts.createFrontPocketEndPoint,
          headers: {
            'Authorization': 'Bearer $token',
          },
          data: requestData
      );

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }

      Map<String,dynamic> responseData = response.data;
      print(responseData);

      return CreateVariationResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<CreateVariationResponse> createSleeve({required String token, required String title, required String description, XFile? image}) async {
    try {

      FormData requestData = FormData.fromMap({
        "Name": title,
        "Description": description,

        if(image != null)
          "HandImg": await MultipartFile.fromFile(image.path, filename: basename(image.path)),
      });

      final response = await _client.post(
          AppConsts.url + AppConsts.createSleeveEndPoint,
          headers: {
            'Authorization': 'Bearer $token',
          },
          data: requestData
      );

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }

      Map<String,dynamic> responseData = response.data;
      print(responseData);

      return CreateVariationResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

}
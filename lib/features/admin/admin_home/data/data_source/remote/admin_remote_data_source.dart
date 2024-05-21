import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/core/infrastructure/api/api.dart';
import 'package:smart_soft/features/admin/admin_home/data/entities/get_home_ads_by_admin_response.dart';
import 'package:smart_soft/features/admin/admin_home/data/entities/get_rejected_sellers_response.dart';
import 'package:path/path.dart';

import '../../../../../../core/config/app_consts.dart';
import '../../../../../../core/errors/exception.dart';
import '../../entities/approve_seller_response.dart';
import '../../entities/get_admin_home_response.dart';

abstract class AdminRemoteDataSource {

  Future<GetAdminHomeResponse> getAdminHome({required String token});

  Future<ApprovedSellerResponse> approvedSeller({required String token,required bool isApproved,required int sellerId});

  Future<GetRejectedSellersResponse> getRejectedSellers({required String token});

  Future<GetHomeAdsByAdminResponse> getHomeAdsByAdmin({required String token});

  Future<ApprovedSellerResponse> setHomeAdsByAdmin({required String token,int? sellerId, required XFile image,required String description});

  Future<ApprovedSellerResponse> deleteHomeAdsByAdmin({required String token,required int adId});

}

class AdminRemoteDataSourceImpl implements AdminRemoteDataSource {

  final _client = getIt<Api>();

  @override
  Future<GetAdminHomeResponse> getAdminHome({required String token}) async {
    try {
      print(1);

      final response = await _client.get(
          AppConsts.url + AppConsts.getAdminHomeEndPoint,
          headers: {
            'Authorization': 'Bearer $token',
          },
      );
      print(2);

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }
      print(response);

      Map<String,dynamic> responseData = response.data;

      print(4);

      print(responseData);

      return GetAdminHomeResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<ApprovedSellerResponse> approvedSeller({required String token, required bool isApproved, required int sellerId}) async  {
    try {

      final requestData = {
        "sellerId": sellerId,
        "isApproved": isApproved
      };

      final response = await _client.post(
        AppConsts.url + AppConsts.approveSellerEndPoint,
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

      return ApprovedSellerResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<GetRejectedSellersResponse> getRejectedSellers({required String token}) async {
    try {

      final response = await _client.get(
        AppConsts.url + AppConsts.getRejectedSellersEndPoint,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }

      Map<String,dynamic> responseData = response.data;

      print(responseData);

      return GetRejectedSellersResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<ApprovedSellerResponse> deleteHomeAdsByAdmin({required String token, required int adId}) async {
    try {

      final response = await _client.delete(
        AppConsts.url + AppConsts.deleteHomeAdByAdminEndPoint,
        headers: {
          'Authorization': 'Bearer $token',
        },
        queryParameters: {
          "id" : adId
        }
      );

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }

      Map<String,dynamic> responseData = response.data;

      print(responseData);

      return ApprovedSellerResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<GetHomeAdsByAdminResponse> getHomeAdsByAdmin({required String token}) async {
    try {

      final response = await _client.get(
        AppConsts.url + AppConsts.getHomeByAdminEndPoint,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }

      Map<String,dynamic> responseData = response.data;

      print(responseData);

      return GetHomeAdsByAdminResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<ApprovedSellerResponse> setHomeAdsByAdmin({required String token, int? sellerId, required XFile image, required String description}) async  {
    try {

      FormData requestData = FormData.fromMap({
        if(sellerId != null)
        "SellerId": sellerId,
        "Description": description,
        'Img': await MultipartFile.fromFile(image.path, filename: basename(image.path)),
      });

      final response = await _client.post(
        AppConsts.url + AppConsts.setHomeAdByAdminEndPoint,
        headers: {
          'Authorization': 'Bearer $token',
        },
        data: requestData
      );

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }

      Map<String,dynamic> responseData = response.data;


      return ApprovedSellerResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

}
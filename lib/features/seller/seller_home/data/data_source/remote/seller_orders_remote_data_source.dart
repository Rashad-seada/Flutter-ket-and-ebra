import "package:dio/dio.dart";
import "package:image_picker/image_picker.dart";
import "package:smart_soft/features/seller/seller_home/data/entities/mark_seller_order_response.dart";
import "package:smart_soft/features/seller/seller_home/data/entities/profile_response.dart";
import 'package:path/path.dart';

import "../../../../../../core/config/app_consts.dart";
import "../../../../../../core/di/app_module.dart";
import "../../../../../../core/errors/exception.dart";
import "../../../../../../core/infrastructure/api/api.dart";
import "../../entities/get_one_seller_response.dart";
import "../../entities/get_seller_orders_reponse.dart";

abstract class SellerOrdersRemoteDataSource {

  Future<GetSellerOrdersResponse> getSellerOrders({required String token,required int orderStatues});

  Future<MarkSellerOrderResponse> markSellerOrder({required String token,required int orderId});

  Future<GetOneSellerResponse> getSeller({required int id});

  Future<ProfileResponse> updateSellerDetails({required String token,required String username});

  Future<ProfileResponse> uploadSellerImageDetails({required String token,required XFile image});

}


class SellerOrdersRemoteDataSourceImpl implements SellerOrdersRemoteDataSource {

  final _client = getIt<Api>();


  @override
  Future<GetSellerOrdersResponse> getSellerOrders({required String token,required int orderStatues}) async {
    try {


      final response = await _client.get(
          AppConsts.url + AppConsts.getSellerOrdersEndPoint+"?OrderStatues=$orderStatues",
          headers: {
            "Authorization": "Bearer $token"
          },

      );

      print(token);

      print(response);

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }


      Map<String,dynamic> responseData = response.data;

      return GetSellerOrdersResponse.fromJson(responseData,);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<MarkSellerOrderResponse> markSellerOrder({required String token, required int orderId}) async {
    try {


      final response = await _client.post(
          AppConsts.url + AppConsts.markOrderEndPoint,
          headers: {
            "Authorization": "Bearer $token"
          }
      );

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }


      Map<String,dynamic> responseData = response.data;

      return MarkSellerOrderResponse.fromJson(responseData,);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<GetOneSellerResponse> getSeller({required int id}) async {
    try {

      final response = await _client.get(
          AppConsts.url + AppConsts.getSellerByIdEndPoint,
          queryParameters: {
            "id": id
          }
      );
      print(AppConsts.url + AppConsts.getSellerByIdEndPoint);

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }

      print(response.data);

      Map<String,dynamic> responseData = response.data;

      return GetOneSellerResponse.fromJson(responseData,);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<ProfileResponse> updateSellerDetails({required String token, required String username}) async {
    try {

      final requestData = {
        "Name": username,
      };

      final response = await _client.put(
          AppConsts.url + AppConsts.updateSellerDetailsEndPoint,
          data: requestData,
          headers: {
            "Authorization": "Bearer $token"
          }
      );
      print(response.data);

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }

      print(response.data);

      Map<String,dynamic> responseData = response.data;

      return ProfileResponse.fromJson(responseData,);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<ProfileResponse> uploadSellerImageDetails({required String token, required XFile image}) async {
    try {

    FormData requestData = FormData.fromMap({
      "Img": await MultipartFile.fromFile(image.path, filename: basename(image.path)),
    });

    final response = await _client.post(
        AppConsts.url + AppConsts.uploadSellerImageEndPoint,
        data: requestData,
        headers: {
          "Authorization": "Bearer $token"
        }
    );

    if(response.statusCode! >= 500){
      throw RemoteDataException("The was a server internal error");
    }

    print(response.data);

    Map<String,dynamic> responseData = response.data;

    return ProfileResponse.fromJson(responseData,);
  } catch (e) {
  throw RemoteDataException(e.toString());
  }
  }



}
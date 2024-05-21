import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_soft/features/home/data/entities/get_home_response.dart';
import 'package:path/path.dart';

import '../../../../../core/config/app_consts.dart';
import '../../../../../core/di/app_module.dart';
import '../../../../../core/errors/exception.dart';
import '../../../../../core/infrastructure/api/api.dart';

abstract class HomeRemoteDataSource  {

  Future<GetHomeResponse> getHome(String token);

  Future<GetHomeResponse> setHomeAd({
    required String token,
    required String sellerId,
    required String description,
    required XFile image,
  });


}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {

  final _client = getIt<Api>();

  @override
  Future<GetHomeResponse> getHome(String token) async {
    try {


      final response = await _client.get(
          AppConsts.url + AppConsts.getHomeByAdminEndPoint,
          headers: {
            "Authorization": "Bearer $token"
          }
      );

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }


      Map<String,dynamic> responseData = response.data;

      return GetHomeResponse.fromJson(responseData,);

    } catch (e) {
      throw RemoteDataException("حدث خطا غير متوقع. يرجى اعاده المحاوله");
    }

  }

  @override
  Future<GetHomeResponse> setHomeAd({required String token, required String sellerId, required String description, required XFile image}) async {
    try {

      FormData requestData = FormData.fromMap({
        "SellerId": sellerId,
        "Img": await MultipartFile.fromFile(image.path, filename: basename(image.path)),
        "Description": description
      });


      final response = await _client.post(
          AppConsts.url + AppConsts.setHomeAdByAdminEndPoint,
          data: requestData,
          headers: {
            "Authorization": "Bearer $token"
          }
      );

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }


      Map<String,dynamic> responseData = response.data;

      return GetHomeResponse.fromJson(responseData,);

    } catch (e) {
      throw RemoteDataException("حدث خطا غير متوقع. يرجى اعاده المحاوله");
    }
  }

}
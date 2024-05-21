import 'package:smart_soft/features/order/data/entities/create_order_response.dart';
import 'package:smart_soft/features/order/data/entities/get_all_orders_response.dart';

import '../../../../../core/config/app_consts.dart';
import '../../../../../core/di/app_module.dart';
import '../../../../../core/errors/exception.dart';
import '../../../../../core/infrastructure/api/api.dart';

abstract class OrderRemoteDataSource {


  Future<CreateOrderResponse> createOrder({required String token,required String username,required String phoneNumber, required int locationId,});

  Future<GetAllOrdersResponse> getUserOrder({
    required String token,
  });


}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {

  final _client = getIt<Api>();

  @override
  Future<CreateOrderResponse> createOrder({required String token, required String username, required String phoneNumber, required int locationId}) async {
    try {

      Map<String,dynamic> requestData = {
        "name": username,
        "phoneNumber": phoneNumber,
        "cityId": locationId
      };

      final response = await _client.post(
          AppConsts.url + AppConsts.createOrderEndPoint,
          data: requestData,
          headers: {
            "Authorization": "Bearer $token"
          }
      );

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }


      Map<String,dynamic> responseData = response.data;

      return CreateOrderResponse.fromJson(responseData,);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<GetAllOrdersResponse> getUserOrder({required String token}) async {
    try {

      final response = await _client.get(
          AppConsts.url + AppConsts.getAllOrdersEndPoint,
          headers: {
            "Authorization": "Bearer $token"
          }
      );

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }

      print(response.data);

      Map<String,dynamic> responseData = response.data;

      return GetAllOrdersResponse.fromJson(responseData,);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }
}
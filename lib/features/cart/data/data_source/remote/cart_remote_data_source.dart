import '../../../../../core/config/app_consts.dart';
import '../../../../../core/di/app_module.dart';
import '../../../../../core/errors/exception.dart';
import '../../../../../core/infrastructure/api/api.dart';
import '../../entities/cart_response.dart';

abstract class CartRemoteDataSource {

  Future<CartResponse> getCart(String token);

  Future<CartResponse> addToCart({
    required String token,
    required String sellerId,

    required String length,
    required String shoulder,
    required String sleeves,
    required String chest,
    required String neck,
    required String hand,
    required String cuff,

    required String fabricId,
    required String collarId,
    required String chestId,
    required String frontPocketId,
    required String sleeveId,
    required String buttonId,
    required String embroideryId,
  });

  Future<CartResponse> removeFromCart({required String token,required String cartItemId});

  Future<CartResponse> updateCartItem({
    required String token,
    required String cartItemId,

    required String length,
    required String shoulder,
    required String sleeves,
    required String chest,
    required String neck,
    required String hand,
    required String cuff,

    required String fabricId,
    required String collarId,
    required String chestId,
    required String frontPocketId,
    required String sleeveId,
    required String buttonId,
    required String embroideryId,
  });

}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {

  final _client = getIt<Api>();

  @override
  Future<CartResponse> addToCart({required String token, required String sellerId, required String length, required String shoulder, required String sleeves, required String chest, required String neck, required String hand, required String cuff, required String fabricId, required String collarId, required String chestId, required String frontPocketId, required String sleeveId, required String buttonId, required String embroideryId}) async {
    try {

      Map<String,dynamic> requestData = {
        "height": length,
        "shoulder": shoulder,
        "armLenght": hand,
        "chestWide": chest,
        "neck": neck,
        "handSize": sleeves,
        "kbkLength": cuff,
        "textureId": fabricId,
        "yakaId": collarId,
        "chestId": chestId,
        "frontPocketId": frontPocketId,
        "handId": sleeveId,
        "buttonsId": buttonId,
        "embroideryId": embroideryId,
        "sellerId": sellerId
      };
      print("token : "+token);

      print("Resquest : "+requestData.toString());

      final response = await _client.post(
          AppConsts.url + AppConsts.addToCartEndPoint,
          data: requestData,
          headers: {
            "Authorization": "Bearer $token"
          }
      );
      print("Response : "+response.data.runtimeType.toString());


      Map<String,dynamic> responseData = response.data ;

      return CartResponse.fromJson(responseData,);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<CartResponse> getCart(String token) async {
    try {

      final response = await _client.get(
          AppConsts.url + AppConsts.getCartEndPoint,
          headers: {
            "Authorization": "Bearer $token"
          }
      );

      if(response.statusCode! >= 400){
        throw RemoteDataException("The was a server internal error");
      }

      Map<String,dynamic> responseData = response.data;
      print(response.data);

      return CartResponse.fromJson(responseData,);

    } catch (e) {
      throw RemoteDataException("حدث خطا غير متوقع. يرجى اعاده المحاوله");
    }
  }

  @override
  Future<CartResponse> removeFromCart({required String token, required String cartItemId}) async  {
    try {

      final response = await _client.delete(
          AppConsts.url + AppConsts.removeCartItemEndPoint,
          queryParameters: {
            "CartDetailId": cartItemId,
          },
          headers: {
            "Authorization": "Bearer $token"
          }
      );

      print(response.data);


      if(response.statusCode! >= 400){
        throw RemoteDataException("The was a server internal error");
      }


      Map<String,dynamic> responseData = response.data;
      print(response.data);

      return CartResponse.fromJson(responseData,);

    } catch (e) {
      throw RemoteDataException("حدث خطا غير متوقع. يرجى اعاده المحاوله");
    }
  }

  @override
  Future<CartResponse> updateCartItem({required String token, required String cartItemId, required String length, required String shoulder, required String sleeves, required String chest, required String neck, required String hand, required String cuff, required String fabricId, required String collarId, required String chestId, required String frontPocketId, required String sleeveId, required String buttonId, required String embroideryId}) async {
    try {

      Map<String,dynamic> requestData = {
        "height": length,
        "shoulder": shoulder,
        "armLenght": hand,
        "chestWide": chest,
        "neck": neck,
        "handSize": sleeves,
        "kbkLength": cuff,
        "textureId": fabricId,
        "yakaId": collarId,
        "chestId": chestId,
        "frontPocketId": frontPocketId,
        "handId": sleeveId,
        "buttonsId": buttonId,
        "embroideryId": embroideryId,
        //"sellerrId": cartItemId
      };

      final response = await _client.put(
          AppConsts.url + AppConsts.updateCartItemEndPoint,
          data: requestData,
          headers: {
            "Authorization": "Bearer $token"
          }
      );

      if(response.statusCode! >= 400){
        throw RemoteDataException("The was a server internal error");
      }


      Map<String,dynamic> responseData = response.data;
      print(response.data);

      return CartResponse.fromJson(responseData,);

    } catch (e) {
      throw RemoteDataException("حدث خطا غير متوقع. يرجى اعاده المحاوله");
    }
  }


}
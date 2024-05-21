import 'package:smart_soft/features/seller/seller_variations/data/entities/delete_variant_response.dart';

import '../../../../../../core/config/app_consts.dart';
import '../../../../../../core/di/app_module.dart';
import '../../../../../../core/errors/exception.dart';
import '../../../../../../core/infrastructure/api/api.dart';
import '../../entities/seller_variants_response.dart';

abstract class SellerVariantsRemoteDataSource {

  Future<SellerVariantsResponse> getSellerVariants({required String token, required int variantNumber});

  Future<DeleteVariantResponse> deleteSellerVariants({required String token, required int variantNumber,required int id});

}

class SellerVariantsRemoteDataSourceImpl implements SellerVariantsRemoteDataSource {


  final _client = getIt<Api>();

  @override
  Future<SellerVariantsResponse> getSellerVariants({required String token, required int variantNumber}) async {
    try {

      final response = await _client.get(
          AppConsts.url + AppConsts.getSellerVariantsEndPoint,
          headers: {
            'Authorization': 'Bearer $token',
          },
        queryParameters: {
            "VarType" : variantNumber
        }
      );

      print(response.data);

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }

      return SellerVariantsResponse.fromJson(response.data);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<DeleteVariantResponse> deleteSellerVariants({required String token, required int variantNumber, required int id}) async {
    try {

      final response = await _client.delete(
          AppConsts.url + AppConsts.deleteSellerVariantsEndPoint,
          headers: {
            'Authorization': 'Bearer $token',
          },
          queryParameters: {
            "VarType" : variantNumber,
            "id": id
          },
      );

      if(response.statusCode! >= 500){
        throw RemoteDataException("The was a server internal error");
      }

      return DeleteVariantResponse.fromJson(response.data);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

}
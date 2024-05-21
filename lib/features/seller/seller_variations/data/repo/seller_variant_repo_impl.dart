
import 'package:dartz/dartz.dart';

import 'package:smart_soft/core/errors/failure.dart';
import 'package:smart_soft/features/seller/seller_variations/data/data_source/remote/seller_variants_remote_data_source.dart';
import 'package:smart_soft/features/seller/seller_variations/data/entities/delete_variant_response.dart';

import 'package:smart_soft/features/seller/seller_variations/data/entities/seller_variants_response.dart';

import '../../../../../core/di/app_module.dart';
import '../../../../../core/errors/exception.dart';
import '../../../../../core/infrastructure/services/network_service.dart';
import '../../domain/repo/seller_variant_repo.dart';

class SellerVariantRepoImpl implements SellerVariantRepo {


  SellerVariantsRemoteDataSource remoteDataSource = getIt<SellerVariantsRemoteDataSource>();
  NetworkService networkService = getIt<NetworkService>();

  @override
  Future<Either<Failure, SellerVariantsResponse>> getSellerVariants({required String token, required int variantNumber}) async  {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }

      SellerVariantsResponse response = await remoteDataSource.getSellerVariants(token: token, variantNumber: variantNumber);

      if (response.isSuccssed == false) {
        return left(RemoteDataFailure(
            response.message.toString(),
            failureCode: 1
        ));
      }

      return right(response);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, DeleteVariantResponse>> deleteSellerVariants({required String token, required int variantNumber, required int id}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }

      DeleteVariantResponse response = await remoteDataSource.deleteSellerVariants(token: token, variantNumber: variantNumber, id: id);

      if (response.isSuccssed == false) {
        return left(RemoteDataFailure(
            response.message.toString(),
            failureCode: 1
        ));
      }

      return right(response);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

}


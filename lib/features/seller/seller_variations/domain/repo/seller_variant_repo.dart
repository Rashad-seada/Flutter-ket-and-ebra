import 'package:dartz/dartz.dart';
import 'package:smart_soft/core/errors/failure.dart';

import '../../data/entities/delete_variant_response.dart';
import '../../data/entities/seller_variants_response.dart';

abstract class SellerVariantRepo {

  Future<Either<Failure,SellerVariantsResponse>> getSellerVariants({required String token, required int variantNumber});

  Future<Either<Failure,DeleteVariantResponse>> deleteSellerVariants({required String token, required int variantNumber,required int id});

}
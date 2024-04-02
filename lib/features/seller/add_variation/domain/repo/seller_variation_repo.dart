import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_soft/core/errors/failure.dart';

import '../../data/entities/create_variation_response.dart';

abstract class SellerVariationRepo {

  Future<Either<Failure,CreateVariationResponse>> createCollar({required String token, required String title,required String description,required XFile? image});

  Future<Either<Failure,CreateVariationResponse>> createChest({required String token, required String title,required String description,required XFile? image});

  Future<Either<Failure,CreateVariationResponse>> createFrontPocket({required String token, required String title,required String description,required XFile? image});

  Future<Either<Failure,CreateVariationResponse>> createSleeve({required String token, required String title,required String description,required XFile? image});

  Future<Either<Failure,CreateVariationResponse>> createEmbroidery({required String token, required String title,required String description,required double price,required XFile? image});

  Future<Either<Failure,CreateVariationResponse>> createFabric({required String token, required String title,required String description,required double price,required XFile? image});

  Future<Either<Failure,CreateVariationResponse>> createButton({required String token, required String title,required String description,required double price,required XFile? image});

}
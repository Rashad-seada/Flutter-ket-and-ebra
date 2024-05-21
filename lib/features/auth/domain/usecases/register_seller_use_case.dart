import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/features/auth/data/entities/register_seller_response.dart';
import 'package:smart_soft/features/auth/domain/repo/auth_repo.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/token_helper.dart';

class RegisterSellerUseCase {
  AuthRepo repo = getIt<AuthRepo>();

  Future<Either<Failure, RegisterSellerResponse>> call({
    required String username,
    required String phoneNumber,
    required String tradeRegister,
    required String taxId,
    required String password,
    required String locationId,
    required XFile registerImg,
  }) async {
      return await repo.registerSeller(
          username: username,
          phoneNumber: phoneNumber,
          tradeRegister: tradeRegister,
          taxId: taxId,
          password: password,
          locationId: locationId,
          registerImg: registerImg,
      );
  }
}

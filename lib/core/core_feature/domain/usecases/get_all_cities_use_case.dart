import 'package:dartz/dartz.dart';
import 'package:smart_soft/core/core_feature/data/entities/get_all_cities_response.dart';
import 'package:smart_soft/core/core_feature/domain/repo/core_features_repo.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/core/utils/token_helper.dart';
import 'package:smart_soft/features/auth/data/entities/login_response.dart';
import 'package:smart_soft/features/auth/domain/repo/auth_repo.dart';

import '../../../../core/errors/failure.dart';

class GetAllCitiesUseCase {

  CoreFeaturesRepo repo = getIt<CoreFeaturesRepo>();

  Future<Either<Failure, GetAllCitiesResponse>> call() async {
    return await repo.getAllCities();
  }

}
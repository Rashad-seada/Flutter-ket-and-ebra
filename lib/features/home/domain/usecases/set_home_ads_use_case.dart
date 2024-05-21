import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/features/auth/domain/usecases/get_user_use_case.dart';
import 'package:smart_soft/features/home/data/entities/get_home_response.dart';
import 'package:smart_soft/features/home/domain/repo/home_repo.dart';

import '../../../../core/errors/failure.dart';

class SetHomeAdsUseCase {

  HomeRepo repo = getIt<HomeRepo>();

  Future<Either<Failure, GetHomeResponse>> call({required String sellerId, required String description, required XFile image}) async {

    return getIt<GetUserUseCase>().call().then(
            (value) => value.fold(
                    (error) {
                      return left(error);
                    },
                    (success) async {
                      if(success.token == null){
                        return left(Failure("Please login first to access all features in the application", failureCode: 0));
                      }else {
                        return await repo.setHomeAd(token: success.token!, sellerId: sellerId, description: description, image: image);

                      }
                    }
            )
    );
  }

}
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/features/admin/admin_home/domain/repo/admin_repo.dart';
import 'package:smart_soft/features/auth/domain/usecases/get_user_use_case.dart';
import 'package:smart_soft/features/home/data/entities/get_home_response.dart';
import 'package:smart_soft/features/home/domain/repo/home_repo.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/entities/approve_seller_response.dart';

class DeleteHomeAdsByAdminUseCase {

  AdminRepo repo = getIt<AdminRepo>();

  Future<Either<Failure, ApprovedSellerResponse>> call({required int adId}) async {

    return getIt<GetUserUseCase>().call().then(
            (value) => value.fold(
                    (error) {
                      return left(error);
                    },
                    (success) async {
                      if(success.token == null){
                        return left(Failure("Please login first to access all features in the application", failureCode: 0));
                      }else {
                        return await repo.deleteHomeAdsByAdmin(token: success.token!, adId: adId);

                      }
                    }
            )
    );
  }

}
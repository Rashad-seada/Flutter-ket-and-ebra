
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_soft/features/auth/domain/usecases/get_user_use_case.dart';

import '../../../../../core/di/app_module.dart';
import '../../../../../core/errors/failure.dart';
import '../repo/seller_variation_repo.dart';

class CreateButtonUseCase {

  SellerVariationRepo repo = getIt<SellerVariationRepo>();

  Future<Either<Failure, void>> call({required String title, required String description,required double price, XFile? image, }) async {

    return getIt<GetUserUseCase>().call().then((value) => value.fold(
            (error) {
              return left(error);
            },
            (user) async {
              if(user.token != null) {
                return await repo.createButton(token: user.token!, title: title, description: description,image: image,price: price);

              }
              return left(
                Failure("You have to login and try again", failureCode: 0)
              );

            }
    ));
  }

}
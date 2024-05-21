import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/features/cart/views/blocs/cart/cart_cubit.dart';

import '../../../../../core/core_feature/domain/usecases/validate_sizes_use_case.dart';
import '../../../../../core/core_feature/domain/usecases/validate_text_use_case.dart';

part 'size_state.dart';

class SizeCubit extends Cubit<SizeState> {
  SizeCubit() : super(SizeInitial());

  TextEditingController lengthController = TextEditingController();
  TextEditingController shoulderController = TextEditingController();
  TextEditingController sleevesController = TextEditingController();
  TextEditingController chestController = TextEditingController();
  TextEditingController neckController = TextEditingController();
  TextEditingController handController = TextEditingController();
  TextEditingController cuffController = TextEditingController();

  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? validateField(text){
    return getIt<ValidateSizesUseCase>().call(text);
  }

  onAddToCartTap(BuildContext context) {
    if(formKey.currentState!.validate()){
      context.read<CartCubit>().addToCart(context);
    }
  }


}

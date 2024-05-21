import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_soft/core/errors/failure.dart';

import '../../data/entities/get_one_seller_response.dart';
import '../../data/entities/get_seller_orders_reponse.dart';
import '../../data/entities/mark_seller_order_response.dart';
import '../../data/entities/profile_response.dart';


abstract class SellerOrdersRepo {

  Future<Either<Failure,GetSellerOrdersResponse>> getSellerOrders({required String token,required int orderStatues});

  Future<Either<Failure,MarkSellerOrderResponse>> markSellerOrder({required String token,required int orderId});

  Future<Either<Failure,GetOneSellerResponse>> getSeller({required int id});

  Future<Either<Failure,ProfileResponse>> updateSellerDetails({required String token,required String username});

  Future<Either<Failure,ProfileResponse>> uploadSellerImageDetails({required String token,required XFile image});
}
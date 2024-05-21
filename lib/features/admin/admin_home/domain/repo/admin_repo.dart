import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_soft/core/errors/failure.dart';

import '../../data/entities/approve_seller_response.dart';
import '../../data/entities/get_admin_home_response.dart';
import '../../data/entities/get_home_ads_by_admin_response.dart';
import '../../data/entities/get_rejected_sellers_response.dart';

abstract class AdminRepo {

  Future<Either<Failure,GetAdminHomeResponse>> getAdminHome({required String token});

  Future<Either<Failure,ApprovedSellerResponse>> approvedSeller({required String token,required bool isApproved,required int sellerId});

  Future<Either<Failure,GetRejectedSellersResponse>> getRejectedSellers({required String token});

  Future<Either<Failure,GetHomeAdsByAdminResponse>> getHomeAdsByAdmin({required String token});

  Future<Either<Failure,ApprovedSellerResponse>> setHomeAdsByAdmin({required String token,int? sellerId, required XFile image,required String description});

  Future<Either<Failure,ApprovedSellerResponse>> deleteHomeAdsByAdmin({required String token,required int adId});


}
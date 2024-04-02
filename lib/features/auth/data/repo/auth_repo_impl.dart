import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_soft/features/auth/data/data_source/local_data_source/auth_local_data_source.dart';
import 'package:smart_soft/features/auth/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:smart_soft/features/auth/data/entities/login_response.dart';
import 'package:smart_soft/features/auth/data/entities/register_customer_response.dart';
import 'package:smart_soft/features/auth/data/entities/register_seller_response.dart';
import 'package:smart_soft/features/auth/data/entities/reset_password_response.dart';
import 'package:smart_soft/features/auth/data/entities/user_entity.dart';

import '../../../../core/di/app_module.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/infrastructure/services/network_service.dart';
import '../../domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {

  NetworkService networkService = getIt<NetworkService>();
  AuthRemoteDataSource remoteDataSource = getIt<AuthRemoteDataSource>();
  AuthLocalDataSource localDataSource = getIt<AuthLocalDataSource>();


  @override
  Future<Either<Failure, LoginResponse>> login({required String phoneNumber, required String password}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      LoginResponse loginResponse = await remoteDataSource.login(phoneNumber: phoneNumber, password: password);

      if (loginResponse.isSuccssed == false) {
        return left(RemoteDataFailure(
            loginResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(loginResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, RegisterCustomerResponse>> registerCustomer({required String username, required String phoneNumber, required String password}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }

      print("repo 1");

      final registerCustomerResponse = await remoteDataSource.registerCustomer(username: username, phoneNumber: phoneNumber, password: password);

      print("repo 2");
      if (registerCustomerResponse.isSuccssed == false) {
        return left(RemoteDataFailure(
            registerCustomerResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(registerCustomerResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, RegisterSellerResponse>> registerSeller({required String username, required String phoneNumber, required String tradeRegister, required String taxId, required String password, required String locationId, required XFile registerImg}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      RegisterSellerResponse registerSellerResponse = await remoteDataSource.registerSeller(username: username, phoneNumber: phoneNumber, tradeRegister: tradeRegister, taxId: taxId, password: password, locationId: locationId, registerImg: registerImg);

      if (registerSellerResponse.isSuccssed == false) {
        return left(RemoteDataFailure(
            registerSellerResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(registerSellerResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, ResetPasswordResponse>> resetPassword({required String newPassword, required String phoneNumber}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      ResetPasswordResponse resetPasswordResponse = await remoteDataSource.resetPassword(newPassword: newPassword, phoneNumber: phoneNumber);

      if (resetPasswordResponse.isSuccssed ?? false) {
        return left(RemoteDataFailure(
            resetPasswordResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(resetPasswordResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }


  @override
  Future<Either<Failure, void>> confirmOtp({required String otp}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }

      await remoteDataSource.confirmOtp(otp: otp);

      return right(null);

    }on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 1));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 2));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 3));
    }
  }

  @override
  Future<Either<Failure, void>> sendOtp({required String phoneNumber}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }

      await remoteDataSource.sendOtp(phoneNumber: phoneNumber);

      return right(null);

    }on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 1));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 2));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 3));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser() async {
    try{

      await localDataSource.deleteUser();

      return right(null);

    }on LocalDataException catch (e){
      return left(LocalDataFailure(e.message, failureCode: 1));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 3));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUser() async {
    try{

      final user = await localDataSource.getUser();

      return right(user);

    }on LocalDataException catch (e){
      return left(LocalDataFailure(e.message, failureCode: 1));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 3));
    }
  }

  @override
  Future<Either<Failure, void>> setUser(UserEntity user) async {
    try{

      await localDataSource.setUser(user);

      return right(null);

    }on LocalDataException catch (e){
      return left(LocalDataFailure(e.message, failureCode: 1));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 3));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateUser(UserEntity updatedUser) async {
    try{

      final user = await localDataSource.updateUser(updatedUser);

      return right(user);

    }on LocalDataException catch (e){
      return left(LocalDataFailure(e.message, failureCode: 1));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 3));
    }
  }


}
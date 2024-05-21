import 'package:flutter_network_connectivity/flutter_network_connectivity.dart';
import '../../errors/exception.dart';

abstract class NetworkService {

  Future<bool> get isConnected;

}

class NetworkServiceImpl implements NetworkService {


  @override
  Future<bool> get isConnected async {
    try {

      FlutterNetworkConnectivity _flutterNetworkConnectivity =
      FlutterNetworkConnectivity(
        isContinousLookUp: true,
      );

      return
      _flutterNetworkConnectivity.isInternetConnectionAvailable();


    } catch (e) {
      throw ServiceException("حدث خطا اثناء التحقق من الشبكه. يرجى اعاده المحاوله");
    }
  }

}
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
 Future<bool> get isConected;
}

class NetworkInfoImp implements NetworkInfo{ 
     NetworkInfoImp({required this.internetConnectionChecker});

  final InternetConnectionChecker internetConnectionChecker;


  
  @override

  Future<bool> get isConected =>  internetConnectionChecker.hasConnection;

}
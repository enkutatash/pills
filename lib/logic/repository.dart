import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pills/logic/firebase_operation.dart';
import 'package:pills/logic/local_data_source.dart';
import 'package:pills/models/pills_model.dart';

class Repository {
  // final LocalDataSource localDataSource;
  final FirebaseOperation firebaseOperation;
  final InternetConnectionChecker internetConnectionChecker =
      InternetConnectionChecker.createInstance();

  Repository({ required this.firebaseOperation});

  Future<bool> hasConnection() async {
    return await internetConnectionChecker.hasConnection;
  }

  Future<List<PillsModel>> fetchPills(String category) async {
    // List<PillsModel> localData = localDataSource.getCategory(category);

    // if (localData != null && localData.isNotEmpty) {
    //   return localData;
    // }
    print("repo");
    bool isConnected = await hasConnection();
    if (!isConnected) {
      throw Exception('No internet connection');
    }
    try {
      List<PillsModel> remoteData =
          await firebaseOperation.fetchPills(category);

      // Cache the fetched remote data in local storage
      // await localDataSource.saveCategory(category, remoteData);

      return remoteData;
    } catch (e) {
      throw Exception(e);
    }
  }
}

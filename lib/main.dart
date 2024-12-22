import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pills/bloc/pills_bloc.dart';
import 'package:pills/logic/firebase_operation.dart';
import 'package:pills/logic/local_data_source.dart';
import 'package:pills/logic/repository.dart';
import 'package:pills/route.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(); 
     final localDataSource = await LocalDataSource.create();
  runApp( MyApp(localDataSource: localDataSource,));
}

class MyApp extends StatelessWidget {
   final LocalDataSource localDataSource;
  const MyApp({super.key,required this.localDataSource});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [

      BlocProvider(create: (context)=>PillsBloc(
        repository: Repository(localDataSource: localDataSource,firebaseOperation: FirebaseOperation())
      )),

    ], child: MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Pills',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    ));
  }
}

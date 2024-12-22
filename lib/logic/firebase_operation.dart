import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pills/models/pills_model.dart';

class FirebaseOperation {
  final FirebaseFirestore _firestore;

  FirebaseOperation({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;
  Future<List<PillsModel>> fetchPills(String category) async {
   try{
     final pillsCollection = await _firestore
        .collection('pills')
        .where('category', isEqualTo: category)
        .get();
    return pillsCollection.docs.map((doc) {
      final community = PillsModel.fromFirebase(doc.data());
    
      return community;
    }).toList();
   }catch(e){
    
     throw Exception(e);
   }
  }
}

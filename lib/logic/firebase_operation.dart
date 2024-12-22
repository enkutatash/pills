import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pills/models/pills_model.dart';
import 'package:pills/models/word_entity.dart';

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
      final pills = PillsModel.fromFirebase(doc.data());
    
      return pills;
    }).toList();
   }catch(e){
    
     throw Exception(e);
   }
  }

  Future<List<WordEntity>> fetchWord() async {
   try{
     final wordsCollection = await _firestore
        .collection('dictionary')
        .get();
    return wordsCollection.docs.map((doc) {
      final word = WordEntity.fromJson(doc.data());
    
      return word;
    }).toList();
   }catch(e){
    
     throw Exception(e);
   }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pills/models/category_model.dart';
import 'package:pills/models/pills_model.dart';
import 'package:pills/models/word_entity.dart';

class FirebaseOperation {
  final FirebaseFirestore _firestore;

  FirebaseOperation({FirebaseFirestore? firestore}) : _firestore = firestore ?? FirebaseFirestore.instance;

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

  Future<List<WordEntity>> fetchwords() async {
    try {
        final wordCollection = await _firestore.collection('dict').get();

        final result = wordCollection.docs.map((doc) {
          final single = WordEntity.fromJson(doc.data());
          return single;
        });

        return result.toList();
    } catch (e) {
        throw Exception(e);
    }
  }

  Future<List<CategoryModel>> fetchCategory() async {
    try {
      final categories = await _firestore.collection('categories').get();

      final result = categories.docs.map((doc) {
        final single = CategoryModel.fromJson(doc.data());
        return single;
      });

      return result.toList();
    }catch(e) {
      throw Exception(e);
    }
  }

}

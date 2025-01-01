import 'package:cloud_firestore/cloud_firestore.dart';
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

  // Future<List<WordEntity>> fetchwords() async {
  //   try {
  //       final wordCollection = await _firestore.collection('dict').get();

  //       final result = wordCollection.docs.map((doc) {
  //         final single = WordEntity.fromJson(doc.data());
  //         return single;
  //       });

  //       return result.toList();
  //   } catch (e) {
  //       throw Exception(e);
  //   }
  // }

  Future<List<WordEntity>> fetchwords() async {
  try {

    final wordCollection = await _firestore.collection('dict').get();
    
    print('Fetched ${wordCollection.size} documents from Firestore.');

    final result = wordCollection.docs.map((doc) {
      print('Document ID: ${doc.id}');
      print('Document Data: ${doc.data()}');

      final single = WordEntity.fromJson(doc.data());
      print('Mapped WordEntity: ${single.toString()}');
      
      return single;
    });

    print('Mapped ${result.length} words.');

    return result.toList();
  } catch (e) {
    print('Error occurred: $e');
    throw Exception(e);
  }
}

}

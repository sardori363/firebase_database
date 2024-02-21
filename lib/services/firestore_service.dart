import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  static String pathA = 'a';
  static final FirebaseFirestore db = FirebaseFirestore.instance;
  static List<QueryDocumentSnapshot<Map<String, dynamic>>> documents = [];

  static Future<void> storeData({required Map<String, dynamic> data}) async {
    await db.collection(pathA).add(data);
  }

  static Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> readAllData() async {
    await db.collection(pathA).get().then((value) {
      for (var doc in value.docs) {
        documents.add(doc);
      }
    });
    return documents;
  }

  static Future<void> delete({required String id}) async {
    await db.collection(pathA).doc(id).delete();
  }

  static Future<void> update({required String id, required Map<String, dynamic> data}) async {
    await db.collection(pathA).doc(id).update(data);
  }
}
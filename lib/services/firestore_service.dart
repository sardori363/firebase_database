import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  static String pathA = 'a';
  static final FirebaseFirestore db = FirebaseFirestore.instance;
  static List<QueryDocumentSnapshot<Map<String, dynamic>>> documents = [];

  static Future<void> storeData({required Map<String, dynamic> data}) async {
    await db.collection(pathA).add(data);
  }

static Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> readAllData() async {
  try {
    final querySnapshot = await db.collection(pathA).orderBy('content', descending: true).get();
    documents.clear(); // Clear existing data before adding new documents
    for (var doc in querySnapshot.docs) {
      documents.add(doc);
    }
    return documents;
  } catch (e) {
    print('Error reading data: $e');
    return []; // Return an empty list in case of error
  }
}


  static Future<void> delete({required String id}) async {
    await db.collection(pathA).doc(id).delete();
  }

  static Future<void> update({required String id, required Map<String, dynamic> data}) async {
    await db.collection(pathA).doc(id).update(data);
  }
}
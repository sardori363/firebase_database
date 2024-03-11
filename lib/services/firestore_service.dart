import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class FireStoreService {
  static String pathA = 'a';
  static final FirebaseFirestore db = FirebaseFirestore.instance;
  static List<QueryDocumentSnapshot<Map<String, dynamic>>> documents = [];

  static DatabaseReference ref = FirebaseDatabase.instance.ref();

  static Future<void>storeData({required Map<String, dynamic> data, required String path})async{
    String? key = ref.child(path).push().key;
    await ref.child(path).child(key!).set(data);
  }

static Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> readAllData() async {
  try {
    final querySnapshot = await db.collection(pathA).orderBy('id', descending: true).get();
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

static Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> search(String str) async {
  try {
    final querySnapshot = await db.collection(pathA).where(str, isEqualTo: "a").orderBy('str', descending: true).get();
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
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  Future<List<Map<String, dynamic>>> getUsers() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();

      return querySnapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print("Erreur lors de la récupération des utilisateurs: $e");
      return [];
    }
  }
}

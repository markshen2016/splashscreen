import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/savedDara.dart';

Future<bool> addData(
  String id,
  String splash,
  String color,
  String logo,
  String message,
) async {
  try {
    String uid = FirebaseAuth.instance.currentUser.uid;
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('SiteData').doc(id);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set({
          'uid': uid,
          'splash': splash,
          'color': color,
          'logo': logo,
          'message': message,
        });
        return true;
      }
      transaction.update(documentReference, {
        'uid': uid,
        'splash': splash,
        'color': color,
        'logo': logo,
        'message': message,
      });
      return true;
    });
    return true;
  } catch (e) {
    return false;
  }
}

Future<SavedData> readData(String id) async {
  final firestoreInstance = FirebaseFirestore.instance;
  SavedData returnData;
  await firestoreInstance
      .collection("SiteData")
      .doc(id)
      .get()
      .then((querySnapshot) {
    print(querySnapshot.data()['splash']);
    returnData = SavedData(
      querySnapshot.data()['splash'],
      querySnapshot.data()['color'],
      querySnapshot.data()['logo'],
      querySnapshot.data()['message'],
    );
  });

  return returnData;
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pembelajaran_ke_5/users_models.dart';
class UserServices{
  CollectionReference collectionReference = FirebaseFirestore.instance.collection(
    "user"
    );
    Future <void> dataUser(UsersModels user) async{
      try {
        collectionReference.doc(user.id).set({
          "username" : user.username,
          "email" :user.email,
        });
      } catch (e) {
        throw Exception(
          "Error $e",
        );
      }
    }
    Future<UsersModels> dataId(String id) async {
      try {
        DocumentSnapshot documentSnapshot = await collectionReference.doc(id). get();
        return UsersModels(
         id: id,
        email: documentSnapshot["email"],
        username: documentSnapshot["username"],
        );
      } catch (e) {
        throw Exception(
          "Error: $e"
        );
      }
    }
}
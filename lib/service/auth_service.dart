import 'package:firebase_auth/firebase_auth.dart';
import 'package:pembelajaran_ke_5/service/user_services.dart';
import 'package:pembelajaran_ke_5/users_models.dart';

class AuthService{
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<UsersModels> signUp({
    required String name,
    required String email,
    required String password,
  }) async{
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email, 
        password: password
        );
        UsersModels user = UsersModels(
          id: userCredential.user!.uid,
          username: name,
          email: email,
        );
        await UserServices().dataUser(user);
        return user;
    } catch (e) {
      throw Exception("Error: $e");
    }
  }Future<UsersModels> signIn({
    required String email,
    required String password,
  }) async{
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email, 
        password: password
        );
        UsersModels user = await UserServices().dataId(userCredential.user!.uid,);
        await UserServices().dataUser(user);
        return user;
    } catch (e) {
      throw Exception("Error: $e"
      );
    }
  }
  Future <void> logout () async {
    try {
      // ignore: avoid_print
      print(
        "Logout Berhasil: ${auth.signOut()}",
      );
      await auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}

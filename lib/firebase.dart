import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Authendication{

   registerUser(String email,String password)async{
    var res  = "Failed";
    try{
      print("asdfg");
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

      res = "User Register Successfully";
      return res;

    }catch(k){
      return res;
    }
  }

  signinUser(String email,String Password)async{
 var res = "";
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: Password);

      res = "Signin Successfully";
      print(res);
      return res;
    }catch(e){
      res = "Failed ${e.toString()}";
      return res;
    }

    return res;
  }
  }

 import 'package:cloud_firestore/cloud_firestore.dart';
 import 'package:xnlivescore/models/users.dart';

 class DatabaseService {

 final String uid;
   DatabaseService({ this.uid });

   // Collection Reference
   final CollectionReference userCollection = Firestore.instance.collection('users');

   Future<void> updateUserData(String email, String name, String phone) async{
     return await userCollection.document(uid).setData({
       'email': email,
       'name': name,
       'phone': phone,
     });
   }

   // User list from snapshot [Using 'Model/Users']
   List<Users> _userListFromSnapshot(QuerySnapshot snapshot) {
     return snapshot.documents.map((doc){
       //print(doc.data);
       return Users(
         name: doc.data['name'] ?? '',
         email: doc.data['email'] ?? '',
       );
     }).toList();
   }

   //Get User streams
   Stream<List<Users>> get users {
     return userCollection.snapshots()
     .map(_userListFromSnapshot);
   }
 }
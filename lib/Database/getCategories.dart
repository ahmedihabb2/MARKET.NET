import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesServices
{
  CollectionReference cat = FirebaseFirestore.instance.collection("Categories");

  Future<List> getCategories()
  async{
    DocumentSnapshot catDoc =await cat.doc('cat-names').get();
    List names = catDoc.get('list');
    return names;
  }

}
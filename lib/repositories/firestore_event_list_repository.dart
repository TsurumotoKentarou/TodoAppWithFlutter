import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/blocs/event_list/event_list_repository.dart';
import 'package:todo_app/models/event.dart';

class FirestoreEventListRepository extends EventListRepository {
  final FirebaseFirestore _firestore;

  FirestoreEventListRepository({FirebaseFirestore firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Event>> fetch() {
    return _firestore.collection("events").snapshots().map((snapshot) {
      return snapshot.docs.map((docs) {
        Map<String, dynamic> data = docs.data();
        return Event(
          id: docs.id,
          title: data['title'] ?? "",
          description: data["description"] ?? "",
          date: data["date"]?.toDate() ?? DateTime.utc(2019),
          imageUrl: data["image_url"] ?? "",
        );
      }).toList();
    });
  }
}

import 'package:todo_app/blocs/event_list/event_list_repository.dart';
import 'package:todo_app/models/event.dart';

class FirestoreEventListRepository extends EventListRepository {
  @override
  Stream<List<Event>> fetch() {
    return _firestore
        .collection("events")
        .snapshots()
        .map((snapshot) {
      return snapshot.documents.map((docs) {
        return Event(
          id: docs.documentID,
          title: docs.data["title"] ?? "",
          description: docs.data["description"] ?? "",
          date: docs.data["date"]?.toDate() ?? DateTime.utc(2019),
          imageUrl: docs.data["image_url"] ?? "",
        );
      }).toList();
    }
        }
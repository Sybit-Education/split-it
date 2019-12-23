class EventPerson {
  final int id;
  final int eventId;
  final String personId;

  EventPerson({this.id, this.eventId, this.personId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'eventId': eventId,
      'personId': personId,
    };
  }
}
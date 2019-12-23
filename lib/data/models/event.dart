class Event {
  final int id;
  final String name;

  Event({this.id, this.name});

  // Convert into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
class BillAccount {
  final int id;
  final int eventId;
  final int personId;
  String description;
  double amount;

  BillAccount({this.id, this.eventId, this.personId, this.description, this.amount});

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'eventId': eventId,
      'personId': personId,
      'description': description,
      'amount': amount,
    };
  }
}
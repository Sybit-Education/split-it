class BillAccount {
  final int id;
  final int eventId;
  final int personId;
  String description;
  double amount;

  BillAccount({this.id, this.eventId, this.personId, this.description, this.amount});

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
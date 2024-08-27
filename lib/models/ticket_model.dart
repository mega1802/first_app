class Ticket {
  final int? ticketId; // Nullable if auto-incremented by the database
  final String assetType;
  final String assetSubType;
  final String issueType;
  final String description;
  final String status;
  final String date;

  Ticket({
    this.ticketId,
    required this.assetType,
    required this.assetSubType,
    required this.issueType,
    required this.description,
    required this.status,
    required this.date, required id,
  });

  // Convert a Ticket object into a Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'ticketId': ticketId,
      'assetType': assetType,
      'assetSubType': assetSubType,
      'issueType': issueType,
      'description': description,
      'status': status,
      'date': date,
    };
  }

  // Create a Ticket object from a Map<String, dynamic>
  factory Ticket.fromMap(Map<String, dynamic> map) {
    return Ticket(
      ticketId: map['ticketId'],
      assetType: map['assetType'],
      assetSubType: map['assetSubType'],
      issueType: map['issueType'],
      description: map['description'],
      status: map['status'],
      date: map['date'],
      id: map['id'],
    );
  }
}

class OrganizationModel {
  int? id;
  String name;
  String adminFirstName;
  String adminLastName;
  String type;
  String category;
  String size;
  String gstNo;
  String msmeNo;
  String contactNo;
  String address;

  OrganizationModel({
    this.id,
    required this.name,
    required this.adminFirstName,
    required this.adminLastName,
    required this.type,
    required this.category,
    required this.size,
    required this.gstNo,
    required this.msmeNo,
    required this.contactNo,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'admin_first_name': adminFirstName,
      'admin_last_name': adminLastName,
      'type': type,
      'category': category,
      'size': size,
      'gst_no': gstNo,
      'msme_no': msmeNo,
      'contact_no': contactNo,
      'address': address,
    };
  }

  factory OrganizationModel.fromMap(Map<String, dynamic> map) {
    return OrganizationModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] ?? '',
      adminFirstName: map['admin_first_name'] ?? '',
      adminLastName: map['admin_last_name'] ?? '',
      type: map['type'] ?? '',
      category: map['category'] ?? '',
      size: map['size'] ?? '',
      gstNo: map['gst_no'] ?? '',
      msmeNo: map['msme_no'] ?? '',
      contactNo: map['contact_no'] ?? '',
      address: map['address'] ?? '',
    );
  }
}

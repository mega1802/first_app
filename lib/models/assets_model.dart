class Asset {
  final int? id;
  final String assetType;
  final String modelName;
  final String modelNo;
  final String serialNo;

  Asset({
    this.id,
    required this.assetType,
    required this.modelName,
    required this.modelNo,
    required this.serialNo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'assetType': assetType,
      'modelName': modelName,
      'modelNo': modelNo,
      'serialNo': serialNo,
    };
  }

  @override
  String toString() {
    return 'Asset{id: $id, assetType: $assetType, modelName: $modelName, modelNo: $modelNo, serialNo: $serialNo}';
  }
}

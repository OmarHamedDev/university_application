class RequestTypeRequestModel {
  final String name;
  final num price;
  final String description;

  const RequestTypeRequestModel({
    required this.name,
    required this.price,
    required this.description,
  });

  RequestTypeRequestModel copyWith({
    String? name,
    num? price,
    String? description,
  }) {
    return RequestTypeRequestModel(
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
    );
  }

  /// تحويل JSON إلى كائن من النوع ده
  factory RequestTypeRequestModel.fromJson(Map<String, dynamic> json) {
    return RequestTypeRequestModel(
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
      description: json['description'] ?? '',
    );
  }

  /// تحويل الكائن إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'description': description,
    };
  }

  @override
  String toString() =>
      'RequestTypeRequestModel(name: $name, price: $price, description: $description)';
}

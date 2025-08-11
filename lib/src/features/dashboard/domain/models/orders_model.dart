class OrdersData {
  final OrderModel? startedOrder;
  final List<OrderModel> currentOrders;
  final bool hasStartedOrder;

  OrdersData({
    required this.startedOrder,
    required this.currentOrders,
    required this.hasStartedOrder,
  });

  factory OrdersData.fromJson(Map<String, dynamic> json) {
    return OrdersData(
      startedOrder: json['startedOrder'] != null
          ? OrderModel.fromJson(json['startedOrder'])
          : null,
      currentOrders: (json['currentOrders'] as List)
          .map((e) => OrderModel.fromJson(e))
          .toList(),
      hasStartedOrder: json['hasStartedOrder'] ?? false,
    );
  }
}

class OrderModel {
  final String id;
  final String orderNumber;
  final String status;
  final String? duration;
  final String? location;
  final ClientModel client;
  final RiderModel? rider;
  final AgentModel? agent;
  final List<OrderProduct> products;
  final double totalAmount;
  final String paymentMethod;
  final String? notes;

  OrderModel({
    required this.id,
    required this.orderNumber,
    required this.status,
    required this.client,
    required this.products,
    required this.totalAmount,
    required this.paymentMethod,
    this.rider,
    this.agent,
    this.duration,
    this.location,
    this.notes,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['_id'],
      orderNumber: json['orderNumber'] ?? '',
      status: json['status'] ?? '',
      duration: json['duration'],
      location: json['location'] is String ? json['location'] : null,
      client: ClientModel.fromJson(json['client']),
      rider: json['rider'] != null ? RiderModel.fromJson(json['rider']) : null,
      agent: json['agent'] != null ? AgentModel.fromJson(json['agent']) : null,
      products: (json['products'] as List)
          .map((e) => OrderProduct.fromJson(e))
          .toList(),
      totalAmount: (json['totalAmount'] ?? 0).toDouble(),
      paymentMethod: json['paymentMethod'] ?? '',
      notes: json['notes'],
    );
  }
}

class ClientModel {
  final String id;
  final String name;
  final String address;
  final String? city;
  final List<String> phone;

  ClientModel({
    required this.id,
    required this.name,
    required this.address,
    this.city,
    required this.phone,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json['_id'],
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      city: json['city'],
      phone: List<String>.from(json['phone'] ?? []),
    );
  }
}

class RiderModel {
  final String id;
  final String username;

  RiderModel({
    required this.id,
    required this.username,
  });

  factory RiderModel.fromJson(Map<String, dynamic> json) {
    return RiderModel(
      id: json['_id'],
      username: json['username'] ?? '',
    );
  }
}

class AgentModel {
  final String id;
  final String username;

  AgentModel({
    required this.id,
    required this.username,
  });

  factory AgentModel.fromJson(Map<String, dynamic> json) {
    return AgentModel(
      id: json['_id'],
      username: json['username'] ?? '',
    );
  }
}

class OrderProduct {
  final Product product;
  final int quantity;
  final double price;

  OrderProduct({
    required this.product,
    required this.quantity,
    required this.price,
  });

  factory OrderProduct.fromJson(Map<String, dynamic> json) {
    return OrderProduct(
      product: Product.fromJson(json['product']),
      quantity: json['quantity'],
      price: (json['price'] ?? 0).toDouble(),
    );
  }
}

class Product {
  final String id;
  final String name;
  final double price;
  final String sku;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.sku,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      name: json['name'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      sku: json['sku'] ?? '',
    );
  }
}

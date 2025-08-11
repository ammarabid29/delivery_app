class LoginModel {
  int? statusCode;
  LoginDataModel? data;
  String? message;
  bool? success;

  LoginModel({this.statusCode, this.data, this.message, this.success});

  LoginModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    data = json['data'] != null ? new LoginDataModel.fromJson(json['data']) : null;
    message = json['message'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['success'] = this.success;
    return data;
  }
}

class LoginDataModel {
  User? user;
  String? accessToken;
  String? refreshToken;

  LoginDataModel({this.user, this.accessToken, this.refreshToken});

  LoginDataModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}

class User {
  String? sId;
  Null? avatar;
  String? username;
  String? email;
  String? phone;
  String? city;
  String? country;
  String? role;
  String? dob;
  bool? isVerified;
  bool? isActive;
  String? status;
  bool? isOnline;
  bool? twoStepVerification;
  String? deliveryCompany;
  DeliveryRiderStock? deliveryRiderStock;
  String? vehicleDetails;
  String? createdBy;
  String? team;
  int? rating;
  Null? warehouse;
  bool? forgotPasswordRequest;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.sId,
      this.avatar,
      this.username,
      this.email,
      this.phone,
      this.city,
      this.country,
      this.role,
      this.dob,
      this.isVerified,
      this.isActive,
      this.status,
      this.isOnline,
      this.twoStepVerification,
      this.deliveryCompany,
      this.deliveryRiderStock,
      this.vehicleDetails,
      this.createdBy,
      this.team,
      this.rating,
      this.warehouse,
      this.forgotPasswordRequest,
      this.createdAt,
      this.updatedAt,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    avatar = json['avatar'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    city = json['city'];
    country = json['country'];
    role = json['role'];
    dob = json['dob'];
    isVerified = json['isVerified'];
    isActive = json['isActive'];
    status = json['status'];
    isOnline = json['isOnline'];
    twoStepVerification = json['twoStepVerification'];
    deliveryCompany = json['deliveryCompany'];
    deliveryRiderStock = json['deliveryRiderStock'] != null
        ? new DeliveryRiderStock.fromJson(json['deliveryRiderStock'])
        : null;
    vehicleDetails = json['vehicleDetails'];
    createdBy = json['createdBy'];
    team = json['team'];
    rating = json['rating'];
    warehouse = json['warehouse'];
    forgotPasswordRequest = json['forgotPasswordRequest'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['avatar'] = this.avatar;
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['city'] = this.city;
    data['country'] = this.country;
    data['role'] = this.role;
    data['dob'] = this.dob;
    data['isVerified'] = this.isVerified;
    data['isActive'] = this.isActive;
    data['status'] = this.status;
    data['isOnline'] = this.isOnline;
    data['twoStepVerification'] = this.twoStepVerification;
    data['deliveryCompany'] = this.deliveryCompany;
    if (this.deliveryRiderStock != null) {
      data['deliveryRiderStock'] = this.deliveryRiderStock!.toJson();
    }
    data['vehicleDetails'] = this.vehicleDetails;
    data['createdBy'] = this.createdBy;
    data['team'] = this.team;
    data['rating'] = this.rating;
    data['warehouse'] = this.warehouse;
    data['forgotPasswordRequest'] = this.forgotPasswordRequest;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class DeliveryRiderStock {
  int? filledCylinders;
  int? emptyCylinders;
  int? damagedCylinders;
  int? missingCylinders;
  String? sId;

  DeliveryRiderStock(
      {this.filledCylinders,
      this.emptyCylinders,
      this.damagedCylinders,
      this.missingCylinders,
      this.sId});

  DeliveryRiderStock.fromJson(Map<String, dynamic> json) {
    filledCylinders = json['filledCylinders'];
    emptyCylinders = json['emptyCylinders'];
    damagedCylinders = json['damagedCylinders'];
    missingCylinders = json['missingCylinders'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['filledCylinders'] = this.filledCylinders;
    data['emptyCylinders'] = this.emptyCylinders;
    data['damagedCylinders'] = this.damagedCylinders;
    data['missingCylinders'] = this.missingCylinders;
    data['_id'] = this.sId;
    return data;
  }
}

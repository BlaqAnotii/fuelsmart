class User {
  final String message;
  final UserData data;

  User({
    required this.message,
    required this.data,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      message: json['message'] ?? '',
      data: UserData.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "data": data.toJson(),
    };
  }
}

class UserData {
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String? gender;
  final String? homeAddress;
  final String? city;
  final String? state;
  final String? landmark;
  final bool isRetailer;
  final String? vendorName;
  final String? vendorAddress;
  final String? vendorRegNo;
  final String? vendorPhone;
  final String? vendorCertificateUrl;
  final bool isEmailVerified;

  UserData({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    this.gender,
    this.homeAddress,
    this.city,
    this.state,
    this.landmark,
    required this.isRetailer,
    this.vendorName,
    this.vendorAddress,
    this.vendorRegNo,
    this.vendorPhone,
    this.vendorCertificateUrl,
    required this.isEmailVerified,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      email: json['email'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      gender: json['gender'],
      homeAddress: json['home_address'],
      city: json['city'],
      state: json['state'],
      landmark: json['landmark'],
      isRetailer: json['is_retailer'] ?? false,
      vendorName: json['vendor_name'],
      vendorAddress: json['vendor_address'],
      vendorRegNo: json['vendor_reg_no'],
      vendorPhone: json['vendor_phone'],
      vendorCertificateUrl: json['vendor_certificate_url'],
      isEmailVerified: json['is_email_verified'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
      "phone_number": phoneNumber,
      "gender": gender,
      "home_address": homeAddress,
      "city": city,
      "state": state,
      "landmark": landmark,
      "is_retailer": isRetailer,
      "vendor_name": vendorName,
      "vendor_address": vendorAddress,
      "vendor_reg_no": vendorRegNo,
      "vendor_phone": vendorPhone,
      "vendor_certificate_url": vendorCertificateUrl,
      "is_email_verified": isEmailVerified,
    };
  }
}

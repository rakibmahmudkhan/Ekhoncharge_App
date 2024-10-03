class AdminUser {
  List<UserData>? _data;
  int? _total;

  AdminUser({List<UserData>? data, int? total}) {
    if (data != null) {
      _data = data;
    }
    if (total != null) {
      _total = total;
    }
  }

  List<UserData>? get data => _data;

  set data(List<UserData>? data) => _data = data;

  int? get total => _total;

  set total(int? total) => _total = total;

  AdminUser.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = <UserData>[];
      json['data'].forEach((v) {
        _data!.add(UserData.fromJson(v));
      });
    }
    _total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_data != null) {
      data['data'] = _data!.map((v) => v.toJson()).toList();
    }
    data['total'] = _total;
    return data;
  }
}

class UserData {
  int? _id;
  String? _username;
  String? _email;
  String? _photo;
  String? _status;
  String? _locationNames;
  String? _companyName;
  int? _role;
  String? _roleName;
  String? _emailVerifiedAt;
  String? _createdAt;
  String? _updatedAt;
  dynamic _locations;

  UserData({
    int? id,
    String? username,
    String? email,
    String? photo,
    String? status,
    String? locationNames,
    String? companyName,
    int? role,
    String? roleName,
    String? emailVerifiedAt,
    String? createdAt,
    String? updatedAt,
    dynamic locations,
  }) {
    if (id != null) {
      _id = id;
    }
    if (username != null) {
      _username = username;
    }
    if (email != null) {
      _email = email;
    }
    if (photo != null) {
      _photo = photo;
    }
    if (status != null) {
      _status = status;
    }
    if (locationNames != null) {
      _locationNames = locationNames;
    }
    if (companyName != null) {
      _companyName = companyName;
    }
    if (role != null) {
      _role = role;
    }
    if (roleName != null) {
      _roleName = roleName;
    }
    if (emailVerifiedAt != null) {
      _emailVerifiedAt = emailVerifiedAt;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
    if (locations != null) {
      _locations = locations;
    }
  }

  int? get id => _id;

  set id(int? id) => _id = id;

  String? get username => _username;

  set username(String? username) => _username = username;

  String? get email => _email;

  set email(String? email) => _email = email;

  String? get photo => _photo;

  set photo(String? photo) => _photo = photo;

  String? get status => _status;

  set status(String? status) => _status = status;

  String? get locationNames => _locationNames;

  set locationNames(String? locationNames) => _locationNames = locationNames;

  String? get companyName => _companyName;

  set companyName(String? companyName) => _companyName = companyName;

  int? get role => _role;

  set role(int? role) => _role = role;

  String? get roleName => _roleName;

  set locations(dynamic locations) => _locations = locations;

  dynamic get locations => _locations;

  set roleName(String? roleName) => _roleName = roleName;

  String? get emailVerifiedAt => _emailVerifiedAt;

  set emailVerifiedAt(String? emailVerifiedAt) =>
      _emailVerifiedAt = emailVerifiedAt;

  String? get createdAt => _createdAt;

  set createdAt(String? createdAt) => _createdAt = createdAt;

  String? get updatedAt => _updatedAt;

  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  UserData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _username = json['username'];
    _email = json['email'];
    _photo = json['photo'];
    _status = json['status'];
    _locationNames = json['location_names'];
    _companyName = json['company_name'];
    _role = json['role'];
    _roleName = json['role_name'];
    _emailVerifiedAt = json['email_verified_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _locations = json['locations'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['username'] = _username;
    data['email'] = _email;
    data['photo'] = _photo;
    data['status'] = _status;
    data['location_names'] = _locationNames;
    data['company_name'] = _companyName;
    data['role'] = _role;
    data['role_name'] = _roleName;
    data['email_verified_at'] = _emailVerifiedAt;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}

class User {
  int? _id;
  String? _username;
  String? _email;
  String? _companyName;
  String? _photo;
  String? _status;
  int? _role;
  String? _roleName;

  User({
    int? id,
    String? name,
    String? companyName,
    String? photo,
    String? username,
    String? email,
    String? status,
    int? role,
    String? roleName,
  }) {
    if (id != null) {
      _id = id;
    }
    if (photo != null) {
      _photo = photo;
    }
    if (roleName != null) {
      _roleName = roleName;
    }
    if (username != null) {
      _username = username;
    }
    if (companyName != null) {
      _companyName = companyName;
    }
    if (email != null) {
      _email = email;
    }

    if (status != null) {
      _status = status;
    }
    if (role != null) {
      _role = role;
    }
  }

  int? get id => _id;

  set id(int? id) => _id = id;

  String? get roleName => _roleName;

  set roleName(String? roleName) => _roleName = roleName;

  String? get photo => _photo;

  set photo(String? photo) => _photo = photo;

  String? get username => _username;

  set username(String? username) => _username = username;

  String? get email => _email;

  set email(String? email) => _email = email;

  String? get companyName => _companyName;

  set companyName(String? companyName) => _companyName = companyName;

  String? get status => _status;

  set status(String? status) => _status = status;

  int? get role => _role;

  set role(int? role) => _role = role;

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _roleName = json['role_name'];
    _photo = json['photo'];
    _username = json['username'];
    _companyName = json['company_name'];
    _email = json['email'];
    _status = json['status'];
    _role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['role_name'] = _roleName;
    data['photo'] = _photo;
    data['username'] = _username;
    data['company_name'] = _companyName;
    data['email'] = _email;
    data['status'] = _status;
    data['role'] = _role;
    return data;
  }
}

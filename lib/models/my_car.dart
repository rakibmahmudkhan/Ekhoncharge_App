class MyCar {
  bool? _success;
  List<Cars>? _cars;

  MyCar({bool? success, List<Cars>? cars}) {
    if (success != null) {
      _success = success;
    }
    if (cars != null) {
      _cars = cars;
    }
  }

  bool? get success => _success;
  set success(bool? success) => _success = success;
  List<Cars>? get cars => _cars;
  set cars(List<Cars>? cars) => _cars = cars;

  MyCar.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    if (json['cars'] != null) {
      _cars = <Cars>[];
      json['cars'].forEach((v) {
        _cars!.add(new Cars.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = _success;
    if (_cars != null) {
      data['cars'] = _cars!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cars {
  int? _id;
  String? _name;
  String? _chargePercentage;
  String? _photo;
  String? _createdAt;
  String? _updatedAt;

  Cars(
      {int? id,
        String? name,
        String? chargePercentage,
        String? photo,
        String? createdAt,
        String? updatedAt}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (chargePercentage != null) {
      _chargePercentage = chargePercentage;
    }
    if (photo != null) {
      _photo = photo;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get chargePercentage => _chargePercentage;
  set chargePercentage(String? chargePercentage) =>
      _chargePercentage = chargePercentage;
  String? get photo => _photo;
  set photo(String? photo) => _photo = photo;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Cars.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _chargePercentage = json['charge_percentage'];
    _photo = json['photo'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['charge_percentage'] = _chargePercentage;
    data['photo'] = _photo;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}

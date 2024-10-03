

/*
class UserModel {
  bool? _success;
  String? _accessToken;
  bool? _isVehicleUpdated;
  User? _user;
  List<Vehicles>? _vehicles;

  UserModel(
      {bool? success,
      String? accessToken,
      User? user,
      bool? isVehicleUpdated,
      List<Vehicles>? vehicles}) {
    if (success != null) {
      _success = success;
    }
    if (accessToken != null) {
      _accessToken = accessToken;
    }
    if (user != null) {
      _user = user;
    }
    if (isVehicleUpdated != null) {
      _isVehicleUpdated = isVehicleUpdated;
    }
    if (vehicles != null) {
      _vehicles = vehicles;
    }
  }

  bool? get success => _success;

  set success(bool? success) => _success = success;

  String? get accessToken => _accessToken;

  set accessToken(String? accessToken) => _accessToken = accessToken;

  User? get user => _user;

  set user(User? user) => _user = user;

  bool? get isVehicleUpdated => _isVehicleUpdated;

  set isVehicleUpdated(bool? isVehicleUpdated) =>
      _isVehicleUpdated = isVehicleUpdated;

  List<Vehicles>? get vehicles => _vehicles;

  set vehicles(List<Vehicles>? vehicles) => _vehicles = vehicles;

  UserModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _accessToken = json['access_token'];
    _isVehicleUpdated = json['is_vehicle_update'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['vehicles'] != null) {
      _vehicles = <Vehicles>[];
      json['vehicles'].forEach((v) {
        _vehicles!.add(Vehicles.fromJson(v));
      });
    }
  }

  UserModel.fromJsonVehicle(List<dynamic> json) {
    _vehicles = <Vehicles>[];
    for (var v in json) {
      _vehicles!.add(Vehicles.fromJson(v));
    }
  }

  UserModel.fromJson2(Map<String, dynamic> json) {
    if (json['vehicles'] != null) {
      _vehicles = <Vehicles>[];
      json['vehicles'].forEach((v) {
        _vehicles!.add(Vehicles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = _success;
    data['access_token'] = _accessToken;
    if (_user != null) {
      data['user'] = _user!.toJson();
    }
    return data;
  }
}

class User {
  int? _id;
  int? _activeRoleId;
  String? _name;
  String? _email;
  String? _phone;
  String? _userName;
  String? _emailVerifiedAt;
  String? _createdAt;
  String? _updatedAt;
  String? _imagePath;
  EkhonChargeCustomer? _customer;

  User(
      {int? id,
      int? activeRoleId,
      String? name,
      String? email,
      String? imagePath,
      String? phone,
      String? userName,
      String? emailVerifiedAt,
      String? createdAt,
      String? updatedAt,
      EkhonChargeCustomer? customer}) {
    if (id != null) {
      _id = id;
    }
    if (activeRoleId != null) {
      _activeRoleId = activeRoleId;
    }
    if (name != null) {
      _name = name;
    }
    if (email != null) {
      _email = email;
    }
    if (phone != null) {
      _phone = phone;
    }
    if (userName != null) {
      _userName = userName;
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
    if (imagePath != null) {
      _imagePath = imagePath;
    }
    if (customer != null) {
      _customer = customer;
    }
  }

  int? get id => _id;

  set id(int? id) => _id = id;

  int? get activeRoleId => _activeRoleId;

  set activeRoleId(int? activeRoleId) => _activeRoleId = activeRoleId;

  String? get name => _name;

  set name(String? name) => _name = name;

  String? get email => _email;

  set email(String? email) => _email = email;

  String? get phone => _phone;

  set phone(String? phone) => _phone = phone;

  String? get userName => _userName;

  set userName(String? userName) => _userName = userName;

  String? get emailVerifiedAt => _emailVerifiedAt;

  set emailVerifiedAt(String? emailVerifiedAt) =>
      _emailVerifiedAt = emailVerifiedAt;

  String? get createdAt => _createdAt;

  set createdAt(String? createdAt) => _createdAt = createdAt;

  String? get updatedAt => _updatedAt;

  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  String? get imagePath => _imagePath;

  set imagePath(String? imagePath) => _imagePath = imagePath;
  EkhonChargeCustomer? get customer => _customer;
  set customer(EkhonChargeCustomer? customer) => _customer = customer;

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _activeRoleId = json['active_role_id'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _userName = json['user_name'];
    _emailVerifiedAt = json['email_verified_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _imagePath = json['image_path'];
    _customer = json['customer'] != null
        ? EkhonChargeCustomer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['active_role_id'] = _activeRoleId;
    data['name'] = _name;
    data['email'] = _email;
    data['phone'] = _phone;
    data['user_name'] = _userName;
    data['email_verified_at'] = _emailVerifiedAt;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    if (_customer != null) {
      data['customer'] = _customer!.toJson();
    }
    return data;
  }
}

class Vehicles {
  int? _id;
  int? _customerId;
  String? _customerUuid;
  String? _customerTitle;
  int? _vehicleimageId;
  String? _vehicleimageTitle;
  int? _vehiclemodelId;
  String? _vehiclemodelTitle;
  int? _makeId;
  String? _makeTitle;
  int? _yearId;
  String? _yearTitle;
  int? _vehicletypeId;
  String? _vehicletypeTitle;
  String? _uuid;
  String? _title;
  String? _makeUuid;
  String? _vehiclemodelUuid;
  String? _yearUuid;
  String? _vehicletypeUuid;
  String? _vehicleimageUuid;
  String? _color;
  String? _vin;
  String? _registrationNo;
  String? _engineNumber;
  String? _milage;
  String? _gearBoxCode;
  String? _registrationDate;
  String? _createdAt;
  String? _updatedAt;
  VehicleImage? _vehicleimage;

  Vehicles(
      {int? id,
      int? customerId,
      String? customerUuid,
      String? customerTitle,
      int? vehicleimageId,
      String? vehicleimageTitle,
      int? vehiclemodelId,
      String? vehiclemodelTitle,
      int? makeId,
      String? makeTitle,
      int? yearId,
      String? yearTitle,
      int? vehicletypeId,
      String? vehicletypeTitle,
      String? uuid,
      String? title,
      String? makeUuid,
      String? vehiclemodelUuid,
      String? yearUuid,
      String? vehicletypeUuid,
      String? vehicleimageUuid,
      String? color,
      String? vin,
      String? registrationNo,
      String? engineNumber,
      String? milage,
      String? gearBoxCode,
      String? registrationDate,
      String? createdAt,
      String? updatedAt,
      VehicleImage? vehicleimage}) {
    if (id != null) {
      _id = id;
    }
    if (customerId != null) {
      _customerId = customerId;
    }
    if (customerUuid != null) {
      _customerUuid = customerUuid;
    }
    if (customerTitle != null) {
      _customerTitle = customerTitle;
    }
    if (vehicleimageId != null) {
      _vehicleimageId = vehicleimageId;
    }
    if (vehicleimageTitle != null) {
      _vehicleimageTitle = vehicleimageTitle;
    }
    if (vehiclemodelId != null) {
      _vehiclemodelId = vehiclemodelId;
    }
    if (vehiclemodelTitle != null) {
      _vehiclemodelTitle = vehiclemodelTitle;
    }
    if (makeId != null) {
      _makeId = makeId;
    }
    if (makeTitle != null) {
      _makeTitle = makeTitle;
    }
    if (yearId != null) {
      _yearId = yearId;
    }
    if (yearTitle != null) {
      _yearTitle = yearTitle;
    }
    if (vehicletypeId != null) {
      _vehicletypeId = vehicletypeId;
    }
    if (vehicletypeTitle != null) {
      _vehicletypeTitle = vehicletypeTitle;
    }
    if (uuid != null) {
      _uuid = uuid;
    }
    if (title != null) {
      _title = title;
    }
    if (makeUuid != null) {
      _makeUuid = makeUuid;
    }
    if (vehiclemodelUuid != null) {
      _vehiclemodelUuid = vehiclemodelUuid;
    }
    if (yearUuid != null) {
      _yearUuid = yearUuid;
    }
    if (vehicletypeUuid != null) {
      _vehicletypeUuid = vehicletypeUuid;
    }
    if (vehicleimageUuid != null) {
      _vehicleimageUuid = vehicleimageUuid;
    }
    if (color != null) {
      _color = color;
    }
    if (vin != null) {
      _vin = vin;
    }
    if (registrationNo != null) {
      _registrationNo = registrationNo;
    }
    if (engineNumber != null) {
      _engineNumber = engineNumber;
    }
    if (milage != null) {
      _milage = milage;
    }
    if (gearBoxCode != null) {
      _gearBoxCode = gearBoxCode;
    }
    if (registrationDate != null) {
      _registrationDate = registrationDate;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
    if (vehicleimage != null) {
      _vehicleimage = vehicleimage;
    }
  }

  int? get id => _id;

  set id(int? id) => _id = id;

  int? get customerId => _customerId;

  set customerId(int? customerId) => _customerId = customerId;

  String? get customerUuid => _customerUuid;

  set customerUuid(String? customerUuid) => _customerUuid = customerUuid;

  String? get customerTitle => _customerTitle;

  set customerTitle(String? customerTitle) => _customerTitle = customerTitle;

  int? get vehicleimageId => _vehicleimageId;

  set vehicleimageId(int? vehicleimageId) => _vehicleimageId = vehicleimageId;

  String? get vehicleimageTitle => _vehicleimageTitle;

  set vehicleimageTitle(String? vehicleimageTitle) =>
      _vehicleimageTitle = vehicleimageTitle;

  int? get vehiclemodelId => _vehiclemodelId;

  set vehiclemodelId(int? vehiclemodelId) => _vehiclemodelId = vehiclemodelId;

  String? get vehiclemodelTitle => _vehiclemodelTitle;

  set vehiclemodelTitle(String? vehiclemodelTitle) =>
      _vehiclemodelTitle = vehiclemodelTitle;

  int? get makeId => _makeId;

  set makeId(int? makeId) => _makeId = makeId;

  String? get makeTitle => _makeTitle;

  set makeTitle(String? makeTitle) => _makeTitle = makeTitle;

  int? get yearId => _yearId;

  set yearId(int? yearId) => _yearId = yearId;

  String? get yearTitle => _yearTitle;

  set yearTitle(String? yearTitle) => _yearTitle = yearTitle;

  int? get vehicletypeId => _vehicletypeId;

  set vehicletypeId(int? vehicletypeId) => _vehicletypeId = vehicletypeId;

  String? get vehicletypeTitle => _vehicletypeTitle;

  set vehicletypeTitle(String? vehicletypeTitle) =>
      _vehicletypeTitle = vehicletypeTitle;

  String? get uuid => _uuid;

  set uuid(String? uuid) => _uuid = uuid;

  String? get title => _title;

  set title(String? title) => _title = title;

  String? get makeUuid => _makeUuid;

  set makeUuid(String? makeUuid) => _makeUuid = makeUuid;

  String? get vehiclemodelUuid => _vehiclemodelUuid;

  set vehiclemodelUuid(String? vehiclemodelUuid) =>
      _vehiclemodelUuid = vehiclemodelUuid;

  String? get yearUuid => _yearUuid;

  set yearUuid(String? yearUuid) => _yearUuid = yearUuid;

  String? get vehicletypeUuid => _vehicletypeUuid;

  set vehicletypeUuid(String? vehicletypeUuid) =>
      _vehicletypeUuid = vehicletypeUuid;

  String? get vehicleimageUuid => _vehicleimageUuid;

  set vehicleimageUuid(String? vehicleimageUuid) =>
      _vehicleimageUuid = vehicleimageUuid;

  String? get color => _color;

  set color(String? color) => _color = color;

  String? get vin => _vin;

  set vin(String? vin) => _vin = vin;

  String? get registrationNo => _registrationNo;

  set registrationNo(String? registrationNo) =>
      _registrationNo = registrationNo;

  String? get engineNumber => _engineNumber;

  set engineNumber(String? engineNumber) => _engineNumber = engineNumber;

  String? get milage => _milage;

  set milage(String? milage) => _milage = milage;

  String? get gearBoxCode => _gearBoxCode;

  set gearBoxCode(String? gearBoxCode) => _gearBoxCode = gearBoxCode;

  String? get registrationDate => _registrationDate;

  set registrationDate(String? registrationDate) =>
      _registrationDate = registrationDate;

  String? get createdAt => _createdAt;

  set createdAt(String? createdAt) => _createdAt = createdAt;

  String? get updatedAt => _updatedAt;

  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  VehicleImage? get vehicleimage => _vehicleimage;

  set vehicleimage(VehicleImage? vehicleimage) => _vehicleimage = vehicleimage;

  Vehicles.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _customerId = json['customer_id'];
    _customerUuid = json['customer_uuid'];
    _customerTitle = json['customer_title'];
    _vehicleimageId = json['vehicleimage_id'];
    _vehicleimageTitle = json['vehicleimage_title'];
    _vehiclemodelId = json['vehiclemodel_id'];
    _vehiclemodelTitle = json['vehiclemodel_title'];
    _makeId = json['make_id'];
    _makeTitle = json['make_title'];
    _yearId = json['year_id'];
    _yearTitle = json['year_title'];
    _vehicletypeId = json['vehicletype_id'];
    _vehicletypeTitle = json['vehicletype_title'];
    _uuid = json['uuid'];
    _title = json['title'];
    _makeUuid = json['make_uuid'];
    _vehiclemodelUuid = json['vehiclemodel_uuid'];
    _yearUuid = json['year_uuid'];
    _vehicletypeUuid = json['vehicletype_uuid'];
    _vehicleimageUuid = json['vehicleimage_uuid'];
    _color = json['color'];
    _vin = json['vin'];
    _registrationNo = json['registration_no'];
    _engineNumber = json['engine_number'];
    _milage = json['milage'];
    _gearBoxCode = json['gear_box_code'];
    _registrationDate = json['registration_date'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _vehicleimage = json['vehicleimage'] != null
        ? VehicleImage.fromJson(json['vehicleimage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['customer_id'] = _customerId;
    data['customer_uuid'] = _customerUuid;
    data['customer_title'] = _customerTitle;
    data['vehicleimage_id'] = _vehicleimageId;
    data['vehicleimage_title'] = _vehicleimageTitle;
    data['vehiclemodel_id'] = _vehiclemodelId;
    data['vehiclemodel_title'] = _vehiclemodelTitle;
    data['make_id'] = _makeId;
    data['make_title'] = _makeTitle;
    data['year_id'] = _yearId;
    data['year_title'] = _yearTitle;
    data['vehicletype_id'] = _vehicletypeId;
    data['vehicletype_title'] = _vehicletypeTitle;
    data['uuid'] = _uuid;
    data['title'] = _title;
    data['make_uuid'] = _makeUuid;
    data['vehiclemodel_uuid'] = _vehiclemodelUuid;
    data['year_uuid'] = _yearUuid;
    data['vehicletype_uuid'] = _vehicletypeUuid;
    data['vehicleimage_uuid'] = _vehicleimageUuid;
    data['color'] = _color;
    data['vin'] = _vin;
    data['registration_no'] = _registrationNo;
    data['engine_number'] = _engineNumber;
    data['milage'] = _milage;
    data['gear_box_code'] = _gearBoxCode;
    data['registration_date'] = _registrationDate;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    if (_vehicleimage != null) {
      data['vehicleimage'] = _vehicleimage!.toJson();
    }
    return data;
  }
}

class VehicleImage {
  int? _id;
  int? _yearId;
  String? _yearTitle;
  int? _makeId;
  String? _makeTitle;
  int? _vehiclemodelId;
  String? _vehiclemodelTitle;
  String? _uuid;
  String? _title;
  String? _image;
  String? _imagePath;
  String? _makeUuid;
  String? _vehiclemodelUuid;
  String? _yearUuid;
  int? _createdBy;
  int? _updatedBy;
  String? _createdAt;
  String? _updatedAt;

  VehicleImage(
      {int? id,
      int? yearId,
      String? yearTitle,
      int? makeId,
      String? makeTitle,
      int? vehiclemodelId,
      String? vehiclemodelTitle,
      String? uuid,
      String? title,
      String? image,
      String? imagePath,
      String? makeUuid,
      String? vehiclemodelUuid,
      String? yearUuid,
      int? createdBy,
      int? updatedBy,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      _id = id;
    }
    if (yearId != null) {
      _yearId = yearId;
    }
    if (yearTitle != null) {
      _yearTitle = yearTitle;
    }
    if (makeId != null) {
      _makeId = makeId;
    }
    if (makeTitle != null) {
      _makeTitle = makeTitle;
    }
    if (vehiclemodelId != null) {
      _vehiclemodelId = vehiclemodelId;
    }
    if (vehiclemodelTitle != null) {
      _vehiclemodelTitle = vehiclemodelTitle;
    }
    if (uuid != null) {
      _uuid = uuid;
    }
    if (title != null) {
      _title = title;
    }
    if (image != null) {
      _image = image;
    }
    if (imagePath != null) {
      _imagePath = imagePath;
    }
    if (makeUuid != null) {
      _makeUuid = makeUuid;
    }
    if (vehiclemodelUuid != null) {
      _vehiclemodelUuid = vehiclemodelUuid;
    }
    if (yearUuid != null) {
      _yearUuid = yearUuid;
    }
    if (createdBy != null) {
      _createdBy = createdBy;
    }
    if (updatedBy != null) {
      _updatedBy = updatedBy;
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

  int? get yearId => _yearId;

  set yearId(int? yearId) => _yearId = yearId;

  String? get yearTitle => _yearTitle;

  set yearTitle(String? yearTitle) => _yearTitle = yearTitle;

  int? get makeId => _makeId;

  set makeId(int? makeId) => _makeId = makeId;

  String? get makeTitle => _makeTitle;

  set makeTitle(String? makeTitle) => _makeTitle = makeTitle;

  int? get vehiclemodelId => _vehiclemodelId;

  set vehiclemodelId(int? vehiclemodelId) => _vehiclemodelId = vehiclemodelId;

  String? get vehiclemodelTitle => _vehiclemodelTitle;

  set vehiclemodelTitle(String? vehiclemodelTitle) =>
      _vehiclemodelTitle = vehiclemodelTitle;

  String? get uuid => _uuid;

  set uuid(String? uuid) => _uuid = uuid;

  String? get title => _title;

  set title(String? title) => _title = title;

  String? get image => _image;

  set image(String? image) => _image = image;

  String? get imagePath => _imagePath;

  set imagePath(String? imagePath) => _imagePath = imagePath;

  String? get makeUuid => _makeUuid;

  set makeUuid(String? makeUuid) => _makeUuid = makeUuid;

  String? get vehiclemodelUuid => _vehiclemodelUuid;

  set vehiclemodelUuid(String? vehiclemodelUuid) =>
      _vehiclemodelUuid = vehiclemodelUuid;

  String? get yearUuid => _yearUuid;

  set yearUuid(String? yearUuid) => _yearUuid = yearUuid;

  int? get createdBy => _createdBy;

  set createdBy(int? createdBy) => _createdBy = createdBy;

  int? get updatedBy => _updatedBy;

  set updatedBy(int? updatedBy) => _updatedBy = updatedBy;

  String? get createdAt => _createdAt;

  set createdAt(String? createdAt) => _createdAt = createdAt;

  String? get updatedAt => _updatedAt;

  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  VehicleImage.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _yearId = json['year_id'];
    _yearTitle = json['year_title'];
    _makeId = json['make_id'];
    _makeTitle = json['make_title'];
    _vehiclemodelId = json['vehiclemodel_id'];
    _vehiclemodelTitle = json['vehiclemodel_title'];
    _uuid = json['uuid'];
    _title = json['title'];
    _image = json['image'];
    _imagePath = json['image_path'];
    _makeUuid = json['make_uuid'];
    _vehiclemodelUuid = json['vehiclemodel_uuid'];
    _yearUuid = json['year_uuid'];
    _createdBy = json['created_by'];
    _updatedBy = json['updated_by'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['year_id'] = _yearId;
    data['year_title'] = _yearTitle;
    data['make_id'] = _makeId;
    data['make_title'] = _makeTitle;
    data['vehiclemodel_id'] = _vehiclemodelId;
    data['vehiclemodel_title'] = _vehiclemodelTitle;
    data['uuid'] = _uuid;
    data['title'] = _title;
    data['image'] = _image;
    data['image_path'] = _imagePath;
    data['make_uuid'] = _makeUuid;
    data['vehiclemodel_uuid'] = _vehiclemodelUuid;
    data['year_uuid'] = _yearUuid;
    data['created_by'] = _createdBy;
    data['updated_by'] = _updatedBy;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}

class EkhonChargeCustomer {
  int? _id;
  int? _userId;
  int? _individualId;
  String? _uuid;
  String? _individualUuid;
  String? _individualTitle;
  int? _companyId;
  String? _companyUuid;
  String? _companyTitle;
  String? _title;
  String? _customerCode;
  String? _customerType;
  String? _createdAt;
  String? _updatedAt;
  Individual? _individual;

  EkhonChargeCustomer(
      {int? id,
      int? userId,
      int? individualId,
      String? uuid,
      String? individualUuid,
      String? individualTitle,
      int? companyId,
      String? companyUuid,
      String? companyTitle,
      String? title,
      String? customerCode,
      String? customerType,
      String? createdAt,
      String? updatedAt,
      Individual? individual}) {
    if (id != null) {
      _id = id;
    }
    if (userId != null) {
      _userId = userId;
    }
    if (individualId != null) {
      _individualId = individualId;
    }
    if (uuid != null) {
      _uuid = uuid;
    }
    if (individualUuid != null) {
      _individualUuid = individualUuid;
    }
    if (individualTitle != null) {
      _individualTitle = individualTitle;
    }
    if (companyId != null) {
      _companyId = companyId;
    }
    if (companyUuid != null) {
      _companyUuid = companyUuid;
    }
    if (companyTitle != null) {
      _companyTitle = companyTitle;
    }
    if (title != null) {
      _title = title;
    }
    if (customerCode != null) {
      _customerCode = customerCode;
    }
    if (customerType != null) {
      _customerType = customerType;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
    if (individual != null) {
      _individual = individual;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  int? get individualId => _individualId;
  set individualId(int? individualId) => _individualId = individualId;
  String? get uuid => _uuid;
  set uuid(String? uuid) => _uuid = uuid;
  String? get individualUuid => _individualUuid;
  set individualUuid(String? individualUuid) =>
      _individualUuid = individualUuid;
  String? get individualTitle => _individualTitle;
  set individualTitle(String? individualTitle) =>
      _individualTitle = individualTitle;
  int? get companyId => _companyId;
  set companyId(int? companyId) => _companyId = companyId;
  String? get companyUuid => _companyUuid;
  set companyUuid(String? companyUuid) => _companyUuid = companyUuid;
  String? get companyTitle => _companyTitle;
  set companyTitle(String? companyTitle) => _companyTitle = companyTitle;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get customerCode => _customerCode;
  set customerCode(String? customerCode) => _customerCode = customerCode;
  String? get customerType => _customerType;
  set customerType(String? customerType) => _customerType = customerType;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  Individual? get individual => _individual;
  set individual(Individual? individual) => _individual = individual;

  EkhonChargeCustomer.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _userId = json['user_id'];
    _individualId = json['individual_id'];
    _uuid = json['uuid'];
    _individualUuid = json['individual_uuid'];
    _individualTitle = json['individual_title'];
    _companyId = json['company_id'];
    _companyUuid = json['company_uuid'];
    _companyTitle = json['company_title'];
    _title = json['title'];
    _customerCode = json['customer_code'];
    _customerType = json['customer_type'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _individual = json['individual'] != null
        ? Individual.fromJson(json['individual'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['user_id'] = _userId;
    data['individual_id'] = _individualId;
    data['uuid'] = _uuid;
    data['individual_uuid'] = _individualUuid;
    data['individual_title'] = _individualTitle;
    data['company_id'] = _companyId;
    data['company_uuid'] = _companyUuid;
    data['company_title'] = _companyTitle;
    data['title'] = _title;
    data['customer_code'] = _customerCode;
    data['customer_type'] = _customerType;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    if (_individual != null) {
      data['individual'] = _individual!.toJson();
    }
    return data;
  }
}

class Individual {
  int? _id;
  String? _uuid;
  String? _title;
  String? _firstName;
  String? _lastName;
  String? _fullName;
  String? _surname;
  String? _fatherName;
  String? _motherName;
  String? _email;
  String? _nid;
  String? _passport;
  String? _drivingLicence;
  String? _gender;
  String? _bloodGroup;
  int? _religionId;
  String? _religionUuid;
  String? _religionTitle;
  String? _dob;
  String? _avatar;
  String? _tin;
  String? _remark;
  Graphic? _graphic;

  Individual(
      {int? id,
      String? uuid,
      String? title,
      String? firstName,
      String? lastName,
      String? fullName,
      String? surname,
      String? fatherName,
      String? motherName,
      String? email,
      String? nid,
      String? passport,
      String? drivingLicence,
      String? gender,
      String? bloodGroup,
      int? religionId,
      String? religionUuid,
      String? religionTitle,
      String? dob,
      String? avatar,
      String? tin,
      String? remark,
      Graphic? graphic}) {
    if (id != null) {
      _id = id;
    }
    if (uuid != null) {
      _uuid = uuid;
    }
    if (title != null) {
      _title = title;
    }
    if (firstName != null) {
      _firstName = firstName;
    }
    if (lastName != null) {
      _lastName = lastName;
    }
    if (fullName != null) {
      _fullName = fullName;
    }
    if (surname != null) {
      _surname = surname;
    }
    if (fatherName != null) {
      _fatherName = fatherName;
    }
    if (motherName != null) {
      _motherName = motherName;
    }
    if (email != null) {
      _email = email;
    }
    if (nid != null) {
      _nid = nid;
    }
    if (passport != null) {
      _passport = passport;
    }
    if (drivingLicence != null) {
      _drivingLicence = drivingLicence;
    }
    if (gender != null) {
      _gender = gender;
    }
    if (bloodGroup != null) {
      _bloodGroup = bloodGroup;
    }
    if (religionId != null) {
      _religionId = religionId;
    }
    if (religionUuid != null) {
      _religionUuid = religionUuid;
    }
    if (religionTitle != null) {
      _religionTitle = religionTitle;
    }
    if (dob != null) {
      _dob = dob;
    }
    if (avatar != null) {
      _avatar = avatar;
    }
    if (tin != null) {
      _tin = tin;
    }
    if (remark != null) {
      _remark = remark;
    }
    if (graphic != null) {
      _graphic = graphic;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get uuid => _uuid;
  set uuid(String? uuid) => _uuid = uuid;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get firstName => _firstName;
  set firstName(String? firstName) => _firstName = firstName;
  String? get lastName => _lastName;
  set lastName(String? lastName) => _lastName = lastName;
  String? get fullName => _fullName;
  set fullName(String? fullName) => _fullName = fullName;
  String? get surname => _surname;
  set surname(String? surname) => _surname = surname;
  String? get fatherName => _fatherName;
  set fatherName(String? fatherName) => _fatherName = fatherName;
  String? get motherName => _motherName;
  set motherName(String? motherName) => _motherName = motherName;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get nid => _nid;
  set nid(String? nid) => _nid = nid;
  String? get passport => _passport;
  set passport(String? passport) => _passport = passport;
  String? get drivingLicence => _drivingLicence;
  set drivingLicence(String? drivingLicence) =>
      _drivingLicence = drivingLicence;
  String? get gender => _gender;
  set gender(String? gender) => _gender = gender;
  String? get bloodGroup => _bloodGroup;
  set bloodGroup(String? bloodGroup) => _bloodGroup = bloodGroup;
  int? get religionId => _religionId;
  set religionId(int? religionId) => _religionId = religionId;
  String? get religionUuid => _religionUuid;
  set religionUuid(String? religionUuid) => _religionUuid = religionUuid;
  String? get religionTitle => _religionTitle;
  set religionTitle(String? religionTitle) => _religionTitle = religionTitle;
  String? get dob => _dob;
  set dob(String? dob) => _dob = dob;
  String? get avatar => _avatar;
  set avatar(String? avatar) => _avatar = avatar;
  String? get tin => _tin;
  set tin(String? tin) => _tin = tin;
  String? get remark => _remark;
  set remark(String? remark) => _remark = remark;
  Graphic? get graphic => _graphic;
  set graphic(Graphic? graphic) => _graphic = graphic;

  Individual.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _uuid = json['uuid'];
    _title = json['title'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _fullName = json['full_name'];
    _surname = json['surname'];
    _fatherName = json['father_name'];
    _motherName = json['mother_name'];
    _email = json['email'];
    _nid = json['nid'];
    _passport = json['passport'];
    _drivingLicence = json['driving_licence'];
    _gender = json['gender'];
    _bloodGroup = json['blood_group'];
    _religionId = json['religion_id'];
    _religionUuid = json['religion_uuid'];
    _religionTitle = json['religion_title'];
    _dob = json['dob'];
    _avatar = json['avatar'];
    _tin = json['tin'];
    _remark = json['remark'];
    _graphic =
        json['graphic'] != null ? Graphic.fromJson(json['graphic']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['uuid'] = _uuid;
    data['title'] = _title;
    data['first_name'] = _firstName;
    data['last_name'] = _lastName;
    data['full_name'] = _fullName;
    data['surname'] = _surname;
    data['father_name'] = _fatherName;
    data['mother_name'] = _motherName;
    data['email'] = _email;
    data['nid'] = _nid;
    data['passport'] = _passport;
    data['driving_licence'] = _drivingLicence;
    data['gender'] = _gender;
    data['blood_group'] = _bloodGroup;
    data['religion_id'] = _religionId;
    data['religion_uuid'] = _religionUuid;
    data['religion_title'] = _religionTitle;
    data['dob'] = _dob;
    data['avatar'] = _avatar;
    data['tin'] = _tin;
    data['remark'] = _remark;
    if (_graphic != null) {
      data['graphic'] = _graphic!.toJson();
    }
    return data;
  }
}

class Graphic {
  String? _originalName;
  String? _displayName;
  String? _uniqueName;
  String? _path;
  String? _extension;
  String? _mime;
  String? _dateTime;
  String? _thumbnailName;
  String? _thumbnailPath;

  Graphic(
      {String? originalName,
      String? displayName,
      String? uniqueName,
      String? path,
      String? extension,
      String? mime,
      String? dateTime,
      String? thumbnailName,
      String? thumbnailPath}) {
    if (originalName != null) {
      _originalName = originalName;
    }
    if (displayName != null) {
      _displayName = displayName;
    }
    if (uniqueName != null) {
      _uniqueName = uniqueName;
    }
    if (path != null) {
      _path = path;
    }
    if (extension != null) {
      _extension = extension;
    }
    if (mime != null) {
      _mime = mime;
    }
    if (dateTime != null) {
      _dateTime = dateTime;
    }
    if (thumbnailName != null) {
      _thumbnailName = thumbnailName;
    }
    if (thumbnailPath != null) {
      _thumbnailPath = thumbnailPath;
    }
  }

  String? get originalName => _originalName;
  set originalName(String? originalName) => _originalName = originalName;
  String? get displayName => _displayName;
  set displayName(String? displayName) => _displayName = displayName;
  String? get uniqueName => _uniqueName;
  set uniqueName(String? uniqueName) => _uniqueName = uniqueName;
  String? get path => _path;
  set path(String? path) => _path = path;
  String? get extension => _extension;
  set extension(String? extension) => _extension = extension;
  String? get mime => _mime;
  set mime(String? mime) => _mime = mime;
  String? get dateTime => _dateTime;
  set dateTime(String? dateTime) => _dateTime = dateTime;
  String? get thumbnailName => _thumbnailName;
  set thumbnailName(String? thumbnailName) => _thumbnailName = thumbnailName;
  String? get thumbnailPath => _thumbnailPath;
  set thumbnailPath(String? thumbnailPath) => _thumbnailPath = thumbnailPath;

  Graphic.fromJson(Map<String, dynamic> json) {
    _originalName = json['original_name'];
    _displayName = json['display_name'];
    _uniqueName = json['unique_name'];
    _path = json['path'];
    _extension = json['extension'];
    _mime = json['mime'];
    _dateTime = json['date_time'];
    _thumbnailName = json['thumbnail_name'];
    _thumbnailPath = json['thumbnail_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['original_name'] = _originalName;
    data['display_name'] = _displayName;
    data['unique_name'] = _uniqueName;
    data['path'] = _path;
    data['extension'] = _extension;
    data['mime'] = _mime;
    data['date_time'] = _dateTime;
    data['thumbnail_name'] = _thumbnailName;
    data['thumbnail_path'] = _thumbnailPath;
    return data;
  }
}
*/

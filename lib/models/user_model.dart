class UserModel {
  bool? _success;
  String? _accessToken;
  User? _user;

  bool? _isVehicleUpdate;
  bool? _isWalletUpdate;
  List<Vehicles>? _vehicles;

  UserModel(
      {bool? success,
      String? accessToken,
      User? user,
      bool? isVehicleUpdate,
      bool? isWalletUpdate,
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

    if (isVehicleUpdate != null) {
      _isVehicleUpdate = isVehicleUpdate;
    } if (isWalletUpdate != null) {
      _isWalletUpdate = isWalletUpdate;
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

  bool? get isVehicleUpdate => _isVehicleUpdate;
  set isVehicleUpdate(bool? isVehicleUpdate) =>
      _isVehicleUpdate = isVehicleUpdate;

  bool? get isWalletUpdate => _isWalletUpdate;

  set isWalletUpdate(bool? isWalletUpdate) {
    _isWalletUpdate = isWalletUpdate;
  }

  List<Vehicles>? get vehicles => _vehicles;
  set vehicles(List<Vehicles>? vehicles) => _vehicles = vehicles;

  UserModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _accessToken = json['access_token'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;

    _isVehicleUpdate = json['is_vehicle_update'];
    _isWalletUpdate = json['is_wallet_update'];
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = _success;
    data['access_token'] = _accessToken;
    if (_user != null) {
      data['user'] = _user!.toJson();
    }

    data['is_vehicle_update'] = _isVehicleUpdate;
    data['is_wallet_update'] = _isWalletUpdate;
    if (_vehicles != null) {
      data['vehicles'] = _vehicles!.map((v) => v.toJson()).toList();
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
  Customer? _customer;

  User(
      {int? id,
      int? activeRoleId,
      String? name,
      String? email,
      String? phone,
      String? userName,
      String? emailVerifiedAt,
      String? createdAt,
      String? updatedAt,
      String? imagePath,
      Customer? customer}) {
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
  Customer? get customer => _customer;
  set customer(Customer? customer) => _customer = customer;

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
    _customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = _id;
    data['active_role_id'] = _activeRoleId;
    data['name'] = _name;
    data['email'] = _email;
    data['phone'] = _phone;
    data['user_name'] = _userName;
    data['email_verified_at'] = _emailVerifiedAt;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    data['image_path'] = _imagePath;
    if (_customer != null) {
      data['customer'] = _customer!.toJson();
    }
    return data;
  }
}

class Customer {
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
  String? _salesPerson;
  String? _paymentTerms;
  String? _pricelist;
  String? _customerCode;
  String? _customerType;
  String? _dataIndividual;
  String? _dataProfile;
  String? _dataAddress;
  String? _dataPhone;
  String? _dataAccount;
  String? _dataGraphics;
  String? _dataCompanies;
  String? _dataContact;

  Individual? _individual;

  Customer(
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
      String? salesPerson,
      String? paymentTerms,
      String? pricelist,
      String? customerCode,
      String? customerType,
      String? dataIndividual,
      String? dataProfile,
      String? dataAddress,
      String? dataPhone,
      String? dataAccount,
      String? dataGraphics,
      String? dataCompanies,
      String? dataContact,
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
    if (salesPerson != null) {
      _salesPerson = salesPerson;
    }
    if (paymentTerms != null) {
      _paymentTerms = paymentTerms;
    }
    if (pricelist != null) {
      _pricelist = pricelist;
    }
    if (customerCode != null) {
      _customerCode = customerCode;
    }
    if (customerType != null) {
      _customerType = customerType;
    }
    if (dataIndividual != null) {
      _dataIndividual = dataIndividual;
    }
    if (dataProfile != null) {
      _dataProfile = dataProfile;
    }
    if (dataAddress != null) {
      _dataAddress = dataAddress;
    }
    if (dataPhone != null) {
      _dataPhone = dataPhone;
    }
    if (dataAccount != null) {
      _dataAccount = dataAccount;
    }
    if (dataGraphics != null) {
      _dataGraphics = dataGraphics;
    }
    if (dataCompanies != null) {
      _dataCompanies = dataCompanies;
    }
    if (dataContact != null) {
      _dataContact = dataContact;
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
  String? get salesPerson => _salesPerson;
  set salesPerson(String? salesPerson) => _salesPerson = salesPerson;
  String? get paymentTerms => _paymentTerms;
  set paymentTerms(String? paymentTerms) => _paymentTerms = paymentTerms;
  String? get pricelist => _pricelist;
  set pricelist(String? pricelist) => _pricelist = pricelist;
  String? get customerCode => _customerCode;
  set customerCode(String? customerCode) => _customerCode = customerCode;
  String? get customerType => _customerType;
  set customerType(String? customerType) => _customerType = customerType;
  String? get dataIndividual => _dataIndividual;
  set dataIndividual(String? dataIndividual) =>
      _dataIndividual = dataIndividual;
  String? get dataProfile => _dataProfile;
  set dataProfile(String? dataProfile) => _dataProfile = dataProfile;
  String? get dataAddress => _dataAddress;
  set dataAddress(String? dataAddress) => _dataAddress = dataAddress;
  String? get dataPhone => _dataPhone;
  set dataPhone(String? dataPhone) => _dataPhone = dataPhone;
  String? get dataAccount => _dataAccount;
  set dataAccount(String? dataAccount) => _dataAccount = dataAccount;
  String? get dataGraphics => _dataGraphics;
  set dataGraphics(String? dataGraphics) => _dataGraphics = dataGraphics;
  String? get dataCompanies => _dataCompanies;
  set dataCompanies(String? dataCompanies) => _dataCompanies = dataCompanies;
  String? get dataContact => _dataContact;
  set dataContact(String? dataContact) => _dataContact = dataContact;

  Individual? get individual => _individual;
  set individual(Individual? individual) => _individual = individual;

  Customer.fromJson(Map<String, dynamic> json) {
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
    _salesPerson = json['sales_person'];
    _paymentTerms = json['payment_terms'];
    _pricelist = json['pricelist'];
    _customerCode = json['customer_code'];
    _customerType = json['customer_type'];
    _dataIndividual = json['data_individual'];
    _dataProfile = json['data_profile'];
    _dataAddress = json['data_address'];
    _dataPhone = json['data_phone'];
    _dataAccount = json['data_account'];
    _dataGraphics = json['data_graphics'];
    _dataCompanies = json['data_companies'];
    _dataContact = json['data_contact'];

    _individual = json['individual'] != null
        ? Individual.fromJson(json['individual'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    data['sales_person'] = _salesPerson;
    data['payment_terms'] = _paymentTerms;
    data['pricelist'] = _pricelist;
    data['customer_code'] = _customerCode;
    data['customer_type'] = _customerType;
    data['data_individual'] = _dataIndividual;
    data['data_profile'] = _dataProfile;
    data['data_address'] = _dataAddress;
    data['data_phone'] = _dataPhone;
    data['data_account'] = _dataAccount;
    data['data_graphics'] = _dataGraphics;
    data['data_companies'] = _dataCompanies;
    data['data_contact'] = _dataContact;

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
  String? _isRepresentative;

  String? _serNo;
  String? _kommNo;
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
      String? isRepresentative,
      String? createdBy,
      String? updatedBy,
      String? deletedBy,
      String? deletedAt,
      String? createdAt,
      String? updatedAt,
      String? serNo,
      String? kommNo,
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
    if (isRepresentative != null) {
      _isRepresentative = isRepresentative;
    }

    if (serNo != null) {
      _serNo = serNo;
    }
    if (kommNo != null) {
      _kommNo = kommNo;
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
  String? get isRepresentative => _isRepresentative;
  set isRepresentative(String? isRepresentative) =>
      _isRepresentative = isRepresentative;

  String? get serNo => _serNo;
  set serNo(String? serNo) => _serNo = serNo;
  String? get kommNo => _kommNo;
  set kommNo(String? kommNo) => _kommNo = kommNo;
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
    _isRepresentative = json['is_representative'];

    _serNo = json['ser_no'];
    _kommNo = json['komm_no'];
    _graphic =
        json['graphic'] != null ? new Graphic.fromJson(json['graphic']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['is_representative'] = _isRepresentative;

    data['ser_no'] = _serNo;
    data['komm_no'] = _kommNo;
    if (_graphic != null) {
      data['graphic'] = _graphic!.toJson();
    }
    return data;
  }
}

class Graphic {
  int? _id;
  String? _uuid;
  int? _scopeableId;
  String? _scopeableUuid;
  String? _scopeableType;
  String? _title;
  String? _originalName;
  String? _displayName;
  String? _uniqueName;
  String? _alt;
  String? _path;
  String? _size;
  String? _uom;
  String? _type;
  String? _extension;
  String? _mime;
  int? _width;
  int? _height;
  String? _dimension;
  String? _dateTime;
  String? _thumbnailName;
  String? _thumbnailPath;
  String? _thumbnailDimension;
  String? _metadata;

  Graphic({
    int? id,
    String? uuid,
    int? scopeableId,
    String? scopeableUuid,
    String? scopeableType,
    String? title,
    String? originalName,
    String? displayName,
    String? uniqueName,
    String? alt,
    String? path,
    String? size,
    String? uom,
    String? type,
    String? extension,
    String? mime,
    int? width,
    int? height,
    String? dimension,
    String? dateTime,
    String? thumbnailName,
    String? thumbnailPath,
    String? thumbnailDimension,
    String? metadata,
  }) {
    if (id != null) {
      _id = id;
    }
    if (uuid != null) {
      _uuid = uuid;
    }
    if (scopeableId != null) {
      _scopeableId = scopeableId;
    }
    if (scopeableUuid != null) {
      _scopeableUuid = scopeableUuid;
    }
    if (scopeableType != null) {
      _scopeableType = scopeableType;
    }
    if (title != null) {
      _title = title;
    }
    if (originalName != null) {
      _originalName = originalName;
    }
    if (displayName != null) {
      _displayName = displayName;
    }
    if (uniqueName != null) {
      _uniqueName = uniqueName;
    }
    if (alt != null) {
      _alt = alt;
    }
    if (path != null) {
      _path = path;
    }
    if (size != null) {
      _size = size;
    }
    if (uom != null) {
      _uom = uom;
    }
    if (type != null) {
      _type = type;
    }
    if (extension != null) {
      _extension = extension;
    }
    if (mime != null) {
      _mime = mime;
    }
    if (width != null) {
      _width = width;
    }
    if (height != null) {
      _height = height;
    }
    if (dimension != null) {
      _dimension = dimension;
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
    if (thumbnailDimension != null) {
      _thumbnailDimension = thumbnailDimension;
    }
    if (metadata != null) {
      _metadata = metadata;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get uuid => _uuid;
  set uuid(String? uuid) => _uuid = uuid;
  int? get scopeableId => _scopeableId;
  set scopeableId(int? scopeableId) => _scopeableId = scopeableId;
  String? get scopeableUuid => _scopeableUuid;
  set scopeableUuid(String? scopeableUuid) => _scopeableUuid = scopeableUuid;
  String? get scopeableType => _scopeableType;
  set scopeableType(String? scopeableType) => _scopeableType = scopeableType;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get originalName => _originalName;
  set originalName(String? originalName) => _originalName = originalName;
  String? get displayName => _displayName;
  set displayName(String? displayName) => _displayName = displayName;
  String? get uniqueName => _uniqueName;
  set uniqueName(String? uniqueName) => _uniqueName = uniqueName;
  String? get alt => _alt;
  set alt(String? alt) => _alt = alt;
  String? get path => _path;
  set path(String? path) => _path = path;
  String? get size => _size;
  set size(String? size) => _size = size;
  String? get uom => _uom;
  set uom(String? uom) => _uom = uom;
  String? get type => _type;
  set type(String? type) => _type = type;
  String? get extension => _extension;
  set extension(String? extension) => _extension = extension;
  String? get mime => _mime;
  set mime(String? mime) => _mime = mime;
  int? get width => _width;
  set width(int? width) => _width = width;
  int? get height => _height;
  set height(int? height) => _height = height;
  String? get dimension => _dimension;
  set dimension(String? dimension) => _dimension = dimension;
  String? get dateTime => _dateTime;
  set dateTime(String? dateTime) => _dateTime = dateTime;
  String? get thumbnailName => _thumbnailName;
  set thumbnailName(String? thumbnailName) => _thumbnailName = thumbnailName;
  String? get thumbnailPath => _thumbnailPath;
  set thumbnailPath(String? thumbnailPath) => _thumbnailPath = thumbnailPath;
  String? get thumbnailDimension => _thumbnailDimension;
  set thumbnailDimension(String? thumbnailDimension) =>
      _thumbnailDimension = thumbnailDimension;
  String? get metadata => _metadata;
  set metadata(String? metadata) => _metadata = metadata;

  Graphic.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _uuid = json['uuid'];
    _scopeableId = json['scopeable_id'];
    _scopeableUuid = json['scopeable_uuid'];
    _scopeableType = json['scopeable_type'];
    _title = json['title'];
    _originalName = json['original_name'];
    _displayName = json['display_name'];
    _uniqueName = json['unique_name'];
    _alt = json['alt'];
    _path = json['path'];
    _size = json['size'];
    _uom = json['uom'];
    _type = json['type'];
    _extension = json['extension'];
    _mime = json['mime'];
    _width = json['width'];
    _height = json['height'];
    _dimension = json['dimension'];
    _dateTime = json['date_time'];
    _thumbnailName = json['thumbnail_name'];
    _thumbnailPath = json['thumbnail_path'];
    _thumbnailDimension = json['thumbnail_dimension'];
    _metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = _id;
    data['uuid'] = _uuid;
    data['scopeable_id'] = _scopeableId;
    data['scopeable_uuid'] = _scopeableUuid;
    data['scopeable_type'] = _scopeableType;
    data['title'] = _title;
    data['original_name'] = _originalName;
    data['display_name'] = _displayName;
    data['unique_name'] = _uniqueName;
    data['alt'] = _alt;
    data['path'] = _path;
    data['size'] = _size;
    data['uom'] = _uom;
    data['type'] = _type;
    data['extension'] = _extension;
    data['mime'] = _mime;
    data['width'] = _width;
    data['height'] = _height;
    data['dimension'] = _dimension;
    data['date_time'] = _dateTime;
    data['thumbnail_name'] = _thumbnailName;
    data['thumbnail_path'] = _thumbnailPath;
    data['thumbnail_dimension'] = _thumbnailDimension;
    data['metadata'] = _metadata;

    return data;
  }
}

class Vehicles {
  int? _id;
  String? _uuid;
  int? _customerId;
  String? _customerUuid;
  String? _customerTitle;
  int? _vehicleId;
  String? _vehicleUuid;
  String? _vehicleTitle;
  String? _vin;
  String? _registrationNo;
  int? _isActive;
  int? _createdBy;
  String? _updatedBy;
  String? _deletedBy;
  String? _deletedAt;
  String? _createdAt;
  String? _updatedAt;
  Vehicle? _vehicle;

  Vehicles(
      {int? id,
      String? uuid,
      int? customerId,
      String? customerUuid,
      String? customerTitle,
      int? vehicleId,
      String? vehicleUuid,
      String? vehicleTitle,
      String? vin,
      String? registrationNo,
      int? isActive,
      Vehicle? vehicle}) {
    if (id != null) {
      _id = id;
    }
    if (uuid != null) {
      _uuid = uuid;
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
    if (vehicleId != null) {
      _vehicleId = vehicleId;
    }
    if (vehicleUuid != null) {
      _vehicleUuid = vehicleUuid;
    }
    if (vehicleTitle != null) {
      _vehicleTitle = vehicleTitle;
    }
    if (vin != null) {
      _vin = vin;
    }
    if (registrationNo != null) {
      _registrationNo = registrationNo;
    }
    if (isActive != null) {
      _isActive = isActive;
    }

    if (vehicle != null) {
      _vehicle = vehicle;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get uuid => _uuid;
  set uuid(String? uuid) => _uuid = uuid;
  int? get customerId => _customerId;
  set customerId(int? customerId) => _customerId = customerId;
  String? get customerUuid => _customerUuid;
  set customerUuid(String? customerUuid) => _customerUuid = customerUuid;
  String? get customerTitle => _customerTitle;
  set customerTitle(String? customerTitle) => _customerTitle = customerTitle;
  int? get vehicleId => _vehicleId;
  set vehicleId(int? vehicleId) => _vehicleId = vehicleId;
  String? get vehicleUuid => _vehicleUuid;
  set vehicleUuid(String? vehicleUuid) => _vehicleUuid = vehicleUuid;
  String? get vehicleTitle => _vehicleTitle;
  set vehicleTitle(String? vehicleTitle) => _vehicleTitle = vehicleTitle;
  String? get vin => _vin;
  set vin(String? vin) => _vin = vin;
  String? get registrationNo => _registrationNo;
  set registrationNo(String? registrationNo) =>
      _registrationNo = registrationNo;
  int? get isActive => _isActive;
  set isActive(int? isActive) => _isActive = isActive;
  int? get createdBy => _createdBy;

  Vehicle? get vehicle => _vehicle;
  set vehicle(Vehicle? vehicle) => _vehicle = vehicle;

  Vehicles.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _uuid = json['uuid'];
    _customerId = json['customer_id'];
    _customerUuid = json['customer_uuid'];
    _customerTitle = json['customer_title'];
    _vehicleId = json['vehicle_id'];
    _vehicleUuid = json['vehicle_uuid'];
    _vehicleTitle = json['vehicle_title'];
    _vin = json['vin'];
    _registrationNo = json['registration_no'];
    _isActive = json['is_active'];

    _vehicle =
        json['vehicle'] != null ? new Vehicle.fromJson(json['vehicle']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = _id;
    data['uuid'] = _uuid;
    data['customer_id'] = _customerId;
    data['customer_uuid'] = _customerUuid;
    data['customer_title'] = _customerTitle;
    data['vehicle_id'] = _vehicleId;
    data['vehicle_uuid'] = _vehicleUuid;
    data['vehicle_title'] = _vehicleTitle;
    data['vin'] = _vin;
    data['registration_no'] = _registrationNo;
    data['is_active'] = _isActive;

    if (_vehicle != null) {
      data['vehicle'] = _vehicle!.toJson();
    }
    return data;
  }
}

class Vehicle {
  int? _id;
  String? _uuid;
  String? _title;
  int? _vmakeId;
  String? _vmakeUuid;
  String? _vmakeTitle;
  int? _vmodelId;
  String? _vmodelUuid;
  String? _vmodelTitle;
  String? _year;
  String? _color;
  String? _engine;
  String? _acceleration;
  String? _topSpeed;
  String? _electricRange;
  String? _totalPower;
  String? _totalTorque;
  String? _drive;
  String? _nominalCapacity;
  String? _useableCapacity;
  String? _batteryType;
  String? _chargePort;
  String? _chargePower;
  String? _fastchargePort;
  String? _fastchargePowerMax;
  String? _fastchargePower;
  String? _fastchargeTime;
  String? _image;

  Vehicle({
    int? id,
    String? uuid,
    String? title,
    int? vmakeId,
    String? vmakeUuid,
    String? vmakeTitle,
    int? vmodelId,
    String? vmodelUuid,
    String? vmodelTitle,
    String? year,
    String? color,
    String? engine,
    String? acceleration,
    String? topSpeed,
    String? electricRange,
    String? totalPower,
    String? totalTorque,
    String? drive,
    String? nominalCapacity,
    String? useableCapacity,
    String? batteryType,
    String? chargePort,
    String? chargePower,
    String? fastchargePort,
    String? fastchargePowerMax,
    String? fastchargePower,
    String? fastchargeTime,
    String? image,
  }) {
    if (id != null) {
      _id = id;
    }
    if (uuid != null) {
      _uuid = uuid;
    }
    if (title != null) {
      _title = title;
    }
    if (vmakeId != null) {
      _vmakeId = vmakeId;
    }
    if (vmakeUuid != null) {
      _vmakeUuid = vmakeUuid;
    }
    if (vmakeTitle != null) {
      _vmakeTitle = vmakeTitle;
    }
    if (vmodelId != null) {
      _vmodelId = vmodelId;
    }
    if (vmodelUuid != null) {
      _vmodelUuid = vmodelUuid;
    }
    if (vmodelTitle != null) {
      _vmodelTitle = vmodelTitle;
    }
    if (year != null) {
      _year = year;
    }
    if (color != null) {
      _color = color;
    }
    if (engine != null) {
      _engine = engine;
    }
    if (acceleration != null) {
      _acceleration = acceleration;
    }
    if (topSpeed != null) {
      _topSpeed = topSpeed;
    }
    if (electricRange != null) {
      _electricRange = electricRange;
    }
    if (totalPower != null) {
      _totalPower = totalPower;
    }
    if (totalTorque != null) {
      _totalTorque = totalTorque;
    }
    if (drive != null) {
      _drive = drive;
    }
    if (nominalCapacity != null) {
      _nominalCapacity = nominalCapacity;
    }
    if (useableCapacity != null) {
      _useableCapacity = useableCapacity;
    }
    if (batteryType != null) {
      _batteryType = batteryType;
    }
    if (chargePort != null) {
      _chargePort = chargePort;
    }
    if (chargePower != null) {
      _chargePower = chargePower;
    }
    if (fastchargePort != null) {
      _fastchargePort = fastchargePort;
    }
    if (fastchargePowerMax != null) {
      _fastchargePowerMax = fastchargePowerMax;
    }
    if (fastchargePower != null) {
      _fastchargePower = fastchargePower;
    }
    if (fastchargeTime != null) {
      _fastchargeTime = fastchargeTime;
    }
    if (image != null) {
      _image = image;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get uuid => _uuid;
  set uuid(String? uuid) => _uuid = uuid;
  String? get title => _title;
  set title(String? title) => _title = title;
  int? get vmakeId => _vmakeId;
  set vmakeId(int? vmakeId) => _vmakeId = vmakeId;
  String? get vmakeUuid => _vmakeUuid;
  set vmakeUuid(String? vmakeUuid) => _vmakeUuid = vmakeUuid;
  String? get vmakeTitle => _vmakeTitle;
  set vmakeTitle(String? vmakeTitle) => _vmakeTitle = vmakeTitle;
  int? get vmodelId => _vmodelId;
  set vmodelId(int? vmodelId) => _vmodelId = vmodelId;
  String? get vmodelUuid => _vmodelUuid;
  set vmodelUuid(String? vmodelUuid) => _vmodelUuid = vmodelUuid;
  String? get vmodelTitle => _vmodelTitle;
  set vmodelTitle(String? vmodelTitle) => _vmodelTitle = vmodelTitle;
  String? get year => _year;
  set year(String? year) => _year = year;
  String? get color => _color;
  set color(String? color) => _color = color;
  String? get engine => _engine;
  set engine(String? engine) => _engine = engine;
  String? get acceleration => _acceleration;
  set acceleration(String? acceleration) => _acceleration = acceleration;
  String? get topSpeed => _topSpeed;
  set topSpeed(String? topSpeed) => _topSpeed = topSpeed;
  String? get electricRange => _electricRange;
  set electricRange(String? electricRange) => _electricRange = electricRange;
  String? get totalPower => _totalPower;
  set totalPower(String? totalPower) => _totalPower = totalPower;
  String? get totalTorque => _totalTorque;
  set totalTorque(String? totalTorque) => _totalTorque = totalTorque;
  String? get drive => _drive;
  set drive(String? drive) => _drive = drive;
  String? get nominalCapacity => _nominalCapacity;
  set nominalCapacity(String? nominalCapacity) =>
      _nominalCapacity = nominalCapacity;
  String? get useableCapacity => _useableCapacity;
  set useableCapacity(String? useableCapacity) =>
      _useableCapacity = useableCapacity;
  String? get batteryType => _batteryType;
  set batteryType(String? batteryType) => _batteryType = batteryType;
  String? get chargePort => _chargePort;
  set chargePort(String? chargePort) => _chargePort = chargePort;
  String? get chargePower => _chargePower;
  set chargePower(String? chargePower) => _chargePower = chargePower;
  String? get fastchargePort => _fastchargePort;
  set fastchargePort(String? fastchargePort) =>
      _fastchargePort = fastchargePort;
  String? get fastchargePowerMax => _fastchargePowerMax;
  set fastchargePowerMax(String? fastchargePowerMax) =>
      _fastchargePowerMax = fastchargePowerMax;
  String? get fastchargePower => _fastchargePower;
  set fastchargePower(String? fastchargePower) =>
      _fastchargePower = fastchargePower;
  String? get fastchargeTime => _fastchargeTime;
  set fastchargeTime(String? fastchargeTime) =>
      _fastchargeTime = fastchargeTime;
  String? get image => _image;
  set image(String? image) => _image = image;

  Vehicle.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _uuid = json['uuid'];
    _title = json['title'];
    _vmakeId = json['vmake_id'];
    _vmakeUuid = json['vmake_uuid'];
    _vmakeTitle = json['vmake_title'];
    _vmodelId = json['vmodel_id'];
    _vmodelUuid = json['vmodel_uuid'];
    _vmodelTitle = json['vmodel_title'];
    _year = json['year'];
    _color = json['color'];
    _engine = json['engine'];
    _acceleration = json['acceleration'];
    _topSpeed = json['top_speed'];
    _electricRange = json['electric_range'];
    _totalPower = json['total_power'];
    _totalTorque = json['total_torque'];
    _drive = json['drive'];
    _nominalCapacity = json['nominal_capacity'];
    _useableCapacity = json['useable_capacity'];
    _batteryType = json['battery_type'];
    _chargePort = json['charge_port'];
    _chargePower = json['charge_power'];
    _fastchargePort = json['fastcharge_port'];
    _fastchargePowerMax = json['fastcharge_power_max'];
    _fastchargePower = json['fastcharge_power'];
    _fastchargeTime = json['fastcharge_time'];
    _image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = _id;
    data['uuid'] = _uuid;
    data['title'] = _title;
    data['vmake_id'] = _vmakeId;
    data['vmake_uuid'] = _vmakeUuid;
    data['vmake_title'] = _vmakeTitle;
    data['vmodel_id'] = _vmodelId;
    data['vmodel_uuid'] = _vmodelUuid;
    data['vmodel_title'] = _vmodelTitle;
    data['year'] = _year;
    data['color'] = _color;
    data['engine'] = _engine;
    data['acceleration'] = _acceleration;
    data['top_speed'] = _topSpeed;
    data['electric_range'] = _electricRange;
    data['total_power'] = _totalPower;
    data['total_torque'] = _totalTorque;
    data['drive'] = _drive;
    data['nominal_capacity'] = _nominalCapacity;
    data['useable_capacity'] = _useableCapacity;
    data['battery_type'] = _batteryType;
    data['charge_port'] = _chargePort;
    data['charge_power'] = _chargePower;
    data['fastcharge_port'] = _fastchargePort;
    data['fastcharge_power_max'] = _fastchargePowerMax;
    data['fastcharge_power'] = _fastchargePower;
    data['fastcharge_time'] = _fastchargeTime;
    data['image'] = _image;

    return data;
  }
}

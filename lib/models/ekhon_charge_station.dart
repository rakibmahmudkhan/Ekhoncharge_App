
class EkhonChargeStation {
  int? _status;
  bool? _success;
  List<EkhonChargeStationData>? _data;



  EkhonChargeStation({int? status, bool? success, List<EkhonChargeStationData>? data}) {
    if (status != null) {
      _status = status;
    }
    if (success != null) {
      _success = success;
    }
    if (data != null) {
      _data = data;
    }
  }

  int? get status => _status;
  set status(int? status) => _status = status;
  bool? get success => _success;
  set success(bool? success) => _success = success;
  List<EkhonChargeStationData>? get data => _data;
  set data(List<EkhonChargeStationData>? data) => _data = data;

  EkhonChargeStation.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _success = json['success'];
    if (json['data'] != null) {
      _data = <EkhonChargeStationData>[];
      json['data'].forEach((v) {
        _data!.add(EkhonChargeStationData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = _status;
    data['success'] = _success;
    if (_data != null) {
      data['data'] = _data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EkhonChargeStationData {
  int? _id;
  int? _merchantId;
  String? _merchantTitle;
  String? _uuid;
  String? _title;
  String? _stationType;
  String? _merchantUuid;
  String? _pricingTitle;
  String? _powerCapacity;
 // String? _paymentMethods;
  //String? _operatingHours;
  String? _operatingStartHours;
  String? _operatingEndHours;
  //String? _amenities;
  String? _description;
  String? _image;
  String? _imagePath;
  String? _phone;
  DataAddress? _dataAddress;
  String? _locationLatitude;
  String? _locationLongitude;
  List<ChargerPoint>? _chargerpoints;
  List <PaymentMethods>? _paymentMethodsList;
  List <Amenities>? _amenitiesList;



  EkhonChargeStationData(
      {int? id,
        int? merchantId,
        String? merchantTitle,
        String? uuid,
        String? title,
        String? stationType,
        String? merchantUuid,
        String? pricingTitle,
        String? powerCapacity,
       // String? paymentMethods,
        String? operatingStartHours,
        String? operatingEndHours,
      //  String? operatingHours,
        String? amenities,
        String? description,
        String? image,
        String? imagePath,
        String? phone,
        DataAddress? dataAddress,
        String? locationLatitude,
        String? locationLongitude,
        List<ChargerPoint>? chargerpoints,
        List <PaymentMethods>? paymentMethodsList,
        List <Amenities>? amenitiesList,

      }) {
    if (id != null) {
      _id = id;
    }
    if (merchantId != null) {
      _merchantId = merchantId;
    }
    if (merchantTitle != null) {
      _merchantTitle = merchantTitle;
    }
    if (uuid != null) {
      _uuid = uuid;
    }
    if (title != null) {
      _title = title;
    }
    if (stationType != null) {
      _stationType = stationType;
    }
    if (merchantUuid != null) {
      _merchantUuid = merchantUuid;
    }
    if (pricingTitle != null) {
      _pricingTitle = pricingTitle;
    }
    if (powerCapacity != null) {
      _powerCapacity = powerCapacity;
    }
 /*   if (paymentMethods != null) {
      _paymentMethods = paymentMethods;
    }*/
   /* if (operatingHours != null) {
      _operatingHours = operatingHours;
    } */
    if (operatingStartHours != null) {
      _operatingStartHours = operatingStartHours;
    }
    if (operatingEndHours != null) {
      _operatingEndHours = operatingEndHours;
    }
    if (amenities != null) {
      _amenitiesList = amenitiesList;
    }
    if (description != null) {
      _description = description;
    }
    if (image != null) {
      _image = image;
    }
    if (imagePath != null) {
      _imagePath = imagePath;
    }
    if (phone != null) {
      _phone = phone;
    }
    if (dataAddress != null) {
      _dataAddress = dataAddress;
    }
    if (locationLatitude != null) {
      _locationLatitude = locationLatitude;
    }
    if (locationLongitude != null) {
      _locationLongitude = locationLongitude;
    }
    if (chargerpoints != null) {
      _chargerpoints = chargerpoints;
    }
    if (chargerpoints != null) {
      _paymentMethodsList = paymentMethodsList;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get merchantId => _merchantId;
  set merchantId(int? merchantId) => _merchantId = merchantId;
  String? get merchantTitle => _merchantTitle;
  set merchantTitle(String? merchantTitle) => _merchantTitle = merchantTitle;
  String? get uuid => _uuid;
  set uuid(String? uuid) => _uuid = uuid;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get stationType => _stationType;
  set stationType(String? stationType) => _stationType = stationType;
  String? get merchantUuid => _merchantUuid;
  set merchantUuid(String? merchantUuid) => _merchantUuid = merchantUuid;
  String? get pricingTitle => _pricingTitle;
  set pricingTitle(String? pricingTitle) => _pricingTitle = pricingTitle;
  String? get powerCapacity => _powerCapacity;
  set powerCapacity(String? powerCapacity) => _powerCapacity = powerCapacity;
  /*String? get paymentMethods => _paymentMethods;
  set paymentMethods(String? paymentMethods) =>
      _paymentMethods = paymentMethods;*/
 /* String? get operatingHours => _operatingHours;
  set operatingHours(String? operatingHours) =>
      _operatingHours = operatingHours;*/

  String? get operatingStartHours => _operatingStartHours;

  set operatingStartHours(String? value) {
    _operatingStartHours = value;
  }

  String? get operatingEndHours => _operatingEndHours;

  set operatingEndHours(String? value) {
    _operatingEndHours = value;
  }

  // String? get amenities => _amenities;
  // set amenities(String? amenities) => _amenities = amenities;
   String? get description => _description;
  set description(String? description) => _description = description;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get imagePath => _imagePath;
  set imagePath(String? imagePath) => _imagePath = imagePath;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;
  DataAddress? get dataAddress => _dataAddress;
  set dataAddress(DataAddress? dataAddress) => _dataAddress = dataAddress;
  String? get locationLatitude => _locationLatitude;
  set locationLatitude(String? locationLatitude) =>
      _locationLatitude = locationLatitude;
  String? get locationLongitude => _locationLongitude;
  set locationLongitude(String? locationLongitude) =>
      _locationLongitude = locationLongitude;
  List<ChargerPoint>? get chargerpoints => _chargerpoints;
  set chargerpoints(List<ChargerPoint>? chargerpoints) =>
      _chargerpoints = chargerpoints;


  List<PaymentMethods>? get paymentMethodsList => _paymentMethodsList;

  set paymentMethodsList(List<PaymentMethods>? value) {
    _paymentMethodsList = value;
  }

  List<Amenities>? get amenitiesList => _amenitiesList;

  set amenitiesList(List<Amenities>? value) {
    _amenitiesList = value;
  }

  EkhonChargeStationData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _merchantId = json['merchant_id'];
    _merchantTitle = json['merchant_title'];
    _uuid = json['uuid'];
    _title = json['title'];
    _stationType = json['station_type'];
    _merchantUuid = json['merchant_uuid'];
    _pricingTitle = json['pricing_title'];
    _powerCapacity = json['power_capacity'];
   // _paymentMethods = json['payment_methods'];
  //  _operatingHours = json['operating_hours'];
  _operatingStartHours = json['operating_start_hours'];
  _operatingEndHours = json['operating_end_hours'];


    //_amenities = json['amenities'];
    _description = json['description'];
    _image = json['image'];
    _imagePath = json['image_path'];
    _phone = json['phone'];
    _dataAddress = json['data_address'] != null
        ?   DataAddress?.fromJson(json['data_address'])
        : null;

    _locationLatitude = json['location_latitude'];
    _locationLongitude = json['location_longitude'];
    if (json['chargerpoints'] != null) {
      _chargerpoints = <ChargerPoint>[];
      json['chargerpoints'].forEach((v) {
        _chargerpoints!.add(ChargerPoint.fromJson(v));
      });
    }
    if(json['payment_methods']!=null && json['payment_methods'].toString()!='[]'){
      _paymentMethodsList=[];
      json["payment_methods"].keys.forEach((v) {
        _paymentMethodsList!.add(PaymentMethods.fromJson( json["payment_methods"][v]));
      });
    }
    if(json['amenities']!=null && json['amenities'].toString()!='[]'){
      _amenitiesList=[];
      json["amenities"].keys.forEach((v) {
        _amenitiesList!.add(Amenities.fromJson( json["amenities"][v]));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['merchant_id'] = _merchantId;
    data['merchant_title'] = _merchantTitle;
    data['uuid'] = _uuid;
    data['title'] = _title;
    data['station_type'] = _stationType;
    data['merchant_uuid'] = _merchantUuid;
    data['pricing_title'] = _pricingTitle;
    data['power_capacity'] = _powerCapacity;
   // data['payment_methods'] = _paymentMethods;
    //data['operating_hours'] = _operatingHours;
    data['operating_start_hours'] = _operatingStartHours;
    data['operating_end_hours'] = _operatingEndHours;
    //data['amenities'] = _amenities; _amenitiesList


    if (_amenitiesList != null) {
      data['amenities'] =
          _amenitiesList!.map((v) => v.toJson()).toList();
    }
    data['description'] = _description;
    data['image'] = _image;
    data['image_path'] = _imagePath;
    data['phone'] = _phone;
    if (_dataAddress != null) {
      data['data_address'] = _dataAddress!.toJson();
    }
  //  data['data_address'] = _dataAddress;
    data['location_latitude'] = _locationLatitude;
    data['location_longitude'] = _locationLongitude;
    if (_chargerpoints != null) {
      data['chargerpoints'] =
          _chargerpoints!.map((v) => v.toJson()).toList();
    }
    return data;
  }


}

class DataAddress {
  int? _id;
  String? _city;
  String? _uuid;
  String? _state;
  String? _street;
  String? _district;
  String? _postcode;
  String? _countryId;
  String? _createdAt;
  int? _createdBy;
  String? _updatedAt;
  String? _countryUuid;
  int? _scopeableId;
  String? _countryTitle;
  String? _addressLine1;
  String? _addressLine2;
  String? _scopeableUuid;

  DataAddress(
      {int? id,
        String? city,
        String? uuid,
        String? state,
        String? street,
        String? district,
        String? postcode,
        String? countryId,
        String? createdAt,
        int? createdBy,
        String? updatedAt,
        String? countryUuid,
        int? scopeableId,
        String? countryTitle,
        String? addressLine1,
        String? addressLine2,
        String? scopeableUuid}) {
    if (id != null) {
      _id = id;
    }
    if (city != null) {
      _city = city;
    }
    if (uuid != null) {
      _uuid = uuid;
    }
    if (state != null) {
      _state = state;
    }
    if (street != null) {
      _street = street;
    }
    if (district != null) {
      _district = district;
    }
    if (postcode != null) {
      _postcode = postcode;
    }
    if (countryId != null) {
      _countryId = countryId;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (createdBy != null) {
      _createdBy = createdBy;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
    if (countryUuid != null) {
      _countryUuid = countryUuid;
    }
    if (scopeableId != null) {
      _scopeableId = scopeableId;
    }
    if (countryTitle != null) {
      _countryTitle = countryTitle;
    }
    if (addressLine1 != null) {
      _addressLine1 = addressLine1;
    }
    if (addressLine2 != null) {
      _addressLine2 = addressLine2;
    }
    if (scopeableUuid != null) {
      _scopeableUuid = scopeableUuid;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get city => _city;
  set city(String? city) => _city = city;
  String? get uuid => _uuid;
  set uuid(String? uuid) => _uuid = uuid;
  String? get state => _state;
  set state(String? state) => _state = state;
  String? get street => _street;
  set street(String? street) => _street = street;
  String? get district => _district;
  set district(String? district) => _district = district;
  String? get postcode => _postcode;
  set postcode(String? postcode) => _postcode = postcode;
  String? get countryId => _countryId;
  set countryId(String? countryId) => _countryId = countryId;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  int? get createdBy => _createdBy;
  set createdBy(int? createdBy) => _createdBy = createdBy;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  String? get countryUuid => _countryUuid;
  set countryUuid(String? countryUuid) => _countryUuid = countryUuid;
  int? get scopeableId => _scopeableId;
  set scopeableId(int? scopeableId) => _scopeableId = scopeableId;
  String? get countryTitle => _countryTitle;
  set countryTitle(String? countryTitle) => _countryTitle = countryTitle;
  String? get addressLine1 => _addressLine1;
  set addressLine1(String? addressLine1) => _addressLine1 = addressLine1;
  String? get addressLine2 => _addressLine2;
  set addressLine2(String? addressLine2) => _addressLine2 = addressLine2;
  String? get scopeableUuid => _scopeableUuid;
  set scopeableUuid(String? scopeableUuid) => _scopeableUuid = scopeableUuid;

  DataAddress.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _city = json['city'];
    _uuid = json['uuid'];
    _state = json['state'];
    _street = json['street'];
    _district = json['district'];
    _postcode = json['postcode'];
    _countryId = json['country_id'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _countryUuid = json['country_uuid'];
    _scopeableId = json['scopeable_id'];
    _countryTitle = json['country_title'];
    _addressLine1 = json['address_line_1'];
    _addressLine2 = json['address_line_2'];
    _scopeableUuid = json['scopeable_uuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = _id;
    data['city'] = _city;
    data['uuid'] = _uuid;
    data['state'] = _state;
    data['street'] = _street;
    data['district'] = _district;
    data['postcode'] = _postcode;
    data['country_id'] = _countryId;
    data['created_at'] = _createdAt;
    data['created_by'] = _createdBy;
    data['updated_at'] = _updatedAt;
    data['country_uuid'] = _countryUuid;
    data['scopeable_id'] = _scopeableId;
    data['country_title'] = _countryTitle;
    data['address_line_1'] = _addressLine1;
    data['address_line_2'] = _addressLine2;
    data['scopeable_uuid'] = _scopeableUuid;
    return data;
  }
}
class ChargerPoint {
  int? _id;
  int? _stationId;
  String? _stationTitle;
  String? _uuid;
  String? _title;
  String? _stationUuid;
  String? _chargerId;
  String? _ocppProtocol;
  String? _registrationStatus;
  String? _chargePointVendor;
  String? _chargePointModel;
  String? _chargePointSerialNumber;
  String? _chargeBoxSerialNumber;
  String? _fwVersion;
  String? _fwUpdateStatus;
  String? _fwUpdateTimestamp;
  String? _iccid;
  String? _imsi;
  String? _meterType;
  String? _meterSerialNumber;
  String? _diagnosticsStatus;
  String? _diagnosticsTimestamp;
  String? _lastHeartbeatTimestamp;
  String? _description;
  String? _note;
  String? _locationLatitude;
  String? _locationLongitude;
  String? _adminAddress;
  String? _chargingType;
  int? _status;
  String? _installationDate;
  String? _lastMaintenanceDate;
  String? _nextMaintenanceDate;
  String? _dataAddress;
  String? _qrcode;
  List<Connectors>? _connectors;

  ChargerPoint(
      {int? id,
        int? stationId,
        String? stationTitle,
        String? uuid,
        String? title,
        String? stationUuid,
        String? chargerId,
        String? ocppProtocol,
        String? registrationStatus,
        String? chargePointVendor,
        String? chargePointModel,
        String? chargePointSerialNumber,
        String? chargeBoxSerialNumber,
        String? fwVersion,
        String? fwUpdateStatus,
        String? fwUpdateTimestamp,
        String? iccid,
        String? imsi,
        String? meterType,
        String? meterSerialNumber,
        String? diagnosticsStatus,
        String? diagnosticsTimestamp,
        String? lastHeartbeatTimestamp,
        String? description,
        String? note,
        String? locationLatitude,
        String? locationLongitude,
        String? adminAddress,
        String? chargingType,
        int? status,
        String? installationDate,
        String? lastMaintenanceDate,
        String? nextMaintenanceDate,
        String? dataAddress,
        String? qrcode,
        String? deletedAt,
        String? createdAt,
        String? updatedAt,
        List<Connectors>? connectors}) {
    if (id != null) {
      _id = id;
    }
    if (stationId != null) {
      _stationId = stationId;
    }
    if (stationTitle != null) {
      _stationTitle = stationTitle;
    }
    if (uuid != null) {
      _uuid = uuid;
    }
    if (title != null) {
      _title = title;
    }
    if (stationUuid != null) {
      _stationUuid = stationUuid;
    }
    if (chargerId != null) {
      _chargerId = chargerId;
    }
    if (ocppProtocol != null) {
      _ocppProtocol = ocppProtocol;
    }
    if (registrationStatus != null) {
      _registrationStatus = registrationStatus;
    }
    if (chargePointVendor != null) {
      _chargePointVendor = chargePointVendor;
    }
    if (chargePointModel != null) {
      _chargePointModel = chargePointModel;
    }
    if (chargePointSerialNumber != null) {
      _chargePointSerialNumber = chargePointSerialNumber;
    }
    if (chargeBoxSerialNumber != null) {
      _chargeBoxSerialNumber = chargeBoxSerialNumber;
    }
    if (fwVersion != null) {
      _fwVersion = fwVersion;
    }
    if (fwUpdateStatus != null) {
      _fwUpdateStatus = fwUpdateStatus;
    }
    if (fwUpdateTimestamp != null) {
      _fwUpdateTimestamp = fwUpdateTimestamp;
    }
    if (iccid != null) {
      _iccid = iccid;
    }
    if (imsi != null) {
      _imsi = imsi;
    }
    if (meterType != null) {
      _meterType = meterType;
    }
    if (meterSerialNumber != null) {
      _meterSerialNumber = meterSerialNumber;
    }
    if (diagnosticsStatus != null) {
      _diagnosticsStatus = diagnosticsStatus;
    }
    if (diagnosticsTimestamp != null) {
      _diagnosticsTimestamp = diagnosticsTimestamp;
    }
    if (lastHeartbeatTimestamp != null) {
      _lastHeartbeatTimestamp = lastHeartbeatTimestamp;
    }
    if (description != null) {
      _description = description;
    }
    if (note != null) {
      _note = note;
    }
    if (locationLatitude != null) {
      _locationLatitude = locationLatitude;
    }
    if (locationLongitude != null) {
      _locationLongitude = locationLongitude;
    }
    if (adminAddress != null) {
      _adminAddress = adminAddress;
    }
    if (chargingType != null) {
      _chargingType = chargingType;
    }
    if (status != null) {
      _status = status;
    }
    if (installationDate != null) {
      _installationDate = installationDate;
    }
    if (lastMaintenanceDate != null) {
      _lastMaintenanceDate = lastMaintenanceDate;
    }
    if (nextMaintenanceDate != null) {
      _nextMaintenanceDate = nextMaintenanceDate;
    }
    if (dataAddress != null) {
      _dataAddress = dataAddress;
    }
    if (qrcode != null) {
      _qrcode = qrcode;
    }
    if (connectors != null) {
      _connectors = connectors;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get stationId => _stationId;
  set stationId(int? stationId) => _stationId = stationId;
  String? get stationTitle => _stationTitle;
  set stationTitle(String? stationTitle) => _stationTitle = stationTitle;
  String? get uuid => _uuid;
  set uuid(String? uuid) => _uuid = uuid;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get stationUuid => _stationUuid;
  set stationUuid(String? stationUuid) => _stationUuid = stationUuid;
  String? get chargerId => _chargerId;
  set chargerId(String? chargerId) => _chargerId = chargerId;
  String? get ocppProtocol => _ocppProtocol;
  set ocppProtocol(String? ocppProtocol) => _ocppProtocol = ocppProtocol;
  String? get registrationStatus => _registrationStatus;
  set registrationStatus(String? registrationStatus) =>
      _registrationStatus = registrationStatus;
  String? get chargePointVendor => _chargePointVendor;
  set chargePointVendor(String? chargePointVendor) =>
      _chargePointVendor = chargePointVendor;
  String? get chargePointModel => _chargePointModel;
  set chargePointModel(String? chargePointModel) =>
      _chargePointModel = chargePointModel;
  String? get chargePointSerialNumber => _chargePointSerialNumber;
  set chargePointSerialNumber(String? chargePointSerialNumber) =>
      _chargePointSerialNumber = chargePointSerialNumber;
  String? get chargeBoxSerialNumber => _chargeBoxSerialNumber;
  set chargeBoxSerialNumber(String? chargeBoxSerialNumber) =>
      _chargeBoxSerialNumber = chargeBoxSerialNumber;
  String? get fwVersion => _fwVersion;
  set fwVersion(String? fwVersion) => _fwVersion = fwVersion;
  String? get fwUpdateStatus => _fwUpdateStatus;
  set fwUpdateStatus(String? fwUpdateStatus) =>
      _fwUpdateStatus = fwUpdateStatus;
  String? get fwUpdateTimestamp => _fwUpdateTimestamp;
  set fwUpdateTimestamp(String? fwUpdateTimestamp) =>
      _fwUpdateTimestamp = fwUpdateTimestamp;
  String? get iccid => _iccid;
  set iccid(String? iccid) => _iccid = iccid;
  String? get imsi => _imsi;
  set imsi(String? imsi) => _imsi = imsi;
  String? get meterType => _meterType;
  set meterType(String? meterType) => _meterType = meterType;
  String? get meterSerialNumber => _meterSerialNumber;
  set meterSerialNumber(String? meterSerialNumber) =>
      _meterSerialNumber = meterSerialNumber;
  String? get diagnosticsStatus => _diagnosticsStatus;
  set diagnosticsStatus(String? diagnosticsStatus) =>
      _diagnosticsStatus = diagnosticsStatus;
  String? get diagnosticsTimestamp => _diagnosticsTimestamp;
  set diagnosticsTimestamp(String? diagnosticsTimestamp) =>
      _diagnosticsTimestamp = diagnosticsTimestamp;
  String? get lastHeartbeatTimestamp => _lastHeartbeatTimestamp;
  set lastHeartbeatTimestamp(String? lastHeartbeatTimestamp) =>
      _lastHeartbeatTimestamp = lastHeartbeatTimestamp;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get note => _note;
  set note(String? note) => _note = note;
  String? get locationLatitude => _locationLatitude;
  set locationLatitude(String? locationLatitude) =>
      _locationLatitude = locationLatitude;
  String? get locationLongitude => _locationLongitude;
  set locationLongitude(String? locationLongitude) =>
      _locationLongitude = locationLongitude;
  String? get adminAddress => _adminAddress;
  set adminAddress(String? adminAddress) => _adminAddress = adminAddress;
  String? get chargingType => _chargingType;
  set chargingType(String? chargingType) => _chargingType = chargingType;
  int? get status => _status;
  set status(int? status) => _status = status;
  String? get installationDate => _installationDate;
  set installationDate(String? installationDate) =>
      _installationDate = installationDate;
  String? get lastMaintenanceDate => _lastMaintenanceDate;
  set lastMaintenanceDate(String? lastMaintenanceDate) =>
      _lastMaintenanceDate = lastMaintenanceDate;
  String? get nextMaintenanceDate => _nextMaintenanceDate;
  set nextMaintenanceDate(String? nextMaintenanceDate) =>
      _nextMaintenanceDate = nextMaintenanceDate;
  String? get dataAddress => _dataAddress;
  set dataAddress(String? dataAddress) => _dataAddress = dataAddress;
  String? get qrcode => _qrcode;
  set qrcode(String? qrcode) => _qrcode = qrcode;
  List<Connectors>? get connectors => _connectors;
  set connectors(List<Connectors>? connectors) => _connectors = connectors;

  ChargerPoint.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _stationId = json['station_id'];
    _stationTitle = json['station_title'];
    _uuid = json['uuid'];
    _title = json['title'];
    _stationUuid = json['station_uuid'];
    _chargerId = json['charger_id'];
    _ocppProtocol = json['ocpp_protocol'];
    _registrationStatus = json['registration_status'];
    _chargePointVendor = json['charge_point_vendor'];
    _chargePointModel = json['charge_point_model'];
    _chargePointSerialNumber = json['charge_point_serial_number'];
    _chargeBoxSerialNumber = json['charge_box_serial_number'];
    _fwVersion = json['fw_version'];
    _fwUpdateStatus = json['fw_update_status'];
    _fwUpdateTimestamp = json['fw_update_timestamp'];
    _iccid = json['iccid'];
    _imsi = json['imsi'];
    _meterType = json['meter_type'];
    _meterSerialNumber = json['meter_serial_number'];
    _diagnosticsStatus = json['diagnostics_status'];
    _diagnosticsTimestamp = json['diagnostics_timestamp'];
    _lastHeartbeatTimestamp = json['last_heartbeat_timestamp'];
    _description = json['description'];
    _note = json['note'];
    _locationLatitude = json['location_latitude'];
    _locationLongitude = json['location_longitude'];
    _adminAddress = json['admin_address'];
    _chargingType = json['charging_type'];
    _status = json['status'];
    _installationDate = json['installation_date'];
    _lastMaintenanceDate = json['last_maintenance_date'];
    _nextMaintenanceDate = json['next_maintenance_date'];
    _dataAddress = json['data_address'];
    _qrcode = json['qrcode'];
    if (json['connectors'] != null) {
      _connectors = <Connectors>[];
      json['connectors'].forEach((v) {
        _connectors!.add(Connectors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['station_id'] = _stationId;
    data['station_title'] = _stationTitle;
    data['uuid'] = _uuid;
    data['title'] = _title;
    data['station_uuid'] = _stationUuid;
    data['charger_id'] = _chargerId;
    data['ocpp_protocol'] = _ocppProtocol;
    data['registration_status'] = _registrationStatus;
    data['charge_point_vendor'] = _chargePointVendor;
    data['charge_point_model'] = _chargePointModel;
    data['charge_point_serial_number'] = _chargePointSerialNumber;
    data['charge_box_serial_number'] = _chargeBoxSerialNumber;
    data['fw_version'] = _fwVersion;
    data['fw_update_status'] = _fwUpdateStatus;
    data['fw_update_timestamp'] = _fwUpdateTimestamp;
    data['iccid'] = _iccid;
    data['imsi'] = _imsi;
    data['meter_type'] = _meterType;
    data['meter_serial_number'] = _meterSerialNumber;
    data['diagnostics_status'] = _diagnosticsStatus;
    data['diagnostics_timestamp'] = _diagnosticsTimestamp;
    data['last_heartbeat_timestamp'] = _lastHeartbeatTimestamp;
    data['description'] = _description;
    data['note'] = _note;
    data['location_latitude'] = _locationLatitude;
    data['location_longitude'] = _locationLongitude;
    data['admin_address'] = _adminAddress;
    data['charging_type'] = _chargingType;
    data['status'] = _status;
    data['installation_date'] = _installationDate;
    data['last_maintenance_date'] = _lastMaintenanceDate;
    data['next_maintenance_date'] = _nextMaintenanceDate;
    data['data_address'] = _dataAddress;
    data['qrcode'] = _qrcode;
    if (_connectors != null) {
      data['connectors'] = _connectors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Connectors {
  int? _id;
  int? _chargerpointId;
  String? _chargerpointTitle;
  String? _uuid;
  String? _title;
  String? _chargerpointUuid;

  Connectors(
      {int? id,
        int? chargerpointId,
        String? chargerpointTitle,
        String? uuid,
        String? title,
        String? chargerpointUuid}) {
    if (id != null) {
      _id = id;
    }
    if (chargerpointId != null) {
      _chargerpointId = chargerpointId;
    }
    if (chargerpointTitle != null) {
      _chargerpointTitle = chargerpointTitle;
    }
    if (uuid != null) {
      _uuid = uuid;
    }
    if (title != null) {
      _title = title;
    }
    if (chargerpointUuid != null) {
      _chargerpointUuid = chargerpointUuid;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get chargerpointId => _chargerpointId;
  set chargerpointId(int? chargerpointId) => _chargerpointId = chargerpointId;
  String? get chargerpointTitle => _chargerpointTitle;
  set chargerpointTitle(String? chargerpointTitle) =>
      _chargerpointTitle = chargerpointTitle;
  String? get uuid => _uuid;
  set uuid(String? uuid) => _uuid = uuid;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get chargerpointUuid => _chargerpointUuid;
  set chargerpointUuid(String? chargerpointUuid) =>
      _chargerpointUuid = chargerpointUuid;
  Connectors.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _chargerpointId = json['chargerpoint_id'];
    _chargerpointTitle = json['chargerpoint_title'];
    _uuid = json['uuid'];
    _title = json['title'];
    _chargerpointUuid = json['chargerpoint_uuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['chargerpoint_id'] = _chargerpointId;
    data['chargerpoint_title'] = _chargerpointTitle;
    data['uuid'] = _uuid;
    data['title'] = _title;
    data['chargerpoint_uuid'] = _chargerpointUuid;
    return data;
  }
}

class PaymentMethods {
  String? _icon;
  String? _name;
  int? _id;

  PaymentMethods({String? icon, String? name, int? id}) {
    if (icon != null) {
      _icon = icon;
    }
    if (name != null) {
      _name = name;
    }
    if (id != null) {
      _id = id;
    }
  }

  String? get icon => _icon;
  set icon(String? icon) => _icon = icon;
  String? get name => _name;
  set name(String? name) => _name = name;
  int? get id => _id;
  set id(int? id) => _id = id;

  PaymentMethods.fromJson(Map<String, dynamic> json) {
    _icon = json['icon'];
    _name = json['name'];
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = _icon;
    data['name'] = _name;
    data['id'] = _id;
    return data;
  }
}
class Amenities {
  String? _icon;
  String? _name;
  int? _id;

  Amenities({String? icon, String? name, int? id}) {
    if (icon != null) {
      _icon = icon;
    }
    if (name != null) {
      _name = name;
    }
    if (id != null) {
      _id = id;
    }
  }

  String? get icon => _icon;
  set icon(String? icon) => _icon = icon;
  String? get name => _name;
  set name(String? name) => _name = name;
  int? get id => _id;
  set id(int? id) => _id = id;

  Amenities.fromJson(Map<String, dynamic> json) {
    _icon = json['icon'];
    _name = json['name'];
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = _icon;
    data['name'] = _name;
    data['id'] = _id;
    return data;
  }
}

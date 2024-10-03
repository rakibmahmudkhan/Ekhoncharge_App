class NearbyCharger {
  bool? _success;
  List<Chargers>? _chargers;

  NearbyCharger({bool? success, List<Chargers>? chargers}) {
    if (success != null) {
      _success = success;
    }
    if (chargers != null) {
      _chargers = chargers;
    }
  }

  bool? get success => _success;

  set success(bool? success) => _success = success;

  List<Chargers>? get chargers => _chargers;

  set chargers(List<Chargers>? chargers) => _chargers = chargers;

  NearbyCharger.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    if (json['chargers'] != null) {
      _chargers = <Chargers>[];
      json['chargers'].forEach((v) {
        _chargers!.add(Chargers.fromJson(v));
      });
    }
  }
}

class  Chargers {
  int? _chargerId;
  String? _name;
  String? _endpointAddress;
  String? _ocppProtocol;
  String? _registrationStatus;
  String? _chargePointVendor;
  String? _chargePointModel;
  String? _chargePointSerialNumber;
  String? _chargeBoxSerialNumber;
  String? _fwVersion;
  String? _fwUpdateStatus;
  String? _fwUpdateTimestamp;
  int? _iccid;
  int? _distance;
  String? _arrivedHour;
  String? _distanceUnit;
  String? _imsi;
  String? _meterType;
  int? _meterSerialNumber;
  String? _diagnosticsStatus;
  String? _diagnosticsTimestamp;
  String? _lastHeartbeatTimestamp;
  String? _description;
  String? _note;
  double? _locationLatitude;
  double? _locationLongitude;
  String? _chargingType;
  int? _totalPorts;
  int? _availablePorts;
  String? _photo;
  String? _createdAt;
  String? _updatedAt;
  bool? _isFav;

  Chargers(
      {int? chargerId,
      String? endpointAddress,
      String? name,
      String? ocppProtocol,
      String? registrationStatus,
      String? chargePointVendor,
      String? chargePointModel,
      String? chargePointSerialNumber,
      String? chargeBoxSerialNumber,
      String? fwVersion,
      String? fwUpdateStatus,
      String? fwUpdateTimestamp,
      int? iccid,
      int? distance,
      String? arrivedHour,
      String? distanceUnit,
      String? imsi,
      String? meterType,
      int? meterSerialNumber,
      String? diagnosticsStatus,
      String? diagnosticsTimestamp,
      String? lastHeartbeatTimestamp,
      String? description,
      String? note,
      double? locationLatitude,
      double? locationLongitude,
      String? chargingType,
      int? totalPorts,
      int? availablePorts,
      String? photo,
      String? createdAt,
      bool? isFav,
      String? updatedAt}) {
    if (chargerId != null) {
      _chargerId = chargerId;
    }
    if (endpointAddress != null) {
      _endpointAddress = endpointAddress;
    }
    if (name != null) {
      _name = name;
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
    if (distanceUnit != null) {
      _distanceUnit = distanceUnit;
    }
    if (distance != null) {
      _distance = distance;
    }
    if (arrivedHour != null) {
      _arrivedHour = arrivedHour;
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
    if (chargingType != null) {
      _chargingType = chargingType;
    }
    if (totalPorts != null) {
      _totalPorts = totalPorts;
    }
    if (availablePorts != null) {
      _availablePorts = availablePorts;
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
    if (isFav != null) {
      _isFav = isFav;
    }
  }

  int? get chargerId => _chargerId;

  set chargerId(int? chargerId) => _chargerId = chargerId;

  String? get endpointAddress => _endpointAddress;

  set endpointAddress(String? endpointAddress) =>
      _endpointAddress = endpointAddress;

  String? get name => _name;

  set name(String? name) => _name = name;

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

  int? get iccid => _iccid;

  set iccid(int? iccid) => _iccid = iccid;

  String? get arrivedHour => _arrivedHour;

  set arrivedHour(String? arrivedHour) => _arrivedHour = arrivedHour;

  int? get distance => _distance;

  set distance(int? distance) => _distance = distance;

  String? get imsi => _imsi;

  set imsi(String? imsi) => _imsi = imsi;

  String? get distanceUnit => _distanceUnit;

  set distanceUnit(String? distanceUnit) => _distanceUnit = distanceUnit;

  String? get meterType => _meterType;

  set meterType(String? meterType) => _meterType = meterType;

  int? get meterSerialNumber => _meterSerialNumber;

  set meterSerialNumber(int? meterSerialNumber) =>
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

  double? get locationLatitude => _locationLatitude;

  set locationLatitude(double? locationLatitude) =>
      _locationLatitude = locationLatitude;

  double? get locationLongitude => _locationLongitude;

  set locationLongitude(double? locationLongitude) =>
      _locationLongitude = locationLongitude;

  String? get chargingType => _chargingType;

  set chargingType(String? chargingType) => _chargingType = chargingType;

  int? get totalPorts => _totalPorts;

  set totalPorts(int? totalPorts) => _totalPorts = totalPorts;

  int? get availablePorts => _availablePorts;

  set availablePorts(int? availablePorts) => _availablePorts = availablePorts;

  String? get photo => _photo;

  set photo(String? photo) => _photo = photo;

  String? get createdAt => _createdAt;

  set createdAt(String? createdAt) => _createdAt = createdAt;

  String? get updatedAt => _updatedAt;

  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  bool? get isFav => _isFav;

  set isFav(bool? isFav) => _isFav = isFav;

  Chargers.fromJson(Map<String, dynamic> json) {
    _chargerId = json['charger_id'];
    _name = json['name'];
    _endpointAddress = json['endpoint_address'];
    _ocppProtocol = json['ocpp_protocol'];
    _registrationStatus = json['registration_status'];
    _chargePointVendor = json['charge_point_vendor'];
    _chargePointModel = json['charge_point_model'];
    _chargePointSerialNumber = json['charge_point_serial_number'];
    _chargeBoxSerialNumber = json['charge_box_serial_number'];
    _fwVersion = json['fw_version'];
    _fwUpdateStatus = json['fw_update_status'];
    _fwUpdateTimestamp = json['fw_update_timestamp'];
    _distanceUnit = json['distance_unit'];
    _distance = json['distance'];
    _iccid = json['iccid'];
    _imsi = json['imsi'];
    _arrivedHour = json['arrived_hour'];
    _meterType = json['meter_type'];
    _meterSerialNumber = json['meter_serial_number'];
    _diagnosticsStatus = json['diagnostics_status'];
    _diagnosticsTimestamp = json['diagnostics_timestamp'];
    _lastHeartbeatTimestamp = json['last_heartbeat_timestamp'];
    _description = json['description'];
    _note = json['note'];
    _locationLatitude = json['location_latitude'];
    _locationLongitude = json['location_longitude'];
    _chargingType = json['charging_type'];
    _totalPorts = json['total_ports'];
    _availablePorts = json['available_ports'];
    _photo = json['photo'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _isFav = json['is_fav'];
  }
}

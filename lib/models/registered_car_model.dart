class RegisteredCarModel {
  bool? _status;
  List<VehiclesData>? _vehicles;

  RegisteredCarModel({bool? status, List<VehiclesData>? vehicles}) {
    if (status != null) {
      this._status = status;
    }
    if (vehicles != null) {
      this._vehicles = vehicles;
    }
  }

  bool? get status => _status;
  set status(bool? status) => _status = status;
  List<VehiclesData>? get vehicles => _vehicles;
  set vehicles(List<VehiclesData>? vehicles) => _vehicles = vehicles;

  RegisteredCarModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    if (json['vehicles'] != null) {
      _vehicles = <VehiclesData>[];
      json['vehicles'].forEach((v) {
        _vehicles!.add(new VehiclesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    if (this._vehicles != null) {
      data['vehicles'] = this._vehicles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VehiclesData {
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

  Vehicle? _vehicle;

  VehiclesData(
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
      this._id = id;
    }
    if (uuid != null) {
      this._uuid = uuid;
    }
    if (customerId != null) {
      this._customerId = customerId;
    }
    if (customerUuid != null) {
      this._customerUuid = customerUuid;
    }
    if (customerTitle != null) {
      this._customerTitle = customerTitle;
    }
    if (vehicleId != null) {
      this._vehicleId = vehicleId;
    }
    if (vehicleUuid != null) {
      this._vehicleUuid = vehicleUuid;
    }
    if (vehicleTitle != null) {
      this._vehicleTitle = vehicleTitle;
    }
    if (vin != null) {
      this._vin = vin;
    }
    if (registrationNo != null) {
      this._registrationNo = registrationNo;
    }
    if (isActive != null) {
      this._isActive = isActive;
    }

    if (vehicle != null) {
      this._vehicle = vehicle;
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

  Vehicle? get vehicle => _vehicle;
  set vehicle(Vehicle? vehicle) => _vehicle = vehicle;

  VehiclesData.fromJson(Map<String, dynamic> json) {
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
    data['id'] = this._id;
    data['uuid'] = this._uuid;
    data['customer_id'] = this._customerId;
    data['customer_uuid'] = this._customerUuid;
    data['customer_title'] = this._customerTitle;
    data['vehicle_id'] = this._vehicleId;
    data['vehicle_uuid'] = this._vehicleUuid;
    data['vehicle_title'] = this._vehicleTitle;
    data['vin'] = this._vin;
    data['registration_no'] = this._registrationNo;
    data['is_active'] = this._isActive;

    if (this._vehicle != null) {
      data['vehicle'] = this._vehicle!.toJson();
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


  Vehicle(
      {int? id,
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
      this._id = id;
    }
    if (uuid != null) {
      this._uuid = uuid;
    }
    if (title != null) {
      this._title = title;
    }
    if (vmakeId != null) {
      this._vmakeId = vmakeId;
    }
    if (vmakeUuid != null) {
      this._vmakeUuid = vmakeUuid;
    }
    if (vmakeTitle != null) {
      this._vmakeTitle = vmakeTitle;
    }
    if (vmodelId != null) {
      this._vmodelId = vmodelId;
    }
    if (vmodelUuid != null) {
      this._vmodelUuid = vmodelUuid;
    }
    if (vmodelTitle != null) {
      this._vmodelTitle = vmodelTitle;
    }
    if (year != null) {
      this._year = year;
    }
    if (color != null) {
      this._color = color;
    }
    if (engine != null) {
      this._engine = engine;
    }
    if (acceleration != null) {
      this._acceleration = acceleration;
    }
    if (topSpeed != null) {
      this._topSpeed = topSpeed;
    }
    if (electricRange != null) {
      this._electricRange = electricRange;
    }
    if (totalPower != null) {
      this._totalPower = totalPower;
    }
    if (totalTorque != null) {
      this._totalTorque = totalTorque;
    }
    if (drive != null) {
      this._drive = drive;
    }
    if (nominalCapacity != null) {
      this._nominalCapacity = nominalCapacity;
    }
    if (useableCapacity != null) {
      this._useableCapacity = useableCapacity;
    }
    if (batteryType != null) {
      this._batteryType = batteryType;
    }
    if (chargePort != null) {
      this._chargePort = chargePort;
    }
    if (chargePower != null) {
      this._chargePower = chargePower;
    }
    if (fastchargePort != null) {
      this._fastchargePort = fastchargePort;
    }
    if (fastchargePowerMax != null) {
      this._fastchargePowerMax = fastchargePowerMax;
    }
    if (fastchargePower != null) {
      this._fastchargePower = fastchargePower;
    }
    if (fastchargeTime != null) {
      this._fastchargeTime = fastchargeTime;
    }
    if (image != null) {
      this._image = image;
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
    data['id'] = this._id;
    data['uuid'] = this._uuid;
    data['title'] = this._title;
    data['vmake_id'] = this._vmakeId;
    data['vmake_uuid'] = this._vmakeUuid;
    data['vmake_title'] = this._vmakeTitle;
    data['vmodel_id'] = this._vmodelId;
    data['vmodel_uuid'] = this._vmodelUuid;
    data['vmodel_title'] = this._vmodelTitle;
    data['year'] = this._year;
    data['color'] = this._color;
    data['engine'] = this._engine;
    data['acceleration'] = this._acceleration;
    data['top_speed'] = this._topSpeed;
    data['electric_range'] = this._electricRange;
    data['total_power'] = this._totalPower;
    data['total_torque'] = this._totalTorque;
    data['drive'] = this._drive;
    data['nominal_capacity'] = this._nominalCapacity;
    data['useable_capacity'] = this._useableCapacity;
    data['battery_type'] = this._batteryType;
    data['charge_port'] = this._chargePort;
    data['charge_power'] = this._chargePower;
    data['fastcharge_port'] = this._fastchargePort;
    data['fastcharge_power_max'] = this._fastchargePowerMax;
    data['fastcharge_power'] = this._fastchargePower;
    data['fastcharge_time'] = this._fastchargeTime;
    data['image'] = this._image;

    return data;
  }
}
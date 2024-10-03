class VehicleDetailsModel {
  int? _status;
  bool? _success;
  VehicleDetailsModelData? _data;

  VehicleDetailsModel({int? status, bool? success, VehicleDetailsModelData? data}) {
    if (status != null) {
      this._status = status;
    }
    if (success != null) {
      this._success = success;
    }
    if (data != null) {
      this._data = data;
    }
  }

  int? get status => _status;
  set status(int? status) => _status = status;
  bool? get success => _success;
  set success(bool? success) => _success = success;
  VehicleDetailsModelData? get data => _data;
  set data(VehicleDetailsModelData? data) => _data = data;

  VehicleDetailsModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _success = json['success'];
    _data = json['data'] != null ? new VehicleDetailsModelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['success'] = this._success;
    if (this._data != null) {
      data['data'] = this._data!.toJson();
    }
    return data;
  }
}

class VehicleDetailsModelData {
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
  String? _image;

  VehicleDetailsModelData(
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
        String? image}) {
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
  String? get image => _image;
  set image(String? image) => _image = image;

  VehicleDetailsModelData.fromJson(Map<String, dynamic> json) {
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
    data['image'] = this._image;
    return data;
  }
}

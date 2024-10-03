
class Profession {
  bool? _status;
  List<ProfessionData>? _data;

  Profession({bool? status, List<ProfessionData>? data}) {
    if (status != null) {
      this._status = status;
    }
    if (data != null) {
      this._data = data;
    }
  }

  bool? get status => _status;
  set status(bool? status) => _status = status;
  List<ProfessionData>? get data => _data;
  set data(List<ProfessionData>? data) => _data = data;

  Profession.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = <ProfessionData>[];
      json['data'].forEach((v) {
        _data!.add(new ProfessionData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProfessionData {
  int? _id;
  String? _uuid;
  String? _title;
  int? _createdBy;
  int? _updatedBy;
  int? _deletedBy;
  int? _deletedAt;
  String? _createdAt;
  String? _updatedAt;

  ProfessionData(
      {int? id,
        String? uuid,
        String? title,
        int? createdBy,
        int? updatedBy,
        int? deletedBy,
        int? deletedAt,
        String? createdAt,
        String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (uuid != null) {
      this._uuid = uuid;
    }
    if (title != null) {
      this._title = title;
    }
    if (createdBy != null) {
      this._createdBy = createdBy;
    }
    if (updatedBy != null) {
      this._updatedBy = updatedBy;
    }
    if (deletedBy != null) {
      this._deletedBy = deletedBy;
    }
    if (deletedAt != null) {
      this._deletedAt = deletedAt;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get uuid => _uuid;
  set uuid(String? uuid) => _uuid = uuid;
  String? get title => _title;
  set title(String? title) => _title = title;
  int? get createdBy => _createdBy;
  set createdBy(int? createdBy) => _createdBy = createdBy;
  int? get updatedBy => _updatedBy;
  set updatedBy(int? updatedBy) => _updatedBy = updatedBy;
  int? get deletedBy => _deletedBy;
  set deletedBy(int? deletedBy) => _deletedBy = deletedBy;
  int? get deletedAt => _deletedAt;
  set deletedAt(int? deletedAt) => _deletedAt = deletedAt;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  ProfessionData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _uuid = json['uuid'];
    _title = json['title'];
    _createdBy = json['created_by'];
    _updatedBy = json['updated_by'];
    _deletedBy = json['deleted_by'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['uuid'] = this._uuid;
    data['title'] = this._title;
    data['created_by'] = this._createdBy;
    data['updated_by'] = this._updatedBy;
    data['deleted_by'] = this._deletedBy;
    data['deleted_at'] = this._deletedAt;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}

class SectionModel {
  String? code;
  String? message;
  List<DataModel>? data;

  SectionModel({this.code, this.message, this.data});

  SectionModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataModel>[];
      json['data'].forEach((v) {
        data!.add(new DataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataModel {
  int? id;
  String? sectionSubject;
  String? sectionDate;
  String? sectionStartTime;
  String? sectionEndTime;

  DataModel(
      {this.id,
        this.sectionSubject,
        this.sectionDate,
        this.sectionStartTime,
        this.sectionEndTime});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectionSubject = json['sectionSubject'];
    sectionDate = json['sectionDate'];
    sectionStartTime = json['sectionStartTime'];
    sectionEndTime = json['sectionEndTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sectionSubject'] = this.sectionSubject;
    data['sectionDate'] = this.sectionDate;
    data['sectionStartTime'] = this.sectionStartTime;
    data['sectionEndTime'] = this.sectionEndTime;
    return data;
  }
}
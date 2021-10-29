class Example {
  String? statusid;
  String? driver;
  String? latitude;
  String? description;
  String? driverphone;
  String? insertdate;
  String? extid;
  String? status;
  String? longitude;

  Example(
      {this.statusid,
      this.driver,
      this.latitude,
      this.description,
      this.driverphone,
      this.insertdate,
      this.extid,
      this.status,
      this.longitude});

  Example.fromJson(Map<String, dynamic> json) {
    statusid = json['statusid'];
    driver = json['driver'];
    latitude = json['latitude'];
    description = json['description'];
    driverphone = json['driverphone'];
    insertdate = json['insertdate'];
    extid = json['extid'];
    status = json['status'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['statusid'] = statusid;
    data['driver'] = driver;
    data['latitude'] = latitude;
    data['description'] = description;
    data['driverphone'] = driverphone;
    data['insertdate'] = insertdate;
    data['extid'] = extid;
    data['status'] = status;
    data['longitude'] = longitude;
    return data;
  }
}
